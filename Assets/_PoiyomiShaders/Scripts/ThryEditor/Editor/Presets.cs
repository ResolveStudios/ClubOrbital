﻿using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEditor;
using UnityEngine;

namespace Thry.ThryEditor
{
    public class Presets
    {
        const string TAG_IS_PRESET = "isPreset";
        const string TAG_POSTFIX_IS_PRESET = "_isPreset";
        const string TAG_PRESET_NAME = "presetName";

        static Dictionary<Material, (Material, Material)> appliedPresets = new Dictionary<Material, (Material, Material)>();

        static string[] p_presetNames;
        static Material[] p_presetMaterials;
        static string[] presetNames { get
            {
                if (p_presetNames == null)
                {
                    p_presetMaterials = AssetDatabase.FindAssets("t:material")
                        .Select(g => AssetDatabase.LoadAssetAtPath<Material>(AssetDatabase.GUIDToAssetPath(g)))
                        .Where(m => IsPreset(m)).ToArray();
                    p_presetNames = p_presetMaterials.Select(m => m.GetTag(TAG_PRESET_NAME,false,m.name)).Prepend("").ToArray();
                }
                return p_presetNames;
            }
        }

        private static PresetsPopupGUI window;
        public static void PresetGUI(Rect r, ShaderEditor shaderEditor)
        {
            if(GUI.Button(r, "", Styles.icon_style_presets))
            {
                Event.current.Use();
                if (Event.current.button == 0)
                {
                    Vector2 pos = GUIUtility.GUIToScreenPoint(Event.current.mousePosition);
                    pos.x = Mathf.Min(EditorWindow.focusedWindow.position.x + EditorWindow.focusedWindow.position.width - 250, pos.x);
                    pos.y = Mathf.Min(EditorWindow.focusedWindow.position.y + EditorWindow.focusedWindow.position.height - 200, pos.y);

                    if (window != null)
                        window.Close();
                    window = ScriptableObject.CreateInstance<PresetsPopupGUI>();
                    window.position = new Rect(pos.x, pos.y, 250, 200);
                    string[] names = presetNames;
                    window.Init(names, p_presetMaterials, shaderEditor);
                    window.ShowPopup();
                }
                else
                {
                    EditorUtility.DisplayCustomMenu(r, presetNames.Select(s => new GUIContent(s)).ToArray(), 0, ApplyQuickPreset, shaderEditor);
                }
            }
        }

        static void ApplyQuickPreset(object userData, string[] options, int selected)
        {
            Apply(p_presetMaterials[selected - 1], userData as ShaderEditor);
        }

        public static void PresetEditorGUI(ShaderEditor shaderEditor)
        {
            if (shaderEditor._isPresetEditor)
            {
                EditorGUILayout.LabelField(Locale.editor.Get("preset_material_notify"), Styles.greenStyle);
                string name = shaderEditor.materials[0].GetTag(TAG_PRESET_NAME, false, "");
                EditorGUI.BeginChangeCheck();
                name = EditorGUILayout.TextField(Locale.editor.Get("preset_name"), name);
                if (EditorGUI.EndChangeCheck())
                {
                    shaderEditor.materials[0].SetOverrideTag(TAG_PRESET_NAME, name);
                    p_presetNames = null;
                }
            }
            if (appliedPresets.ContainsKey(shaderEditor.materials[0]))
            {
                if(GUILayout.Button(Locale.editor.Get("preset_revert")+appliedPresets[shaderEditor.materials[0]].Item1.name))
                {
                    Revert(shaderEditor);
                }
            }
        }

        public static void Apply(Material preset, ShaderEditor shaderEditor)
        {
            appliedPresets[shaderEditor.materials[0]] = (preset, new Material(shaderEditor.materials[0]));
            foreach (ShaderPart prop in shaderEditor.shaderParts)
            {
                if (IsPreset(preset, prop.materialProperty))
                {
                    prop.CopyFromMaterial(preset);
                }
            }
        }

