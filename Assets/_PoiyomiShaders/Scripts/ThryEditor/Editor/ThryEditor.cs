// Material/Shader Inspector for Unity 2017/2018
// Copyright (C) 2019 Thryrallo

using System.Collections.Generic;
using System.IO;
using System.Text.RegularExpressions;
using UnityEditor;
using UnityEngine;
using Thry;
using System;
using System.Reflection;
using System.Linq;
using Thry.ThryEditor;

namespace Thry
{
    public class ShaderEditor : ShaderGUI
    {
        public const string EXTRA_OPTIONS_PREFIX = "--";
        public const float MATERIAL_NOT_RESET = 69.12f;

        public const string PROPERTY_NAME_MASTER_LABEL = "shader_master_label";
        public const string PROPERTY_NAME_LABEL_FILE = "shader_properties_label_file";
        public const string PROPERTY_NAME_LOCALE = "shader_properties_locale";
        public const string PROPERTY_NAME_ON_SWAP_TO_ACTIONS = "shader_on_swap_to";
        public const string PROPERTY_NAME_SHADER_VERSION = "shader_version";

        // Stores the different shader properties
        public ShaderGroup mainGroup;

        // UI Instance Variables

        public bool show_search_bar;
        private string entered_search_term = "";
        private string applied_search_term = "";

        // shader specified values
        private ShaderHeaderProperty shaderHeader = null;
        private List<FooterButton> footers;

        // sates
        private static bool reloadNextDraw = false;
        private bool firstOnGUICall = true;
        private bool wasUsed = false;

        public static InputEvent input = new InputEvent();
        // Contains Editor Data
        public static ShaderEditor active;

        //EditorData
        public MaterialEditor editor;
        public MaterialProperty[] properties;
        public ShaderEditor gui;
        public Material[] materials;
        public Shader shader;
        public ShaderPart currentProperty;
        public Dictionary<string, ShaderProperty> propertyDictionary;
        public List<ShaderPart> shaderParts;
        public List<ShaderProperty> textureArrayProperties;
        public bool firstCall;
        public bool show_HeaderHider;
        public bool use_ShaderOptimizer;
        public bool isLockedMaterial;
        public string animPropertySuffix;

        //Shader Versioning
        private Version shaderVersionLocal;
        private Version shaderVersionRemote;
        private bool hasShaderUpdateUrl = false;
        private bool isShaderUpToDate = true;
        private string shaderUpdateUrl = null;

        //other
        ShaderProperty ShaderOptimizerProperty { get; set; }

        private DefineableAction[] on_swap_to_actions = null;
        private bool swapped_to_shader = false;

        public bool _isDrawing { get; private set; } = false;
        public bool _isPresetEditor { get; private set; } = false;

        //-------------Init functions--------------------

        private Dictionary<string, string> LoadDisplayNamesFromFile()
        {
            //load display names from file if it exists
            MaterialProperty label_file_property = GetMaterialProperty(PROPERTY_NAME_LABEL_FILE);
            Dictionary<string, string> labels = new Dictionary<string, string>();
            if (label_file_property != null)
            {
                string[] guids = AssetDatabase.FindAssets(label_file_property.displayName);
                if (guids.Length == 0)
                {
                    Debug.LogWarning("Label File could not be found");
                    return labels;
                }
                string path = AssetDatabase.GUIDToAssetPath(guids[0]);
                string[] data = Regex.Split(Thry.FileHelper.ReadFileIntoString(path), @"\r?\n");
                foreach (string d in data)
                {
                    string[] set = Regex.Split(d, ":=");
                    if (set.Length > 1) labels[set[0]] = set[1];
                }
            }
            return labels;
        }

        private PropertyOptions ExtractExtraOptionsFromDisplayName(ref string displayName)
        {
            if (displayName.Contains(EXTRA_OPTIONS_PREFIX))
            {
                string[] parts = displayName.Split(new string[] { EXTRA_OPTIONS_PREFIX }, 2, System.StringSplitOptions.None);
                displayName = parts[0];
                parts[1] = parts[1].Replace("''", "\"");
                PropertyOptions options = Parser.ParseToObject<PropertyOptions>(parts[1]);
                if (options != null)
                {
                    if (options.condition_showS != null)
                    {
                        options.condition_show = DefineableCondition.Parse(options.condition_showS);
                    }
                    if (options.on_value != null)
                    {
                        options.on_value_actions = PropertyValueAction.ParseToArray(options.on_value);
                    }
                    return options;
                }
            }
            return new PropertyOptions();
        }

