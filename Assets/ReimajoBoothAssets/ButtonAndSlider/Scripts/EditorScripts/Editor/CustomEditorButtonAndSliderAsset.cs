//#define DEBUG_TEST
#region Usings
using UnityEngine;
using UnityEditor;
using VRC.Udon;
using System.Collections.Immutable;
using VRC.Udon.Common.Interfaces;
using System;
using VRC.Udon.Common;
using UdonSharp;
using UdonSharpEditor;
using ReimajoBoothAssets;
using VRC.SDK3.Components;
using System.Collections.Generic;
using System.Threading.Tasks;
#endregion Usings
/// <summary>
/// Script from Reimajo purchased at https://reimajo.booth.pm/, to be used in the worlds of the person who bought the asset only.
/// Make sure to join my discord to receive update notifications for this asset and support: https://discord.gg/SWkNA394Mm
/// If you have any issues, please contact me on Discord (https://discord.gg/SWkNA394Mm) or Booth or Twitter https://twitter.com/ReimajoChan
/// Do not give any of the asset files or parts of them to anyone else.
/// </summary>
namespace ReimajoBoothAssetsEditorScripts
{
    #region AffectedScripts
    [CustomEditor(typeof(ReimajoBoothAssets.SoundEventLoop), true, isFallback = true)]
    [CanEditMultipleObjects]
    public class CustomEditorSoundEventLoop : CustomEditorButtonAndSliderAsset
    {
    }
    [CustomEditor(typeof(ReimajoBoothAssets.CrossplayInitialization), true, isFallback = true)]
    [CanEditMultipleObjects]
    public class CustomEditorCrossplayInitialization : CustomEditorButtonAndSliderAsset
    {
    }
    [CustomEditor(typeof(ReimajoBoothAssets.ChairToggle), true, isFallback = true)]
    [CanEditMultipleObjects]
    public class CustomEditorChairToggle : CustomEditorButtonAndSliderAsset
    {
    }
    [CustomEditor(typeof(ReimajoBoothAssets.ColliderToggle), true, isFallback = true)]
    [CanEditMultipleObjects]
    public class CustomEditorColliderToggle : CustomEditorButtonAndSliderAsset
    {
    }
    [CustomEditor(typeof(ReimajoBoothAssets.TouchButtonNoGui), true, isFallback = true)]
    [CanEditMultipleObjects]
    public class CustomEditorTouchButtonNoGui : CustomEditorButtonAndSliderAsset
    {
    }
    [CustomEditor(typeof(ReimajoBoothAssets.AreaToggle), true, isFallback = true)]
    [CanEditMultipleObjects]
    public class CustomEditorAreaToggle : CustomEditorButtonAndSliderAsset
    {
    }
    [CustomEditor(typeof(ReimajoBoothAssets.SliderController), true, isFallback = true)]
    [CanEditMultipleObjects]
    public class CustomEditorSlider : CustomEditorButtonAndSliderAsset
    {
    }
    [CustomEditor(typeof(ReimajoBoothAssets.SyncedSliderController), true, isFallback = true)]
    [CanEditMultipleObjects]
    public class CustomEditorSyncedSlider : CustomEditorButtonAndSliderAsset
    {
    }
    [CustomEditor(typeof(ReimajoBoothAssets.ButtonController), true, isFallback = true)]
    [CanEditMultipleObjects]
    public class CustomEditorButton : CustomEditorButtonAndSliderAsset
    {
    }
    [CustomEditor(typeof(ReimajoBoothAssets.RadioButtonController), true, isFallback = true)]
    [CanEditMultipleObjects]
    public class CustomEditorRadioButton : CustomEditorButtonAndSliderAsset
    {
    }
    [CustomEditor(typeof(ReimajoBoothAssets.SyncedButtonController), true, isFallback = true)]
    [CanEditMultipleObjects]
    public class CustomEditorSyncedButton : CustomEditorButtonAndSliderAsset
    {
    }
    [CustomEditor(typeof(ReimajoBoothAssets.Whitelist), true, isFallback = true)]
    [CanEditMultipleObjects]
    public class CustomEditorWhitelist : CustomEditorButtonAndSliderAsset
    {
    }
    [CustomEditor(typeof(ReimajoBoothAssets.VRInteractionToggleScript), true, isFallback = true)]
    [CanEditMultipleObjects]
    public class CustomEditorVRInteractionToggleScript : CustomEditorButtonAndSliderAsset
    {
    }
    [CustomEditor(typeof(ReimajoBoothAssets.CycleButtonController), true, isFallback = true)]
    [CanEditMultipleObjects]
    public class CustomEditorCycleButtonController : CustomEditorButtonAndSliderAsset
    {
    }
    #endregion AffectedScripts
    #region AutoStart
    /// <summary>
    /// We use this class to setup the project at start automatically 
    /// See https://docs.unity3d.com/Manual/RunningEditorCodeOnLaunch.html
    /// </summary>
    [InitializeOnLoad]
    public class StartupButtonAndSlider
    {
        /// <summary>
        /// This is called when the Editor is started and ensures that the project has the needed tag
        /// </summary>
        static StartupButtonAndSlider()
        {
            //adding a delay to ensure that the project is fully loaded
            UpdateAfterDelay(20);
        }
        public async static void UpdateAfterDelay(float seconds)
        {
            await Task.Delay((int)(1000 * seconds)); //update the project after x seconds to ensure the scene has already loaded.
            CustomEditorButtonAndSliderAsset.SetupProject();
        }
    }
    #endregion AutoStart
    public class CustomEditorButtonAndSliderAsset : Editor
    {
        //############################################
        public const string VERSION = "V2.7.1";
        public const string PRODUCT_NAME = "Button and Slider";
        public const string DOCUMENTATION = @"https://docs.google.com/document/d/1uN9viZNUo8AzQV6CKFMLwx4qPgSEsB0gNTUVLWVxPu0/";
        //############################################
        #region Setup
        UdonSharpBehaviour _script;
        GameObject _scriptObject;
        private void OnEnable()
        {
            try
            {
                _script = (UdonSharpBehaviour)target;
                _scriptObject = _script.gameObject;
            }
            catch { }
        }
        public static void SetupProject()
        {
            ReimajoEditorBase.AddTagIfNeeded(tagName: TAG_NAME_PLAYER_CALIBRATION);
            ReimajoEditorBase.AddTagIfNeeded(tagName: TAG_NAME_TOGGLED_CHAIR);
            ReimajoEditorBase.AddTagIfNeeded(tagName: TAG_NAME_TOGGLED_COLLIDER);
            ReimajoEditorBase.AddTagIfNeeded(tagName: TAG_NAME_AREA_TOGGLE_OBJECT);
            ReimajoEditorBase.AddTagIfNeeded(tagName: TAG_NAME_AREA_TOGGLE_BOOL);
        }
        #endregion
        #region BaseEditor
        private bool _lastHasLineDrawn = false;
        public override void OnInspectorGUI()
        {
            ReimajoEditorBase.AddStandardHeader(PRODUCT_NAME, VERSION, DOCUMENTATION, target);
            _lastHasLineDrawn = true;
            Color cachedGuiColor = GUI.color;
            serializedObject.Update();
            SerializedProperty property = serializedObject.GetIterator();
            bool isVisible = property.NextVisible(true);
            if (isVisible)
                do
                {
                    GUI.color = cachedGuiColor;
                    this.HandleProperty(property);
                } while (property.NextVisible(false));
            EditorGUILayout.Space();
            serializedObject.ApplyModifiedProperties();
        }
        #endregion BaseEditor
        #region Constants
        private const int MIRROR_REFLECTION_LAYER = 18;
        //-------------- tag names ----------------------------------------------
        private const string TAG_NAME_TOGGLED_CHAIR = "ToggledChair";
        private const string TAG_NAME_TOGGLED_COLLIDER = "ToggledCollider";
        private const string TAG_NAME_PLAYER_CALIBRATION = "PlayerCalibration";
        private const string TAG_NAME_AREA_TOGGLE_OBJECT = "AreaToggle_Object";
        private const string TAG_NAME_AREA_TOGGLE_BOOL = "AreaToggle_ScriptBool";
        //-------------- field names --------------------------------------------
        private const string FIELD_NAME_WHITELISTED_OBJECTS = "_objectsForWhitelistedUsersOnly";
        private const string FIELD_NAME_TOGGLED_CHAIRS = "_toggledChairs";
        private const string FIELD_NAME_TOGGLED_COLLIDERS = "_toggledColliders";
        private const string FIELD_NAME_INVERTED_AREA_TOGGLE = "_inverted";
        private const string FIELD_NAME_SYNCED_SLIDERS = "_syncedSliders";
        private const string FIELD_NAME_SYNCED_BUTTONS = "_syncedButtons";
        private const string FIELD_NAME_RECEIVING_BEHAVIOURS = "_receivingUdonSharpBehaviours";
        private const string FIELD_NAME_NETWORK_SYNCED_BUTTON = "_networkSyncedButton";
        private const string FIELD_NAME_NETWORK_SYNCED_SLIDER = "_networkSyncedSlider";
        private const string FIELD_NAME_TARGET_SCRIPT = "_targetScript";
        private const string FIELD_NAME_TOGGLED_GAMEOBJECTS = "_toggledGameObjects";
        private const string FIELD_NAME_IS_ON_AT_START = "_isOnAtStart";
        private const string FIELD_NAME_DEFAULT_VALUE = "_sliderValueAtStart";
        private const string FIELD_NAME_SLIDER_VARIABLE_NAME = "_sliderVariableName";
        private const string FIELD_NAME_EVENT_NAME_AFTER_VALUE_CHANGED = "_eventNameAfterValueChanged";
        private const string FIELD_NAME_SEND_BUTTON_DOWN_EVENT = "_sendButtonDownEvent";
        private const string FIELD_NAME_SEND_BUTTON_UP_EVENT = "_sendButtonUpEvent";
        private const string FIELD_NAME_BUTTON_DOWN_EVENT_NAME = "_buttonDownEventName";
        private const string FIELD_NAME_BUTTON_UP_EVENT_NAME = "_buttonUpEventName";
        #endregion Constants
        #region PropertyHandling
        protected void HandleProperty(SerializedProperty property)
        {
            bool isdefaultScriptProperty = property.name.Equals("m_Script") && property.type.Equals("PPtr<MonoScript>") && property.propertyType == SerializedPropertyType.ObjectReference && property.propertyPath.Equals("m_Script");
            if (isdefaultScriptProperty)
                return;
            //handle all array types
            if (property.isArray && property.propertyType != SerializedPropertyType.String)
            {
                ReimajoEditorBase.DrawArray(_lastHasLineDrawn, property);
                _lastHasLineDrawn = true;
                switch (property.name)
                {
                    //display buttons under some of those arrays
                    case FIELD_NAME_SYNCED_BUTTONS:
                        {
                            AddButton(name: "Apply these settings to all synced buttons", index: 0);
                        }
                        break;
                    case FIELD_NAME_SYNCED_SLIDERS:
                        {
                            AddButton(name: "Apply these settings to all synced sliders", index: 1);
                        }
                        break;
                    case FIELD_NAME_TOGGLED_CHAIRS:
                        {
                            AddButton(name: "Add/Update all toggled chairs", index: 3);
                        }
                        break;
                    case FIELD_NAME_TOGGLED_COLLIDERS:
                        {
                            AddButton(name: "Add/Update all toggled colliders", index: 4);
                        }
                        break;
                    case FIELD_NAME_RECEIVING_BEHAVIOURS:
                        {
                            AddButton(name: "Add/Update all receiving behaviours", index: 5);
                        }
                        break;
                    case FIELD_NAME_WHITELISTED_OBJECTS:
                        {
                            ReimajoEditorBase.DrawLabelField(Color.yellow, "You must specify whitelisted users inside the script (Whitelist.cs).");
                            EditorGUILayout.Space();
                        }
                        break;
                }
            }
            else
            {
                //handle all non-array types
                switch (property.name)
                {
                    case FIELD_NAME_IS_ON_AT_START:
                    case FIELD_NAME_DEFAULT_VALUE:
                    case FIELD_NAME_NETWORK_SYNCED_BUTTON:
                    case FIELD_NAME_NETWORK_SYNCED_SLIDER:
                        {
                            if (!_lastHasLineDrawn)
                            {
                                ReimajoEditorBase.DrawUILine(Color.gray);
                            }
                            EditorGUILayout.PropertyField(property, property.isExpanded);
                            ReimajoEditorBase.DrawUILine(Color.gray);
                            _lastHasLineDrawn = true;
                        }
                        break;
                    case FIELD_NAME_INVERTED_AREA_TOGGLE:
                        {
                            EditorGUILayout.PropertyField(property, property.isExpanded);
                            _lastHasLineDrawn = false;
                            AddButton(name: "Assign buttons & sliders within collider bounds", index: 2);
                        }
                        break;
                    default:
                        {
                            EditorGUILayout.PropertyField(property, property.isExpanded);
                            _lastHasLineDrawn = false;
                        }
                        break;
                }
            }
        }
        /// <summary>
        /// Draws a button between two lines
        /// </summary>
        /// <param name="name">Test on the button</param>
        /// <param name="index">Button index</param>
        private void AddButton(string name, int index)
        {
            if (!_lastHasLineDrawn)
            {
                ReimajoEditorBase.DrawUILine(Color.gray);
            }
            GUILayout.BeginHorizontal(GUIStyle.none, GUILayout.Height(25));
            if (GUILayout.Button(name, GUILayout.Height(25f)))
            {
                switch (index)
                {
                    case 0:
                        SyncAllButtonsToThisOne(_scriptObject);
                        break;
                    case 1:
                        SyncAllSlidersToThisOne(_scriptObject);
                        break;
                    case 2:
                        ApplyButtonsAndSlidersInColliderBounds();
                        break;
                    case 3:
                        AddAllToggledChairsFromScene();
                        break;
                    case 4:
                        AddAllToggledCollidersFromScene();
                        break;
                    case 5:
                        AddAllReceivingBehaviours();
                        break;
                }
            }
            GUILayout.EndHorizontal();
            ReimajoEditorBase.DrawUILine(Color.gray);
            _lastHasLineDrawn = true;
        }
        #endregion PropertyHandling
        #region ButtonAutoSync
        /// <summary>
        /// Syncs all synced buttons to this button and applies it's default values to the other buttons
        /// </summary>
        private void SyncAllButtonsToThisOne(GameObject thisButtonObject)
        {
            Component[] source_syncedButtons = null;
            GameObject[] source_toggledGameObjects = null;
            UdonBehaviour source_targetScript = null;
            UdonBehaviour source_networkSyncedButton = null;
            bool source_isOnAtStart = false;
            bool source_sendButtonDownEvent = false;
            string source_buttonDownEventName = null;
            bool source_sendButtonUpEvent = false;
            string source_buttonUpEventName = null;
            bool success = true;
            bool hasIsOnAtStart = false;
            bool hasSendButtonDown = false;
            bool hasSendButtonUp = false;
            bool isNetworkSyncedButtonScript = true;
            bool isRadioButton = false;
            bool isCycleButton = false;
#if DEBUG_TEST
            Type type;
#endif
            UdonBehaviour thisBehaviour = thisButtonObject.GetComponent<UdonBehaviour>();
            IUdonProgram program = thisBehaviour.programSource.SerializedProgramAsset.RetrieveProgram();
            ImmutableArray<string> exportedSymbolNames = program.SymbolTable.GetExportedSymbols();
            foreach (string exportedSymbolName in exportedSymbolNames)
            {
                switch (exportedSymbolName)
                {
                    case FIELD_NAME_SYNCED_BUTTONS:
                        {
                            success = thisBehaviour.publicVariables.TryGetVariableValue(FIELD_NAME_SYNCED_BUTTONS, out source_syncedButtons);
#if DEBUG_TEST
                            if (source_syncedButtons != null)
                            {
                                Debug.Log($"Found {source_syncedButtons.Length} values for {FIELD_NAME_SYNCED_BUTTONS}");
                            }
                            else
                            {

                                thisBehaviour.publicVariables.TryGetVariableType(FIELD_NAME_SYNCED_BUTTONS, out type);
                                Debug.LogError($"Found the field {FIELD_NAME_SYNCED_BUTTONS} but the type ({type}) is unclear.");
                                return;
                            }
#endif
                        }
                        break;
                    case FIELD_NAME_TOGGLED_GAMEOBJECTS:
                        {
                            success = thisBehaviour.publicVariables.TryGetVariableValue(FIELD_NAME_TOGGLED_GAMEOBJECTS, out source_toggledGameObjects);
#if DEBUG_TEST
                            if (source_toggledGameObjects != null)
                            {
                                Debug.Log($"Found {source_toggledGameObjects.Length} values for {FIELD_NAME_TOGGLED_GAMEOBJECTS}");
                            }
                            else
                            {
                                thisBehaviour.publicVariables.TryGetVariableType(FIELD_NAME_TOGGLED_GAMEOBJECTS, out type);
                                Debug.LogError($"Found the field {FIELD_NAME_TOGGLED_GAMEOBJECTS} but the type ({type}) is unclear.");
                                return;
                            }
#endif
                        }
                        break;
                    case FIELD_NAME_NETWORK_SYNCED_BUTTON:
                        {
                            isNetworkSyncedButtonScript = false;
                            //this is allowed to be null, don't check if it's successful
                            thisBehaviour.publicVariables.TryGetVariableValue(FIELD_NAME_NETWORK_SYNCED_BUTTON, out source_networkSyncedButton);
#if DEBUG_TEST
                            if (source_networkSyncedButton != null)
                            {
                                Debug.Log($"Found 1 value for {FIELD_NAME_NETWORK_SYNCED_BUTTON}");
                            }
                            else
                            {
                                thisBehaviour.publicVariables.TryGetVariableType(FIELD_NAME_NETWORK_SYNCED_BUTTON, out type);
                                Debug.LogError($"Found the field {FIELD_NAME_NETWORK_SYNCED_BUTTON} but the type ({type}) is unclear.");
                                return;
                            }
#endif
                        }
                        break;
                    case FIELD_NAME_TARGET_SCRIPT:
                        {
                            //this is allowed to be null, don't check if it's successful
                            thisBehaviour.publicVariables.TryGetVariableValue(FIELD_NAME_TARGET_SCRIPT, out source_targetScript);
#if DEBUG_TEST
                            if (source_targetScript != null)
                            {
                                Debug.Log($"Found 1 value for {FIELD_NAME_TARGET_SCRIPT}");
                            }
#endif
                        }
                        break;
                    case FIELD_NAME_IS_ON_AT_START:
                        {
                            hasIsOnAtStart = thisBehaviour.publicVariables.TryGetVariableValue(FIELD_NAME_IS_ON_AT_START, out source_isOnAtStart);
#if DEBUG_TEST
                            if (hasIsOnAtStart)
                            {
                                Debug.Log($"Found 1 value for {FIELD_NAME_IS_ON_AT_START}");
                            }
#endif
                        }
                        break;
                    case FIELD_NAME_SEND_BUTTON_DOWN_EVENT:
                        {
                            success = hasSendButtonDown = thisBehaviour.publicVariables.TryGetVariableValue(FIELD_NAME_SEND_BUTTON_DOWN_EVENT, out source_sendButtonDownEvent);
                        }
                        break;
                    case FIELD_NAME_SEND_BUTTON_UP_EVENT:
                        {
                            success = hasSendButtonUp = thisBehaviour.publicVariables.TryGetVariableValue(FIELD_NAME_SEND_BUTTON_UP_EVENT, out source_sendButtonUpEvent);
                        }
                        break;
                    case FIELD_NAME_BUTTON_DOWN_EVENT_NAME:
                        {
                            success = thisBehaviour.publicVariables.TryGetVariableValue(FIELD_NAME_BUTTON_DOWN_EVENT_NAME, out source_buttonDownEventName);
                        }
                        break;
                    case FIELD_NAME_BUTTON_UP_EVENT_NAME:
                        {
                            success = thisBehaviour.publicVariables.TryGetVariableValue(FIELD_NAME_BUTTON_UP_EVENT_NAME, out source_buttonUpEventName);
                        }
                        break;
                }
                if (!success)
                {
                    Debug.LogError($"Failed to fetch the public field '{exportedSymbolName}'.");
                    return;
                }
            }

            if (_scriptObject.GetUdonSharpComponent<RadioButtonController>() != null)
            {
                isRadioButton = true;
                isNetworkSyncedButtonScript = false;
            }
            else if(_scriptObject.GetUdonSharpComponent<CycleButtonController>() != null)
            {
                isCycleButton = true;
                isNetworkSyncedButtonScript = false;
            }


            if (!hasIsOnAtStart)
            {
                Debug.LogError($"Button is missing a needed serialized field ({FIELD_NAME_IS_ON_AT_START})");
                return;
            }
            else if (!hasSendButtonDown)
            {
                Debug.LogError($"Button is missing a needed serialized field ({FIELD_NAME_SEND_BUTTON_DOWN_EVENT})");
                return;
            }
            else if (!hasSendButtonUp)
            {
                Debug.LogError($"Button is missing a needed serialized field ({FIELD_NAME_SEND_BUTTON_UP_EVENT})");
                return;
            }
            else if (source_buttonDownEventName == null || source_buttonUpEventName == null)
            {
                Debug.LogError("Button is missing all needed serialized fields (2)");
                return;
            }
            GameObject[] newToggledGameObjects = new GameObject[0];
            for (int i = 0; i < source_toggledGameObjects.Length; i++)
            {
                if (isCycleButton || source_toggledGameObjects[i] != null)
                {
                    AddToGameObjectArray(ref newToggledGameObjects, source_toggledGameObjects[i]);
                }
            }

            if (isNetworkSyncedButtonScript)
            {
#if DEBUG_TEST
                Debug.Log("Set itself as the network synced button");
#endif
                //apply itself as the network button script if it's a network button
                source_networkSyncedButton = thisBehaviour;
            }
            else
            {
#if DEBUG_TEST
                Debug.Log("Added itself as a regular button");
#endif
                if (source_syncedButtons == null)
                {
                    //add itself to the list if it's a regular button
                    source_syncedButtons = new Component[1];
                    source_syncedButtons[0] = thisBehaviour;
                }
                else
                {
                    //add itself to the list if it's a regular button
                    AddToComponentArray(ref source_syncedButtons, thisBehaviour);
                }
            }
            //apply all settings from this button to all other buttons
            if (source_networkSyncedButton != null)
            {
                Component[] newSyncedButtons = new Component[0];
                for (int i = 0; i < source_syncedButtons.Length; i++)
                {
                    if (source_syncedButtons[i] != null)
                    {
                        AddToComponentArray(ref newSyncedButtons, source_syncedButtons[i]);
                    }
                }
                ApplySettingsToButton(target: source_networkSyncedButton, newSyncedButtons, source_networkSyncedButton, source_isOnAtStart, newToggledGameObjects, source_targetScript, source_sendButtonDownEvent, source_sendButtonUpEvent, source_buttonDownEventName, source_buttonUpEventName, isRadioButton);
            }
            if (source_syncedButtons != null && source_syncedButtons.Length > 0)
            {
                foreach (UdonBehaviour target in source_syncedButtons)
                {
                    if (target != null)
                    {
                        Component[] newSyncedButtons = new Component[0];
                        //remove the target script from the button list
                        for (int i = 0; i < source_syncedButtons.Length; i++)
                        {
                            if (source_syncedButtons[i] == null)
                            {
#if DEBUG_TEST
                                Debug.Log("Skipped adding null value to component list");
#endif
                            }
                            else if ((UdonBehaviour)source_syncedButtons[i] == target)
                            {
#if DEBUG_TEST
                                Debug.Log("Skipped adding target to component list");
#endif
                            }
                            else
                            {
                                AddToComponentArray(ref newSyncedButtons, source_syncedButtons[i]);
                            }
                        }
                        ApplySettingsToButton(target, newSyncedButtons, source_networkSyncedButton, source_isOnAtStart, newToggledGameObjects, source_targetScript, source_sendButtonDownEvent, source_sendButtonUpEvent, source_buttonDownEventName, source_buttonUpEventName, isRadioButton);
                    }
                }
            }
            if ((source_syncedButtons != null && source_syncedButtons.Length != 0) || source_networkSyncedButton != null)
                Debug.Log("<color=green>All Buttons are now in sync and have the same settings applied.</color>");
            else
                Debug.Log("<color=green>This button is now set up.</color> It is not synced with any other button.");
        }
        /// <summary>
        /// Applies the specified settings to the target UdonBehaviour
        /// </summary>
        private void ApplySettingsToButton(UdonBehaviour target, Component[] syncedButtons, UdonBehaviour networkSyncedButton,
            bool isOnAtStart, GameObject[] toggledGameObjects, UdonBehaviour targetScript, bool sendButtonDownEvent, bool sendButtonUpEvent,
            string buttonDownEventName, string buttonUpEventName, bool isRadioButton)
        {
            IUdonProgram program = target.programSource.SerializedProgramAsset.RetrieveProgram();
            ImmutableArray<string> exportedSymbolNames = program.SymbolTable.GetExportedSymbols();
            foreach (string exportedSymbolName in exportedSymbolNames)
            {
                switch (exportedSymbolName)
                {
                    case FIELD_NAME_SYNCED_BUTTONS:
                        {
                            SetUdonVariable(program, exportedSymbolName, syncedButtons, target);
#if DEBUG_TEST
                            Debug.Log($"Set ({syncedButtons.Length}) values for {FIELD_NAME_SYNCED_BUTTONS} to target");
#endif
                        }
                        break;
                    case FIELD_NAME_TOGGLED_GAMEOBJECTS:
                        {
                            if (isRadioButton)
                                continue;
                            SetUdonVariable(program, exportedSymbolName, toggledGameObjects, target);
#if DEBUG_TEST
                            Debug.Log($"Set ({toggledGameObjects.Length}) values for {FIELD_NAME_TOGGLED_GAMEOBJECTS} to target");
#endif
                        }
                        break;
                    case FIELD_NAME_TARGET_SCRIPT:
                        {
                            if (isRadioButton)
                                continue;
                            SetUdonVariable(program, exportedSymbolName, targetScript, target);
#if DEBUG_TEST
                            if (targetScript == null)
                                Debug.Log($"Set null value for {FIELD_NAME_TARGET_SCRIPT} to target");
                            else
                                Debug.Log($"Set valid value for {FIELD_NAME_TARGET_SCRIPT} to target");
#endif
                        }
                        break;
                    case FIELD_NAME_NETWORK_SYNCED_BUTTON:
                        {
                            SetUdonVariable(program, exportedSymbolName, networkSyncedButton, target);
#if DEBUG_TEST
                            if (networkSyncedButton == null)
                                Debug.Log($"Set null value for {FIELD_NAME_NETWORK_SYNCED_BUTTON} to target");
                            else
                                Debug.Log($"Set valid value for {FIELD_NAME_NETWORK_SYNCED_BUTTON} to target");
#endif
                        }
                        break;
                    case FIELD_NAME_IS_ON_AT_START:
                        {
                            SetUdonVariable(program, exportedSymbolName, isOnAtStart, target);
#if DEBUG_TEST
                            Debug.Log($"Set ({isOnAtStart}) value for {FIELD_NAME_IS_ON_AT_START} to target");
#endif
                        }
                        break;
                    case FIELD_NAME_SEND_BUTTON_DOWN_EVENT:
                        {
                            SetUdonVariable(program, exportedSymbolName, sendButtonDownEvent, target);
                        }
                        break;
                    case FIELD_NAME_SEND_BUTTON_UP_EVENT:
                        {
                            SetUdonVariable(program, exportedSymbolName, sendButtonUpEvent, target);
                        }
                        break;
                    case FIELD_NAME_BUTTON_DOWN_EVENT_NAME:
                        {
                            SetUdonVariable(program, exportedSymbolName, buttonDownEventName, target);
                        }
                        break;
                    case FIELD_NAME_BUTTON_UP_EVENT_NAME:
                        {
                            SetUdonVariable(program, exportedSymbolName, buttonUpEventName, target);
                        }
                        break;
                }
            }
            //This somehow makes everything work, but please don't do it like that - I've used the correct approach in the newer
            //AreaToggle script region above and need to update this region in the future.
            if (UdonSharpEditor.UdonSharpEditorUtility.IsUdonSharpBehaviour(target))
            {
                UdonSharpBehaviour udonSharpBehaviour = target.gameObject.GetComponent<UdonSharpBehaviour>();
                UdonSharpEditor.UdonSharpEditorUtility.CopyUdonToProxy(udonSharpBehaviour);
            }
        }
        #endregion ButtonAutoSync
        #region SliderAutoSync
        /// <summary>
        /// Syncs all synced sliders to this slider and applies it's default values to the other sliders
        /// </summary>
        private void SyncAllSlidersToThisOne(GameObject thisSliderObject)
        {
            Component[] source_syncedSliders = null;
            UdonBehaviour source_targetScript = null;
            UdonBehaviour source_networkSyncedSlider = null;
            string source_sliderVariableName = null;
            string source_eventNameAfterValueChanged = null;
            float source_sliderValueAtStart = 0f;
            bool defaultValueAssigned = false;
            bool isNetworkSyncedSliderScript = true;
            bool success = true;
#if DEBUG_TEST
            Type type;
#endif
            UdonBehaviour thisBehaviour = thisSliderObject.GetComponent<UdonBehaviour>();
            IUdonProgram program = thisBehaviour.programSource.SerializedProgramAsset.RetrieveProgram();
            ImmutableArray<string> exportedSymbolNames = program.SymbolTable.GetExportedSymbols();
            foreach (string exportedSymbolName in exportedSymbolNames)
            {
                switch (exportedSymbolName)
                {
                    case FIELD_NAME_SYNCED_SLIDERS:
                        success = thisBehaviour.publicVariables.TryGetVariableValue(FIELD_NAME_SYNCED_SLIDERS, out source_syncedSliders);
                        break;
                    case FIELD_NAME_NETWORK_SYNCED_SLIDER:
                        isNetworkSyncedSliderScript = false;
                        thisBehaviour.publicVariables.TryGetVariableValue(FIELD_NAME_NETWORK_SYNCED_SLIDER, out source_networkSyncedSlider);
                        break;
                    case FIELD_NAME_TARGET_SCRIPT:
                        //this is allowed to be null, don't check if it's successful
                        thisBehaviour.publicVariables.TryGetVariableValue(FIELD_NAME_TARGET_SCRIPT, out source_targetScript);
                        break;
                    case FIELD_NAME_SLIDER_VARIABLE_NAME:
                        success = thisBehaviour.publicVariables.TryGetVariableValue(FIELD_NAME_SLIDER_VARIABLE_NAME, out source_sliderVariableName);
                        break;
                    case FIELD_NAME_EVENT_NAME_AFTER_VALUE_CHANGED:
                        success = thisBehaviour.publicVariables.TryGetVariableValue(FIELD_NAME_EVENT_NAME_AFTER_VALUE_CHANGED, out source_eventNameAfterValueChanged);
                        break;
                    case FIELD_NAME_DEFAULT_VALUE:
                        defaultValueAssigned = true;
                        success = thisBehaviour.publicVariables.TryGetVariableValue(FIELD_NAME_DEFAULT_VALUE, out source_sliderValueAtStart);
                        break;
                }
                if (!success)
                {
                    Debug.LogError($"Failed to fetch the public field '{exportedSymbolName}'.");
                    return;
                }
            }
            //ensure that we fetched all needed values
            if (source_sliderVariableName == null || source_eventNameAfterValueChanged == null || !defaultValueAssigned)
            {
                Debug.LogError("Slider is missing all needed serialized fields or something to sync to");
                return;
            }
            if (isNetworkSyncedSliderScript)
            {
#if DEBUG_TEST
                Debug.Log("Set itself as the network synced slider");
#endif
                //apply itself as the network slider script if it's a network slider
                source_networkSyncedSlider = thisBehaviour;
            }
            else
            {
#if DEBUG_TEST
                Debug.Log("Added itself as a regular slider");
#endif
                if (source_syncedSliders == null)
                {
                    //add itself to the list if it's a regular slider
                    source_syncedSliders = new Component[1];
                    source_syncedSliders[0] = thisBehaviour;
                }
                else
                {
                    //add itself to the list if it's a regular slider
                    AddToComponentArray(ref source_syncedSliders, thisBehaviour);
                }
            }
            //apply all settings from this slider to all other sliders
            if (source_networkSyncedSlider != null)
            {
                Component[] newSyncedSliders = new Component[0];
                for (int i = 0; i < source_syncedSliders.Length; i++)
                {
                    if (source_syncedSliders[i] != null)
                    {
                        AddToComponentArray(ref newSyncedSliders, source_syncedSliders[i]);
                    }
                }
                ApplySettingsToSlider(target: source_networkSyncedSlider, newSyncedSliders, source_networkSyncedSlider, source_targetScript, source_sliderVariableName, source_eventNameAfterValueChanged, source_sliderValueAtStart);
            }
            if (source_syncedSliders != null && source_syncedSliders.Length > 0)
            {
                foreach (UdonBehaviour target in source_syncedSliders)
                {
                    if (target != null)
                    {
                        Component[] newSyncedSliders = new Component[0];
                        //remove the target script from the slider list
                        for (int i = 0; i < source_syncedSliders.Length; i++)
                        {
                            if (source_syncedSliders[i] == null)
                            {
#if DEBUG_TEST
                                Debug.Log("Skipped adding null value to component list");
#endif
                            }
                            else if ((UdonBehaviour)source_syncedSliders[i] == target)
                            {
#if DEBUG_TEST
                                Debug.Log("Skipped adding target to component list");
#endif
                            }
                            else
                            {
                                AddToComponentArray(ref newSyncedSliders, source_syncedSliders[i]);
                            }
                        }
                        ApplySettingsToSlider(target, newSyncedSliders, source_networkSyncedSlider, source_targetScript, source_sliderVariableName, source_eventNameAfterValueChanged, source_sliderValueAtStart);
                    }
                }
            }
            if ((source_syncedSliders != null && source_syncedSliders.Length != 0) || source_networkSyncedSlider != null)
                Debug.Log("<color=green>All sliders are now in sync and have the same settings applied.</color>");
            else
                Debug.Log("<color=green>This slider is now set up.</color> It is not synced with any other slider.");
        }
        /// <summary>
        /// Applies the specified settings to the target UdonBehaviour
        /// </summary>
        private void ApplySettingsToSlider(UdonBehaviour target, Component[] syncedSliders, UdonBehaviour networkSyncedSlider,
            UdonBehaviour targetScript, string source_sliderVariableName, string source_eventNameAfterValueChanged, float source_defaultValue)
        {
            IUdonProgram program = target.programSource.SerializedProgramAsset.RetrieveProgram();
            ImmutableArray<string> exportedSymbolNames = program.SymbolTable.GetExportedSymbols();
            foreach (string exportedSymbolName in exportedSymbolNames)
            {
                switch (exportedSymbolName)
                {
                    case FIELD_NAME_SYNCED_SLIDERS:
                        SetUdonVariable(program, exportedSymbolName, syncedSliders, target);
                        break;
                    case FIELD_NAME_TARGET_SCRIPT:
                        SetUdonVariable(program, exportedSymbolName, targetScript, target);
                        break;
                    case FIELD_NAME_NETWORK_SYNCED_SLIDER:
                        SetUdonVariable(program, exportedSymbolName, networkSyncedSlider, target);
                        break;
                    case FIELD_NAME_SLIDER_VARIABLE_NAME:
                        SetUdonVariable(program, exportedSymbolName, source_sliderVariableName, target);
                        break;
                    case FIELD_NAME_EVENT_NAME_AFTER_VALUE_CHANGED:
                        SetUdonVariable(program, exportedSymbolName, source_eventNameAfterValueChanged, target);
                        break;
                    case FIELD_NAME_DEFAULT_VALUE:
                        SetUdonVariable(program, exportedSymbolName, source_defaultValue, target);
                        break;
                }
            }
            //This somehow makes everything work, but please don't do it like that - I've used the correct approach in the newer
            //AreaToggle script region above and need to update this region in the future.
            if (UdonSharpEditor.UdonSharpEditorUtility.IsUdonSharpBehaviour(target))
            {
                UdonSharpBehaviour udonSharpBehaviour = target.gameObject.GetComponent<UdonSharpBehaviour>();
                UdonSharpEditor.UdonSharpEditorUtility.CopyUdonToProxy(udonSharpBehaviour);
            }
        }
        #endregion SliderAutoSync
        #region AreaScriptAutoAssign
        private void ApplyButtonsAndSlidersInColliderBounds()
        {
            if (_scriptObject == null)
            {
                Debug.LogError("_scriptObject is null");
                return;
            }
            BoxCollider boxCollider = _scriptObject.GetComponent<BoxCollider>();
            if (boxCollider == null)
            {
                Debug.LogError($"There is no BoxCollider assigned to this area toggle.");
                return;
            }
            Bounds areaBounds = boxCollider.bounds;
            //make sure the box collider is marked as a trigger collider
            if (!boxCollider.isTrigger)
                boxCollider.isTrigger = true;
            //make sure the object is on the mirror reflection layer
            if (_scriptObject.layer != MIRROR_REFLECTION_LAYER)
                _scriptObject.layer = MIRROR_REFLECTION_LAYER;
            //create a new list for all synced button&sliders in bounds
            List<UdonSharpBehaviour> toggledScriptBooleansInBounds = new List<UdonSharpBehaviour>();
            //create a new array for all buttons&sliders in bounds
            List<GameObject> allButtonsAndSlidersInBounds = new List<GameObject>();
            //fetch all Button & Sliders (non synced) within area bounds and assign them to the lists
            GetAllButtonAndSlidersInBounds(areaBounds, ref toggledScriptBooleansInBounds, ref allButtonsAndSlidersInBounds);
            //fetch the current object list from the script itself
            AreaToggle areaToggle = _scriptObject.GetUdonSharpComponent<AreaToggle>();
            if (areaToggle == null)
            {
                Debug.LogError("There is no areaToggle U# component on this script");
                return;
            }
            CorrectUdonBehaviourFlags();
            //make the script ready for changes (see https://github.com/MerlinVR/UdonSharp/wiki/Editor-Scripting#example-inspector)
            areaToggle.UpdateProxy();
            //add existing manually assigned "other" objects to the list
            AddExistingToggledObjects(areaToggle, ref allButtonsAndSlidersInBounds);
            AddExistingToggledScriptBools(areaToggle, ref toggledScriptBooleansInBounds);
            //add objects with the corresponding tags that are within bounds and not on the list yet
            AddTaggedToggledObjectsWithinBounds(areaBounds, ref allButtonsAndSlidersInBounds);
            AddTaggedToggledScriptBoolsWithinBounds(areaBounds, ref toggledScriptBooleansInBounds);
            //apply the new arrays to the behaviour
            areaToggle.SetProgramVariable("_toggledObjects", allButtonsAndSlidersInBounds.ToArray());
            areaToggle.SetProgramVariable("_toggledScriptBooleans", toggledScriptBooleansInBounds.ToArray());
            //apply changes
            areaToggle.ApplyProxyModifications();
            Debug.Log($"<color=green>Updated AreaToggle, assigned {allButtonsAndSlidersInBounds.Count + toggledScriptBooleansInBounds.Count} objects.</color>");
        }
        /// <summary>
        /// Fetch all Button & Sliders (non synced) within the specified area bounds
        /// </summary>
        private void GetAllButtonAndSlidersInBounds(Bounds areaBounds, ref List<UdonSharpBehaviour> toggledScriptBooleansInBounds, ref List<GameObject> allButtonsAndSlidersInBounds)
        {
            //get all UdonBehaviours in game
            UdonBehaviour[] allUdonBehavioursInScene = FindObjectsOfType<UdonBehaviour>();
            //go through all UdonBehaviours in scene, if they are buttons or sliders + in bounds, add them
            foreach (UdonBehaviour udonBehaviour in allUdonBehavioursInScene)
            {
                //this method seem to crash for some users for unknown reasons so I've added lots of paranoid checks now
                if (udonBehaviour == null || udonBehaviour.programSource == null)
                {
                    continue;
                }
                GameObject obj = udonBehaviour.gameObject;
                if (HasButtonOrSliderScript(obj))
                {
                    if (areaBounds.Contains(obj.transform.position))
                    {
                        allButtonsAndSlidersInBounds.Add(obj);
                    }
                }
                else if (HasSyncedButtonOrSliderScript(obj))
                {
                    if (areaBounds.Contains(obj.transform.position))
                    {
                        UdonSharpBehaviour script = obj.GetUdonSharpComponent<SyncedButtonController>();
                        if (script == null)
                        {
                            script = obj.GetUdonSharpComponent<SyncedSliderController>();
                            if (script == null)
                                continue;
                        }
                        toggledScriptBooleansInBounds.Add(script);
                    }
                }
            }
        }
        /// <summary>
        /// Fetch all tagged objects within the specified area bounds which are not synced buttons/sliders
        /// </summary>
        private void AddTaggedToggledObjectsWithinBounds(Bounds areaBounds, ref List<GameObject> allButtonsAndSlidersInBounds)
        {
            //get all gameObjects with that tag in game
            GameObject[] objectsWithTag = GameObject.FindGameObjectsWithTag(TAG_NAME_AREA_TOGGLE_OBJECT);
            //go through all objects in scene, check if they are in bounds, add them if they haven't been added yet
            foreach (GameObject obj in objectsWithTag)
            {
                if (areaBounds.Contains(obj.transform.position))
                {
                    if (allButtonsAndSlidersInBounds.Contains(obj))
                        continue;
                    if (HasSyncedButtonOrSliderScript(obj))
                        continue;
                    allButtonsAndSlidersInBounds.Add(obj);
                }
            }
        }
        /// <summary>
        /// Fetch all tagged objects within the specified area bounds which are not synced buttons/sliders
        /// </summary>
        private void AddTaggedToggledScriptBoolsWithinBounds(Bounds areaBounds, ref List<UdonSharpBehaviour> toggledScriptBooleansInBounds)
        {
            //get all gameObjects with that tag in game
            GameObject[] objectsWithTag = GameObject.FindGameObjectsWithTag(TAG_NAME_AREA_TOGGLE_BOOL);
            //go through all objects in scene, check if they are in bounds, add them if they haven't been added yet
            foreach (GameObject obj in objectsWithTag)
            {
                if (areaBounds.Contains(obj.transform.position))
                {
                    UdonSharpBehaviour script = (UdonSharpBehaviour)obj.GetComponent(typeof(UdonSharpBehaviour));
                    if (script == null)
                        continue;
                    if (toggledScriptBooleansInBounds.Contains(script))
                        continue;
                    if (HasButtonOrSliderScript(obj))
                        continue;
                    toggledScriptBooleansInBounds.Add(script);
                }
            }
        }
        /// <summary>
        /// Adds all toggledObjects which are not of any auto-assigned type 
        /// to the list <paramref name="allButtonsAndSlidersInBounds"/>
        /// </summary>
        private void AddExistingToggledObjects(AreaToggle areaToggle, ref List<GameObject> allButtonsAndSlidersInBounds)
        {
            GameObject[] toggledObjects = (GameObject[])areaToggle.GetProgramVariable("_toggledObjects");
            if (toggledObjects != null)
            {
                foreach (GameObject obj in toggledObjects)
                {
                    //add all objects from the current list that are not buttons or sliders (user-assigned objects)
                    if (obj != null && !HasButtonOrSliderScript(obj) && !HasSyncedButtonOrSliderScript(obj) && obj.tag != TAG_NAME_AREA_TOGGLE_OBJECT && obj.tag != TAG_NAME_AREA_TOGGLE_BOOL)
                    {
                        allButtonsAndSlidersInBounds.Add(obj);
                    }
                }
            }
        }
        /// <summary>
        /// Adds all toggledObjects which are not of any auto-assigned type 
        /// to the list <paramref name="allButtonsAndSlidersInBounds"/>
        /// </summary>
        private void AddExistingToggledScriptBools(AreaToggle areaToggle, ref List<UdonSharpBehaviour> toggledScriptBooleansInBounds)
        {
            UdonSharpBehaviour[] toggledScriptBooleans = (UdonSharpBehaviour[])areaToggle.GetProgramVariable("_toggledScriptBooleans");
            if (toggledScriptBooleans != null)
            {
                foreach (UdonSharpBehaviour script in toggledScriptBooleans)
                {
                    //add all objects from the current list that are not null and not ButtonOrSliders and not SyncedButtonOrSliders
                    if (script != null && !HasButtonOrSliderScript(script.gameObject) && !HasSyncedButtonOrSliderScript(script.gameObject) && script.gameObject.tag != TAG_NAME_AREA_TOGGLE_BOOL && script.gameObject.tag != TAG_NAME_AREA_TOGGLE_OBJECT)
                    {
                        toggledScriptBooleansInBounds.Add(script);
                    }
                }
            }
        }
        /// <summary>
        /// Returns true if the object has a button or slider script attached
        /// </summary>
        private bool HasButtonOrSliderScript(GameObject obj)
        {
            if (obj == null)
            {
                return false;
            }
            UdonBehaviour udonBehaviour = obj.GetComponent<UdonBehaviour>();
            if (udonBehaviour == null || !UdonSharpEditorUtility.IsUdonSharpBehaviour(udonBehaviour))
            {
                return false;
            }
            try
            {
                if (obj.GetUdonSharpComponent<ButtonController>() != null)
                {
#if DEBUG_TEST
                Debug.Log($"{obj.name} is a ButtonController.");
#endif
                    return true;
                }
                else if (obj.GetUdonSharpComponent<SliderController>() != null)
                {
#if DEBUG_TEST
                Debug.Log($"{obj.name} is a SliderController.");
#endif
                    return true;
                }
                else if (obj.GetUdonSharpComponent<RadioButtonController>() != null)
                {
#if DEBUG_TEST
                Debug.Log($"{obj.name} is a RadioButtonController.");
#endif
                    return true;
                }
                else if (obj.GetUdonSharpComponent<CycleButtonController>() != null)
                {
#if DEBUG_TEST
                Debug.Log($"{obj.name} is a CycleButtonController.");
#endif
                    return true;
                }
                else if (obj.GetUdonSharpComponent<TouchButtonNoGui>() != null)
                {
#if DEBUG_TEST
                Debug.Log($"{obj.name} is a TouchButtonNoGui.");
#endif
                    return true;
                }
            }
            catch (Exception ex)
            {
                Debug.LogError("Failed to call GetUdonSharpComponent which is most likely caused by having a UdonSharp script in your project which has a different file name than it's contained class name, which breaks Unity.");
                throw (ex);
            }
            return false;
        }
        /// <summary>
        /// Returns true if the object has a button or slider script attached
        /// </summary>
        private bool HasSyncedButtonOrSliderScript(GameObject obj)
        {
            if (obj == null)
            {
                return false;
            }
            UdonBehaviour udonBehaviour = obj.GetComponent<UdonBehaviour>();
            if (udonBehaviour == null || !UdonSharpEditorUtility.IsUdonSharpBehaviour(udonBehaviour))
            {
                return false;
            }
            try
            {
                if (obj.GetUdonSharpComponent<SyncedButtonController>() != null)
                {
#if DEBUG_TEST
                Debug.Log($"{obj.name} is a SyncedButtonController.");
#endif
                    return true;
                }
                else if (obj.GetUdonSharpComponent<SyncedSliderController>() != null)
                {
#if DEBUG_TEST
                Debug.Log($"{obj.name} is a SyncedSliderController.");
#endif
                    return true;
                }
            }
            catch (Exception ex)
            {
                Debug.LogError("Failed to call GetUdonSharpComponent which is most likely caused by having a UdonSharp script in your project which has a different file name than it's contained class name, which breaks Unity.");
                throw (ex);
            }
            return false;
        }
        #endregion AreaScriptAutoAssign
        #region AutoAssignChairs
        /// <summary>
        /// Assigns all toggled chairs from the scene to the script on this gameObject
        /// </summary>
        private void AddAllToggledChairsFromScene()
        {
            GameObject[] objectsWithTag = GameObject.FindGameObjectsWithTag(TAG_NAME_TOGGLED_CHAIR);
            Debug.Log($"[PlayerCalibration] Found {objectsWithTag.Length} GameObject{(objectsWithTag.Length == 1 ? "s that have" : " that has")} the tag '{TAG_NAME_TOGGLED_CHAIR}' assigned");
            if (objectsWithTag.Length == 0)
                return;
            List<Collider> stationColliders = new List<Collider>();
            foreach (GameObject obj in objectsWithTag)
            {
                //ensure that there is a VRC Station on this GameObject
                if (((VRCStation)obj.GetComponent(typeof(VRCStation))) != null)
                {
                    Collider collider = obj.GetComponent<Collider>();
                    if (collider != null)
                    {
                        stationColliders.Add(collider);
                    }
                    else
                    {
                        Debug.LogError($"The GameObject '{obj.name}' has the tag {TAG_NAME_TOGGLED_CHAIR} set and a VRC_Station attached but no collider was found on this object. This object won't be added to the list.");
                    }
                }
                else
                {
                    Debug.LogError($"The GameObject '{obj.name}' has the tag {TAG_NAME_TOGGLED_CHAIR} set but no VRC_Station was found on this object. This object won't be added to the list.");
                }
            }
            ChairToggle chairToggle = _scriptObject.GetUdonSharpComponent<ChairToggle>();
            CorrectUdonBehaviourFlags();
            //make the script ready for changes (see https://github.com/MerlinVR/UdonSharp/wiki/Editor-Scripting#example-inspector)
            chairToggle.UpdateProxy();
            chairToggle.SetProgramVariable(FIELD_NAME_TOGGLED_CHAIRS, stationColliders.ToArray());
            //apply changes
            chairToggle.ApplyProxyModifications();
            Debug.Log($"<color=green>Updated ChairToggle, assigned {stationColliders.Count} objects.</color>");
        }
        #endregion AutoAssignChairs
        #region AutoAssignColliders
        /// <summary>
        /// Assigns all toggled colliders from the scene to the script on this gameObject
        /// </summary>
        private void AddAllToggledCollidersFromScene()
        {
            GameObject[] objectsWithTag = GameObject.FindGameObjectsWithTag(TAG_NAME_TOGGLED_COLLIDER);
            Debug.Log($"[PlayerCalibration] Found {objectsWithTag.Length} GameObject{(objectsWithTag.Length == 1 ? "s that have" : " that has")} the tag '{TAG_NAME_TOGGLED_COLLIDER}' assigned");
            if (objectsWithTag.Length == 0)
                return;
            List<Collider> collider = new List<Collider>();
            foreach (GameObject obj in objectsWithTag)
            {
                //ensure that there is a VRC Station on this GameObject
                if (obj.GetComponent<Collider>() != null)
                {
                    collider.AddRange(obj.GetComponents<Collider>().ToImmutableList<Collider>());
                }
                else
                {
                    Debug.LogError($"The GameObject '{obj.name}' has the tag {TAG_NAME_TOGGLED_COLLIDER} set but no collider was found on this object. This collider won't be added to the list.");
                }
            }
            ColliderToggle colliderToggle = _scriptObject.GetUdonSharpComponent<ColliderToggle>();
            CorrectUdonBehaviourFlags();
            //make the script ready for changes (see https://github.com/MerlinVR/UdonSharp/wiki/Editor-Scripting#example-inspector)
            colliderToggle.UpdateProxy();
            colliderToggle.SetProgramVariable(FIELD_NAME_TOGGLED_COLLIDERS, collider.ToArray());
            //apply changes
            colliderToggle.ApplyProxyModifications();
            Debug.Log($"<color=green>Updated ColliderToggle, assigned {collider.Count} objects.</color>");
        }
        #endregion AutoAssignColliders
        #region AutoAssignReceivingBehaviours
        private void AddAllReceivingBehaviours()
        {
            if (_scriptObject == null)
            {
                Debug.LogError("_scriptObject is null");
                return;
            }
            //create a new list for all button & sliders
            List<UdonSharpBehaviour> receivingScripts = new List<UdonSharpBehaviour>();
            //fetch the current object list from the script itself
            VRInteractionToggleScript vrInteractionToggleScript = _scriptObject.GetUdonSharpComponent<VRInteractionToggleScript>();
            if (vrInteractionToggleScript == null)
            {
                Debug.LogError("There is no VRInteractionToggleScript U# component on this object");
                return;
            }
            CorrectUdonBehaviourFlags();
            //make the script ready for changes (see https://github.com/MerlinVR/UdonSharp/wiki/Editor-Scripting#example-inspector)
            vrInteractionToggleScript.UpdateProxy();
            //add existing manually assigned "other" objects to the list
            AddExistingScripts(vrInteractionToggleScript, ref receivingScripts);
            //add objects with the corresponding tag and script types that are in the scene 
            AddAllButtonAndSlidersFromScene(ref receivingScripts);
            //apply the new arrays to the behaviour
            vrInteractionToggleScript.SetProgramVariable(FIELD_NAME_RECEIVING_BEHAVIOURS, receivingScripts.ToArray());
            //apply changes
            vrInteractionToggleScript.ApplyProxyModifications();
            Debug.Log($"<color=green>Updated script, assigned {receivingScripts.Count} objects.</color>");
        }
        /// <summary>
        /// Adds all currently assigned scripts which are not of any auto-assigned type 
        /// to the list <paramref name="receivingScripts"/>
        /// </summary>
        private void AddExistingScripts(VRInteractionToggleScript vrInteractionToggleScript, ref List<UdonSharpBehaviour> receivingScripts)
        {
            UdonSharpBehaviour[] existingList = (UdonSharpBehaviour[])vrInteractionToggleScript.GetProgramVariable(FIELD_NAME_RECEIVING_BEHAVIOURS);
            if (existingList != null)
            {
                foreach (UdonSharpBehaviour script in existingList)
                {
                    //add all objects from the current list that are not null and not ButtonOrSliders and not SyncedButtonOrSliders
                    if (script != null && !HasButtonOrSliderScript(script.gameObject) && !HasSyncedButtonOrSliderScript(script.gameObject))
                    {
                        receivingScripts.Add(script);
                    }
                }
            }
        }
        /// <summary>
        /// Add all Button & Sliders within the scene
        /// </summary>
        private void AddAllButtonAndSlidersFromScene(ref List<UdonSharpBehaviour> receivingScripts)
        {
            //get all UdonBehaviours in game
            UdonBehaviour[] allUdonBehavioursInScene = FindObjectsOfType<UdonBehaviour>();
            //go through all UdonBehaviours in scene, if they are buttons or sliders + in bounds, add them
            foreach (UdonBehaviour udonBehaviour in allUdonBehavioursInScene)
            {
                //this method seem to crash for some users for unknown reasons so I've added lots of paranoid checks now
                if (udonBehaviour == null || udonBehaviour.programSource == null)
                {
                    continue;
                }
                GameObject obj = udonBehaviour.gameObject;
                if (HasButtonOrSliderScript(obj))
                {
                    UdonSharpBehaviour script = obj.GetUdonSharpComponent<ButtonController>();
                    if (script == null)
                    {
                        script = obj.GetUdonSharpComponent<SliderController>();
                        if (script == null)
                        {
                            script = obj.GetUdonSharpComponent<RadioButtonController>();
                            if (script == null)
                            {
                                script = obj.GetUdonSharpComponent<CycleButtonController>();
                                if (script == null)
                                {
                                    script = obj.GetUdonSharpComponent<TouchButtonNoGui>();
                                    if (script == null)
                                        continue;
                                }
                            }
                        }
                    }
                    receivingScripts.Add(script);
                }
                else if (HasSyncedButtonOrSliderScript(obj))
                {
                    UdonSharpBehaviour script = obj.GetUdonSharpComponent<SyncedButtonController>();
                    if (script == null)
                    {
                        script = obj.GetUdonSharpComponent<SyncedSliderController>();
                        if (script == null)
                            continue;
                    }
                    receivingScripts.Add(script);
                }
            }
        }
        #endregion AutoAssignReceivingBehaviours
        #region GeneralFunctions
        /// <summary>
        /// Ensures that Synchronize Position and Transfer Ownership is false
        /// </summary>
        private void CorrectUdonBehaviourFlags()
        {
            UdonBehaviour areaToggleUdonBehaviour = _scriptObject.GetComponent<UdonBehaviour>();
            if (areaToggleUdonBehaviour != null)
            {
                //correct possible user errors
#pragma warning disable CS0618 // Type or member is obsolete, but can still be used!
                areaToggleUdonBehaviour.AllowCollisionOwnershipTransfer = false;
            }
        }
        /// <summary>
        /// Sets a field value on an UdonBehaviour. Should not be used with U# assets, especially not those with custom inspeactors.
        /// </summary>
        private void SetUdonVariable(IUdonProgram program, string exportedSymbolName, object variableValue, UdonBehaviour target)
        {
            //This somehow works, but please don't do it like that - I've used the correct approach in the newer
            //AreaToggle script region above and need to update this region in the future.
            System.Type symbolType = program.SymbolTable.GetSymbolType(exportedSymbolName);
            if (!target.publicVariables.TrySetVariableValue(exportedSymbolName, variableValue))
            {
                if (!target.publicVariables.TryAddVariable(CreateUdonVariable(exportedSymbolName, variableValue, symbolType)))
                {
                    Debug.LogError($"SetUdonVariable(): Failed to set public variable '{exportedSymbolName}' value.");
                }
                else
                {
#if DEBUG_TEST
                    Debug.Log($"SetUdonVariable(): Added public variable '{exportedSymbolName}'.");
#endif
                }
            }
            else
            {
#if DEBUG_TEST
                Debug.Log($"SetUdonVariable(): Set public variable '{exportedSymbolName}'.");
#endif
            }
        }
        /// <summary>
        /// Creates an Udon Variable.
        /// Took me forever to find out how to do that myself, then I've ended up taking a look at how MerlinVR does it in
        /// https://github.com/MerlinVR/UdonSharp/blob/master/Assets/UdonSharp/Editor/Editors/UdonSharpGUI.cs
        /// </summary>
        private IUdonVariable CreateUdonVariable(string symbolName, object value, System.Type type)
        {
            System.Type udonVariableType = typeof(UdonVariable<>).MakeGenericType(type);
            return (IUdonVariable)Activator.CreateInstance(udonVariableType, symbolName, value);
        }
        /// <summary>
        /// Add the <paramref name="newObj"/> to the <paramref name="objArray"/> at the end after increasing it's size by 1.
        /// This isn't performant, only use this for editor scripts
        /// </summary>
        private void AddToGameObjectArray(ref GameObject[] objArray, GameObject newObj)
        {
            System.Array.Resize<GameObject>(ref objArray, objArray.Length + 1);
            objArray[objArray.Length - 1] = newObj;
        }
        /// <summary>
        /// Add the <paramref name="newComponent"/> to the <paramref name="componentArray"/> at the end after increasing it's size by 1.
        /// This isn't performant, only use this for editor scripts
        /// </summary>
        private void AddToComponentArray(ref Component[] componentArray, Component newComponent)
        {
            System.Array.Resize<Component>(ref componentArray, componentArray.Length + 1);
            componentArray[componentArray.Length - 1] = newComponent;
        }
        #endregion GeneralFunctions
    }
}