        static void Revert(ShaderEditor shaderEditor)
        {
            Material key = shaderEditor.materials[0];
            Material preset = appliedPresets[key].Item1;
            Material prePreset = appliedPresets[key].Item2;
            foreach (ShaderPart prop in shaderEditor.shaderParts)
            {
                if (IsPreset(preset, prop.materialProperty))
                {
                    prop.CopyFromMaterial(prePreset);
                }
            }
            appliedPresets.Remove(key);
        }

        public static void SetProperty(Material m, MaterialProperty prop, bool value)
        {
            m.SetOverrideTag(prop.name + TAG_POSTFIX_IS_PRESET, value?"true":"");
        }

        public static bool IsPreset(Material m, MaterialProperty prop)
        {
            if (prop == null) return false;
            return m.GetTag(prop.name + TAG_POSTFIX_IS_PRESET, false, "") == "true";
        }

        public static bool ArePreset(Material[] mats)
        {
            return mats.All(m => IsPreset(m));
        }

        public static bool IsPreset(Material m)
        {
            return m.GetTag(TAG_IS_PRESET, false, "false") == "true";
        }

        [MenuItem("Assets/Thry/Mark as preset")]
        static void MarkAsPreset()
        {
            IEnumerable<Material> mats = Selection.assetGUIDs.Select(g => AssetDatabase.GUIDToAssetPath(g)).
                Where(p => AssetDatabase.GetMainAssetTypeAtPath(p) == typeof(Material)).Select(p => AssetDatabase.LoadAssetAtPath<Material>(p));
            foreach (Material m in mats)
            {
                m.SetOverrideTag(TAG_IS_PRESET, "true");
                if (m.GetTag("presetName", false, "") == "") m.SetOverrideTag("presetName", m.name);
            }
            p_presetNames = null;
        }

        [MenuItem("Assets/Thry/Mark as preset", true)]
        static bool MarkAsPresetValid()
        {
            return Selection.assetGUIDs.Select(g => AssetDatabase.GUIDToAssetPath(g)).
                All(p => AssetDatabase.GetMainAssetTypeAtPath(p) == typeof(Material));
        }

        [MenuItem("Assets/Thry/Remove as preset")]
        static void RemoveAsPreset()
        {
            IEnumerable<Material> mats = Selection.assetGUIDs.Select(g => AssetDatabase.GUIDToAssetPath(g)).
                Where(p => AssetDatabase.GetMainAssetTypeAtPath(p) == typeof(Material)).Select(p => AssetDatabase.LoadAssetAtPath<Material>(p));
            foreach (Material m in mats)
            {
                m.SetOverrideTag(TAG_IS_PRESET, "");
            }
            p_presetNames = null;
        }

        [MenuItem("Assets/Thry/Remove as preset", true)]
        static bool RemoveAsPresetValid()
        {
            return Selection.assetGUIDs.Select(g => AssetDatabase.GUIDToAssetPath(g)).
                All(p => AssetDatabase.GetMainAssetTypeAtPath(p) == typeof(Material));
        }
    }

    public class PresetsPopupGUI : EditorWindow
    {
        class PresetStruct
        {
            Dictionary<string,PresetStruct> dict;
            string name;
            Material preset;
            bool isOpen = false;
            bool isOn;
            public PresetStruct(string name)
            {
                this.name = name;
                dict = new Dictionary<string, PresetStruct>();
            }