        private enum ThryPropertyType
        {
            none, property, master_label, footer, header, headerWithEnd, legacy_header, legacy_header_end, legacy_header_start, group_start, group_end, instancing, dsgi, lightmap_flags, locale, on_swap_to, space, shader_version
        }

        private ThryPropertyType GetPropertyType(MaterialProperty p, PropertyOptions options)
        {
            string name = p.name;
            MaterialProperty.PropFlags flags = p.flags;

            if (DrawingData.lastPropertyDrawerType == DrawerType.Header)
                return (DrawingData.lastPropertyDrawer as ThryHeaderDrawer).GetEndProperty() != null ? ThryPropertyType.headerWithEnd : ThryPropertyType.header;

            if (flags == MaterialProperty.PropFlags.HideInInspector)
            {
                if (name == PROPERTY_NAME_MASTER_LABEL)
                    return ThryPropertyType.master_label;
                if (name == PROPERTY_NAME_ON_SWAP_TO_ACTIONS)
                    return ThryPropertyType.on_swap_to;
                if (name == PROPERTY_NAME_SHADER_VERSION)
                    return ThryPropertyType.shader_version;

                if (name.StartsWith("m_start", StringComparison.Ordinal))
                    return ThryPropertyType.legacy_header_start;
                if (name.StartsWith("m_end", StringComparison.Ordinal))
                    return ThryPropertyType.legacy_header_end;
                if (name.StartsWith("m_", StringComparison.Ordinal))
                    return ThryPropertyType.legacy_header;
                if (name.StartsWith("g_start", StringComparison.Ordinal))
                    return ThryPropertyType.group_start;
                if (name.StartsWith("g_end", StringComparison.Ordinal))
                    return ThryPropertyType.group_end;
                if (name.StartsWith("footer_", StringComparison.Ordinal))
                    return ThryPropertyType.footer;
                if (name == "Instancing")
                    return ThryPropertyType.instancing;
                if (name == "DSGI")
                    return ThryPropertyType.dsgi;
                if (name == "LightmapFlags")
                    return ThryPropertyType.lightmap_flags;
                if (name == PROPERTY_NAME_LOCALE)
                    return ThryPropertyType.locale;
                if (name.StartsWith("space"))
                    return ThryPropertyType.space;
            }
            else if(flags.HasFlag(MaterialProperty.PropFlags.HideInInspector) == false)
            {
                if (!options.hide_in_inspector)
                    return ThryPropertyType.property;
            }
            return ThryPropertyType.none;
        }

        public Locale locale;

        private void LoadLocales()
        {
            MaterialProperty locales_property = GetMaterialProperty(PROPERTY_NAME_LOCALE);
            locale = null;
            if (locales_property != null)
            {
                string displayName = locales_property.displayName;
                PropertyOptions options = ExtractExtraOptionsFromDisplayName(ref displayName);
                locale = new Locale(options.file_name);
                locale.selected_locale_index = (int)locales_property.floatValue;
            }
        }

        //finds all properties and headers and stores them in correct order
        private void CollectAllProperties()
        {
            //load display names from file if it exists
            MaterialProperty[] props = properties;
            Dictionary<string, string> labels = LoadDisplayNamesFromFile();
            LoadLocales();

            propertyDictionary = new Dictionary<string, ShaderProperty>();
            shaderParts = new List<ShaderPart>();
            mainGroup = new ShaderGroup(this); //init top object that all Shader Objects are childs of
            Stack<ShaderGroup> headerStack = new Stack<ShaderGroup>(); //header stack. used to keep track if editorData header to parent new objects to
            headerStack.Push(mainGroup); //add top object as top object to stack
            headerStack.Push(mainGroup); //add top object a second time, because it get's popped with first actual header item
            footers = new List<FooterButton>(); //init footer list
            int headerCount = 0;

            for (int i = 0; i < props.Length; i++)
            {
                string displayName = props[i].displayName;

                //Load from label file
                if (labels.ContainsKey(props[i].name)) displayName = labels[props[i].name];

                //Check for locale
                if (locale != null)
                {
                    if (displayName.StartsWith("locale::", StringComparison.Ordinal))
                    {
                        if (locale.Constains(displayName))
                        {
                            displayName = locale.Get(displayName);
                        }
                    }
                }
                //extract json data from display name
                PropertyOptions options = ExtractExtraOptionsFromDisplayName(ref displayName);

                int offset = options.offset + headerCount;

                DrawingData.ResetLastDrawerData();
                editor.GetPropertyHeight(props[i]);

                ThryPropertyType type = GetPropertyType(props[i], options);
                switch (type)
                {
                    case ThryPropertyType.header:
                        headerStack.Pop();
                        break;
                    case ThryPropertyType.legacy_header:
                        headerStack.Pop();
                        break;
                    case ThryPropertyType.headerWithEnd:
                    case ThryPropertyType.legacy_header_start:
                        offset = options.offset + ++headerCount;
                        break;
                    case ThryPropertyType.legacy_header_end:
                        headerStack.Pop();
                        headerCount--;
                        break;
                    case ThryPropertyType.on_swap_to:
                        on_swap_to_actions = options.actions;
                        break;
                }
                ShaderProperty NewProperty = null;
                ShaderPart newPart = null;
                switch (type)
                {
                    case ThryPropertyType.master_label:
                        shaderHeader = new ShaderHeaderProperty(this, props[i], displayName, 0, options, false);
                        break;
                    case ThryPropertyType.footer:
                        footers.Add(new FooterButton(Parser.ParseToObject<ButtonData>(displayName)));
                        break;
                    case ThryPropertyType.header:
                    case ThryPropertyType.headerWithEnd:
                    case ThryPropertyType.legacy_header:
                    case ThryPropertyType.legacy_header_start:
                        ShaderHeader newHeader = new ShaderHeader(this, props[i], editor, displayName, offset, options);
                        headerStack.Peek().addPart(newHeader);
                        headerStack.Push(newHeader);
                        newPart = newHeader;
                        break;
                    case ThryPropertyType.group_start:
                        ShaderGroup new_group = new ShaderGroup(this, options);
                        headerStack.Peek().addPart(new_group);
                        headerStack.Push(new_group);
                        newPart = new_group;
                        break;
                    case ThryPropertyType.group_end:
                        headerStack.Pop();
                        break;
                    case ThryPropertyType.none:
                    case ThryPropertyType.property:
                        if (props[i].type == MaterialProperty.PropType.Texture)
                            NewProperty = new TextureProperty(this, props[i], displayName, offset, options, props[i].flags.HasFlag(MaterialProperty.PropFlags.NoScaleOffset) == false, !DrawingData.lastPropertyUsedCustomDrawer, i);
                        else
                            NewProperty = new ShaderProperty(this, props[i], displayName, offset, options, false, i);
                        break;
                    case ThryPropertyType.lightmap_flags:
                        NewProperty = new GIProperty(this, props[i], displayName, offset, options, false);
                        break;
                    case ThryPropertyType.dsgi:
                        NewProperty = new DSGIProperty(this, props[i], displayName, offset, options, false);
                        break;
                    case ThryPropertyType.instancing:
                        NewProperty = new InstancingProperty(this, props[i], displayName, offset, options, false);
                        break;
                    case ThryPropertyType.locale:
                        NewProperty = new LocaleProperty(this, props[i], displayName, offset, options, false);
                        break;
                    case ThryPropertyType.shader_version:
                        shaderVersionRemote = new Version(WebHelper.GetCachedString(options.remote_version_url));
                        shaderVersionLocal = new Version(displayName);
                        isShaderUpToDate = shaderVersionLocal >= shaderVersionRemote;
                        shaderUpdateUrl = options.generic_string;
                        hasShaderUpdateUrl = shaderUpdateUrl != null;
                        break;
                }
                if (NewProperty != null)
                {
                    newPart = NewProperty;
                    if (propertyDictionary.ContainsKey(props[i].name))
                        continue;
                    propertyDictionary.Add(props[i].name, NewProperty);
                    if (type != ThryPropertyType.none)
                        headerStack.Peek().addPart(NewProperty);
                }
                //if new header is at end property
                if (headerStack.Peek() is ShaderHeader && (headerStack.Peek() as ShaderHeader).GetEndProperty() == props[i].name)
                {
                    headerStack.Pop();
                    headerCount--;
                }
                if (newPart != null)
                {
                    shaderParts.Add(newPart);
                }
            }
        }


        // Not in use cause getPropertyHandlerMethod is really expensive
        private void HandleKeyworDrawers()
        {
            foreach (MaterialProperty p in properties)
            {
                HandleKeyworDrawers(p);
            }
        }