            public PresetStruct GetSubStruct(string name)
            {
                name = name.Trim();
                if (dict.ContainsKey(name) == false)
                    dict.Add(name, new PresetStruct(name));
                return dict[name];
            }
            public void SetPreset(Material m)
            {
                preset = m;
            }
            public void StructGUI(PresetsPopupGUI popupGUI, bool reapply)
            {
                if(preset != null)
                {
                    EditorGUI.BeginChangeCheck();
                    isOn = EditorGUILayout.ToggleLeft(name, isOn);
                    if (EditorGUI.EndChangeCheck())
                    {
                        popupGUI.Revert();
                        popupGUI.reapply = true;
                    }
                    if (reapply && isOn)
                    {
                        Presets.Apply(preset, popupGUI.shaderEditor);
                    }
                }
                foreach(KeyValuePair<string,PresetStruct> struc in dict)
                {
                    Rect r = GUILayoutUtility.GetRect(new GUIContent(), Styles.dropDownHeader);
                    r.x = EditorGUI.indentLevel * 15;
                    r.width -= r.x;
                    GUI.Box(r, struc.Key, Styles.dropDownHeader);
                    if (Event.current.type == EventType.Repaint)
                    {
                        var toggleRect = new Rect(r.x + 4f, r.y + 2f, 13f, 13f);
                        EditorStyles.foldout.Draw(toggleRect, false, false, struc.Value.isOpen, false);
                    }
                    if (Event.current.type == EventType.MouseDown && GUILayoutUtility.GetLastRect().Contains(Event.current.mousePosition))
                    {
                        struc.Value.isOpen = !struc.Value.isOpen;
                        ShaderEditor.input.Use();
                    }
                    if (struc.Value.isOpen)
                    {
                        EditorGUI.indentLevel += 1;
                        struc.Value.StructGUI(popupGUI, reapply);
                        EditorGUI.indentLevel -= 1;
                    }
                }
            }
        }

        Material[] beforePreset;
        PresetStruct mainStruct;
        ShaderEditor shaderEditor;
        public void Init(string[] names, Material[] presets, ShaderEditor shaderEditor)
        {
            this.shaderEditor = shaderEditor;
            this.beforePreset = shaderEditor.materials.Select(m => new Material(m)).ToArray();
            mainStruct = new PresetStruct("");
            backgroundTextrure = new Texture2D(1,1);
            if (EditorGUIUtility.isProSkin) backgroundTextrure.SetPixel(0, 0, new Color(0.18f, 0.18f, 0.18f, 1));
            else backgroundTextrure.SetPixel(0, 0, new Color(0.9f, 0.9f, 0.9f, 1));
            backgroundTextrure.Apply();
            for (int i = 1; i < names.Length; i++)
            {
                string[] path = names[i].Split('/');
                PresetStruct addUnder = mainStruct;
                for (int j=0;j<path.Length; j++)
                {
                    addUnder = addUnder.GetSubStruct(path[j]);
                }
                addUnder.SetPreset(presets[i-1]);
            }
        }

        static Texture2D backgroundTextrure;

        Vector2 scroll;
        bool reapply;
        void OnGUI()
        {
            if (mainStruct == null) { this.Close(); return; }

            GUI.DrawTexture(new Rect(0, 0, position.width, 18), backgroundTextrure, ScaleMode.StretchToFill);

            GUILayout.Label("Presets", EditorStyles.boldLabel);

            GUILayout.BeginHorizontal();
            GUI.DrawTexture(GUILayoutUtility.GetRect(5, 5, GUILayout.ExpandHeight(true), GUILayout.ExpandWidth(false)), backgroundTextrure);
            scroll = GUILayout.BeginScrollView(scroll, GUILayout.Height(position.height - 55));

            if (reapply)
            {
                mainStruct.StructGUI(this, true);
                shaderEditor.ForceRedraw();
                reapply = false;
            }
            else
            {
                mainStruct.StructGUI(this, false);
            }

            GUILayout.EndScrollView();
            GUI.DrawTexture(GUILayoutUtility.GetRect(5, 5, GUILayout.ExpandHeight(true), GUILayout.ExpandWidth(false)), backgroundTextrure);
            GUILayout.EndHorizontal();

            if (GUI.Button(new Rect(5, this.position.height - 35, this.position.width / 2 - 5, 30), "Apply"))
            {
                this.Close();
            }
                
            if (GUI.Button(new Rect(this.position.width / 2, this.position.height - 35, this.position.width / 2 - 5, 30), "Discard"))
            {
                Revert();
                shaderEditor.ForceRedraw();
                this.Close();
            }

            GUI.DrawTexture(new Rect(5, position.height - 5, position.width - 10, 5), backgroundTextrure);
        }

        void Revert()
        {
            for (int i = 0; i < shaderEditor.materials.Length; i++)
            {
                shaderEditor.materials[i].CopyPropertiesFromMaterial(beforePreset[i]);
            }
        }
    }
}