        // Not in use cause getPropertyHandlerMethod is really expensive
        private void HandleKeyworDrawers(MaterialProperty p)
        {
            Type materialPropertyDrawerType = typeof(UnityEditor.Editor).Assembly.GetType("UnityEditor.MaterialPropertyHandler");
            MethodInfo getPropertyHandlerMethod = materialPropertyDrawerType.GetMethod("GetShaderPropertyHandler", BindingFlags.NonPublic | BindingFlags.Public | BindingFlags.Static | BindingFlags.FlattenHierarchy);
            PropertyInfo drawerProperty = materialPropertyDrawerType.GetProperty("propertyDrawer");

            Type materialToggleDrawerType = typeof(UnityEditor.Editor).Assembly.GetType("UnityEditor.MaterialToggleDrawer");
            FieldInfo keyWordField = materialToggleDrawerType.GetField("keyword", BindingFlags.Instance | BindingFlags.NonPublic);
            //Handle keywords
            object propertyHandler = getPropertyHandlerMethod.Invoke(null, new object[] { shader, p.name });
            //if has custom drawer
            if (propertyHandler != null)
            {
                object propertyDrawer = drawerProperty.GetValue(propertyHandler, null);
                //if custom drawer exists
                if (propertyDrawer != null)
                {
                    // if is keyword drawer make sure all materials have the keyworkd enabled / disabled depending on their value
                    if (propertyDrawer.GetType().ToString() == "UnityEditor.MaterialToggleDrawer")
                    {
                        object keyword = keyWordField.GetValue(propertyDrawer);
                        if (keyword != null)
                        {
                            foreach (Material m in materials)
                            {
                                if (m.GetFloat(p.name) == 1)
                                    m.EnableKeyword((string)keyword);
                                else
                                    m.DisableKeyword((string)keyword);
                            }
                        }
                    }
                }
            }
        }

        //-------------Draw Functions----------------

        public void InitlizeThryUI()
        {
            Config config = Config.Singleton;
            active = this;

            //get material targets
            materials = editor.targets.Select(o => o as Material).ToArray();

            shader = materials[0].shader;

            animPropertySuffix = ShaderOptimizer.GetAnimPropertySuffix(materials[0]);

            _isPresetEditor = materials.Length == 1 && Presets.ArePreset(materials);

            //collect shader properties
            CollectAllProperties();

            if (ShaderOptimizer.IsShaderUsingThryOptimizer(shader))
            {
                ShaderOptimizerProperty = propertyDictionary[ShaderOptimizer.GetOptimizerPropertyName(shader)];
                if(ShaderOptimizerProperty != null) ShaderOptimizerProperty.exempt_from_locked_disabling = true;
            }

            AddResetProperty();

            firstOnGUICall = false;
        }

        private Dictionary<string, MaterialProperty> materialPropertyDictionary;
        public MaterialProperty GetMaterialProperty(string name)
        {
            if (materialPropertyDictionary == null)
            {
                materialPropertyDictionary = new Dictionary<string, MaterialProperty>();
                foreach (MaterialProperty p in properties)
                    if (materialPropertyDictionary.ContainsKey(p.name) == false) materialPropertyDictionary.Add(p.name, p);
            }
            if (materialPropertyDictionary.ContainsKey(name))
                return materialPropertyDictionary[name];
            return null;
        }

        private void AddResetProperty()
        {
            if (materials[0].HasProperty("shader_is_using_thry_editor") == false)
            {
                EditorChanger.AddThryProperty(materials[0].shader);
            }
            materials[0].SetFloat("shader_is_using_thry_editor", 69);
        }

        public override void OnClosed(Material material)
        {
            base.OnClosed(material);
            firstOnGUICall = true;
        }

        public override void AssignNewShaderToMaterial(Material material, Shader oldShader, Shader newShader)
        {
            //Unity sets the render queue to the shader defult when changing shader
            //This seems to be some deeper process that cant be disabled so i just set it again after the swap
            //Even material.shader = newShader resets the queue. (this is actually the only thing the base function does)
            int previousQueue = material.renderQueue;
            base.AssignNewShaderToMaterial(material, oldShader, newShader);
            material.renderQueue = previousQueue;
            reloadNextDraw = true;
            swapped_to_shader = true;
        }

        void InitEditorData(MaterialEditor materialEditor)
        {
            editor = materialEditor;
            gui = this;
            textureArrayProperties = new List<ShaderProperty>();
            firstCall = true;
        }

        public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] props)
        {
            _isDrawing = true;
            //Init
            bool reloadUI = firstOnGUICall || (reloadNextDraw && Event.current.type == EventType.Layout) || (materialEditor.target as Material).shader != shader;
            if (reloadUI) 
            {
                InitEditorData(materialEditor);
                properties = props;
                InitlizeThryUI();
            }

            //Update Data
            properties = props;
            shader = materials[0].shader;
            input.Update(isLockedMaterial);

            active = this;

            GUIManualReloadButton();
            GUIShaderVersioning();

            GUITopBar();
            GUISearchBar();
            Presets.PresetEditorGUI(this);

            //PROPERTIES
            foreach (ShaderPart part in mainGroup.parts)
            {
                part.Draw();
            }

            //Render Queue selection
            if (Config.Singleton.showRenderQueue) materialEditor.RenderQueueField();

            BetterTooltips.DrawActive();

            GUIFooters();

            HandleEvents();

            _isDrawing = false;
        }

        private void GUIManualReloadButton()
        {
            if (Config.Singleton.showManualReloadButton)
            {
                if(GUILayout.Button("Manual Reload"))
                {
                    this.Reload();
                }
            }
        }

        private void GUIShaderVersioning()
        {
            if (!isShaderUpToDate)
            {
                Rect r = EditorGUILayout.GetControlRect(false, hasShaderUpdateUrl ? 30 : 15);
                EditorGUI.LabelField(r, $"[New Shader Version available] {shaderVersionLocal} -> {shaderVersionRemote}" + (hasShaderUpdateUrl ? "\n    Click here to download." : ""), Styles.redStyle);
                if(input.HadMouseDownRepaint && hasShaderUpdateUrl && GUILayoutUtility.GetLastRect().Contains(input.mouse_position)) Application.OpenURL(shaderUpdateUrl);
            }
        }

        private void GUITopBar()
        {
            //if header is texture, draw it first so other ui elements can be positions below
            if (shaderHeader != null && shaderHeader.options.texture != null) shaderHeader.Draw();
            Rect mainHeaderRect = EditorGUILayout.BeginHorizontal();
            //draw editor settings button
            if (GuiHelper.ButtonWithCursor(Styles.icon_style_settings, 25, 25))
            {
                Thry.Settings window = Thry.Settings.getInstance();
                window.Show();
                window.Focus();
            }
            if (GuiHelper.ButtonWithCursor(Styles.icon_style_search, 25, 25))
            {
                show_search_bar = !show_search_bar;
                if(!show_search_bar) ClearSearch();
            }
            Rect presetR = GUILayoutUtility.GetRect(25, 25);
            Presets.PresetGUI(presetR, this);

            //draw master label text after ui elements, so it can be positioned between
            if (shaderHeader != null) shaderHeader.Draw(new CRect(mainHeaderRect));

            //GUILayout.Label("Thryrallo",GUILayout.ExpandWidth(true));
            GUILayout.FlexibleSpace();  
            GUILayout.Label("@UI by Thryrallo", Styles.made_by_style, GUILayout.Height(25), GUILayout.MaxWidth(100));
            EditorGUILayout.EndHorizontal();
        }

        private void GUISearchBar()
        {
            if (show_search_bar)
            {
                EditorGUI.BeginChangeCheck();
                entered_search_term = EditorGUILayout.TextField(entered_search_term);
                if (EditorGUI.EndChangeCheck())
                {
                    applied_search_term = entered_search_term.ToLower();
                    UpdateSearch(mainGroup);
                }
            }
        }

        private void GUIFooters()
        {
            try
            {
                FooterButton.DrawList(footers);
            }
            catch (Exception ex)
            {
                Debug.LogWarning(ex);
            }
            if (GUILayout.Button("@UI Made by Thryrallo", Styles.made_by_style))
                Application.OpenURL("https://www.twitter.com/thryrallo");
            EditorGUIUtility.AddCursorRect(GUILayoutUtility.GetLastRect(), MouseCursor.Link);
        }

        private void HandleEvents()
        {
            Event e = Event.current;
            //if reloaded, set reload to false
            if (reloadNextDraw && Event.current.type == EventType.Layout) reloadNextDraw = false;

            //if was undo, reload
            bool isUndo = (e.type == EventType.ExecuteCommand || e.type == EventType.ValidateCommand) && e.commandName == "UndoRedoPerformed";
            if (isUndo) reloadNextDraw = true;


            //on swap
            if (on_swap_to_actions != null && swapped_to_shader)
            {
                foreach (DefineableAction a in on_swap_to_actions)
                    a.Perform();
                on_swap_to_actions = null;
                swapped_to_shader = false;
            }

            //test if material has been reset
            if (wasUsed && e.type == EventType.Repaint)
            {
                if (materials[0].HasProperty("shader_is_using_thry_editor") && materials[0].GetFloat("shader_is_using_thry_editor") != 69)
                {
                    reloadNextDraw = true;
                    HandleReset();
                    wasUsed = true;
                }
            }

            if (e.type == EventType.Used) wasUsed = true;
            if (input.HadMouseDownRepaint) input.HadMouseDown = false;
            input.HadMouseDownRepaint = false;
            firstCall = false;
            materialPropertyDictionary = null;
        }

        //iterate the same way drawing would iterate
        //if display part, display all parents parts
        private void UpdateSearch(ShaderPart part)
        {
            part.has_not_searchedFor = part.content.text.ToLower().Contains(applied_search_term) == false;
            if (part is ShaderGroup)
            {
                foreach (ShaderPart p in (part as ShaderGroup).parts)
                {
                    UpdateSearch(p);
                    part.has_not_searchedFor &= p.has_not_searchedFor;
                }
            }
        }

        private void ClearSearch()
        {
            applied_search_term = "";
            UpdateSearch(mainGroup);
        }

        private void HandleReset()
        {
            MaterialLinker.UnlinkAll(materials[0]);
            ShaderOptimizer.DeleteTags(materials);
        }

        public static void reload()
        {
            reloadNextDraw = true;
        }

        public static void loadValuesFromMaterial()
        {
            if (active.editor != null)
            {
                try
                {
                    Material m = ((Material)active.editor.target);
                    foreach (MaterialProperty property in active.properties)
                    {
                        switch (property.type)
                        {
                            case MaterialProperty.PropType.Float:
                            case MaterialProperty.PropType.Range:
                                property.floatValue = m.GetFloat(property.name);
                                break;
                            case MaterialProperty.PropType.Texture:
                                property.textureValue = m.GetTexture(property.name);
                                break;
                            case MaterialProperty.PropType.Color:
                                property.colorValue = m.GetColor(property.name);
                                break;
                            case MaterialProperty.PropType.Vector:
                                property.vectorValue = m.GetVector(property.name);
                                break;
                        }

                    }
                }
                catch (System.Exception e)
                {
                    Debug.Log(e.ToString());
                }
            }
        }

        public static void propertiesChanged()
        {
            if (active.editor != null)
            {
                try
                {
                    active.editor.PropertiesChanged();
                }
                catch (System.Exception e)
                {
                    Debug.Log(e.ToString());
                }
            }
        }

        public static void addUndo(string label)
        {
            if (active.editor != null)
            {
                try
                {
                    active.editor.RegisterPropertyChangeUndo(label);
                }
                catch (System.Exception e)
                {
                    Debug.Log(e.ToString());
                }
            }
        }

        public void ForceRedraw()
        {
            if (materials.Length > 0)
            {
                EditorUtility.SetDirty(materials[0]);
            }
        }

        public static void Repaint()
        {
            if (ShaderEditor.active != null)
            {
                active.ForceRedraw();
            }
        }

        public void Reload()
        {
            this.firstOnGUICall = true;
            this.swapped_to_shader = true;
            this.ForceRedraw();
        }

        public static void ReloadActive()
        {
            if (ShaderEditor.active != null)
            {
                active.Reload();
            }
        }

        private static string edtior_directory_path;
        public static string GetShaderEditorDirectoryPath()
        {
            if (edtior_directory_path == null)
            {
                string[] guids = AssetDatabase.FindAssets("ShaderEditor");
                foreach (string g in guids)
                {
                    string p = AssetDatabase.GUIDToAssetPath(g);
                    if (p.EndsWith("/ShaderEditor.cs"))
                    {
                        edtior_directory_path = Directory.GetParent(Path.GetDirectoryName(p)).FullName;
                        break;
                    }
                }
            }
            return edtior_directory_path;
        }

        [MenuItem("Thry/Twitter")]
        static void Init()
        {
            Application.OpenURL("https://www.twitter.com/thryrallo");
        }
    }
}
