#region DontTouchThis
//#define NETWORK_SYNC_VERSION //leave this one as it is please, don't touch it
//#define RADIO_BUTTON_VERSION //leave this one as it is please, don't touch it
#endregion DontTouchThis
//this is the main script where all changes should happen until U# 1.0
#region Code
#region CompilerSettings
//---------------------------------------------------------------------------------------------------------
//Note: You can permanently add a #define to your whole project, so you don't need to edit it here in the scripts after each update anymore.
//See https://discord.com/channels/835444547810361344/835461281225506847/863853756323594302 on my discord https://discord.gg/SWkNA394Mm
//--------------------------------- Compiler Settings -----------------------------------------------------
//#define USE_AREA_TOGGLES //uncomment if you use area toggles for all buttons, in which case the buttons will
//    not check the LOD renderer to stay idle and can also be pushed without looking at them. This drastically
//    increases frametime if you don't set area toggles up for all buttons to control when the player is in reach to them.
//    I highly recommend that you turn this on and strictly use area toggles for all sliders and buttons.
//    Make sure to activate this option in your whole project (see link above) and not here in the script.
//    !!!! Activating this cannot be easily reverted, since editor assignements will be removed. !!!!
//#define EDITOR_TEST //uncomment unless you want to test the button in editor (without an emulator), comment out for live builds.
#define ALLOW_BUTTON_TO_MOVE_AND_ROTATE //if the button doesn't need to move or rotate, uncomment this to save performance
//#define DEBUG_TEST //uncomment if you want to debug this button
//#define EXPOSE_SETTINGS_TO_EDITOR //uncomment when you want to set button settings individually per button in editor
#define PREVENT_PUSHING_FROM_BEHIND //costs a bit more frametime, but prevents accidentally pushing the button from behind or from the side
//---------------------------------------------------------------------------------------------------------
#endregion CompilerSettings
#region Usings
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;
#endregion Usings
/// <summary>
/// Script from Reimajo, purchased at https://reimajo.booth.pm/, to be used in the worlds of the person who bought the asset only.
/// Join my Discord Server to receive update notifications & support for this asset: https://discord.gg/SWkNA394Mm
/// If you have any issues, please contact me on Discord or Booth or Twitter https://twitter.com/ReimajoChan
/// Do not give any of the asset files or parts of them to anyone else.
/// </summary>
namespace ReimajoBoothAssets
{
    //*********************** ONLY EDIT THE SYNCED BUTTON-CONTROLLER SCRIPT! ***************************
    #region VariantControl
    //waiting for UdonSharp 1.0 to be able to use this again (broke with Unity 2019)
    /// <summary>
    /// Script needs a _targetScript assigned in editor or at least one object to _toggledGameObjects, also both is possible.
    /// You should NOT have "Synchronize Position" enabled for this script (should be default off anyway unless you set it manually).
    /// You should NOT have "Transfer Ownership on Collision" enabled for this script.
#if NETWORK_SYNC_VERSION
    /// This version of the button script is networked (late-joiner proof)
    /// </summary>
    //[UdonBehaviourSyncMode(BehaviourSyncMode.Manual)]
    //public class SyncedButtonController : UdonSharpBehaviour
#elif RADIO_BUTTON_VERSION
    /// If the button is a radio button, only one button in the synced button list will be on at a time.
    /// Toggling a second button on will toggle all other buttons off. Furthermore, each button has it's own assigned
    /// script and gameObjects, those are not synced when clicking the editor sync button on the script.
    /// This logic cannot be networked. If you need a network-synced radio button logic, please come to my discord and ask for it.
    /// </summary>
    //[UdonBehaviourSyncMode(BehaviourSyncMode.NoVariableSync)]
    //public class RadioButtonController : UdonSharpBehaviour
#elif CYCLE_BUTTON_VERSION
    /// If the button is a cycle button, only one gameObject in the cycled game objects array will be active at any given moment.
    /// At start, all objects in the list are deactivated - if _isOnAtStart is true, the first one in the list is then activated.
    /// Pushing the button will deactivate the current object and activate the next one in the list.
    /// If the next in the list is null, the button will act as if there is an object and every other object will be deactivated.
    /// Pushing the button will make it light up green while it is pushed, and back to red once it's fully released.
    /// This logic is currently not available as a networked variant. If you need a network-synced cycle button logic, please come 
    /// to my discord and ask for it.
    /// </summary>
    //[UdonBehaviourSyncMode(BehaviourSyncMode.NoVariableSync)]
    //public class CycleButtonController : UdonSharpBehaviour
#else
    /// This version of the button script is not networked
    /// </summary>
    //[UdonBehaviourSyncMode(BehaviourSyncMode.NoVariableSync)]
    //public class ButtonController : UdonSharpBehaviour
#endif
    #endregion VariantControl
    [UdonBehaviourSyncMode(BehaviourSyncMode.NoVariableSync)]
    public class ButtonController : UdonSharpBehaviour
    {
        #region SyncedFields
#if NETWORK_SYNC_VERSION
        /// <summary>
        /// The synced button state, where true = on, false = off
        /// </summary>
        [UdonSynced, HideInInspector]
        public bool _syncedState = false;
#endif
        #endregion SyncedFields
        #region EditorTest
#if EDITOR_TEST && UNITY_EDITOR
        [SerializeField]
        private Transform _fakeHand;
#endif
        #endregion EditorTest
        #region PlayerCalibrationAPI
        /// <summary>
        /// Relevant bone from the left hand (of localPlayer), can be set by an external script for better usability of the keyboard accross all players. 
        /// One such script is my AvatarCalibrationScript which I sell on my booth page.
        /// </summary>
        [HideInInspector]
        public HumanBodyBones _leftIndexBone = HumanBodyBones.LeftIndexDistal;
        /// <summary>
        /// Relevant bone from the right hand (of localPlayer), can be set by an external script for better usability of the keyboard accross all players. 
        /// One such script is my AvatarCalibrationScript which I sell on my booth page.
        /// </summary>
        [HideInInspector]
        public HumanBodyBones _rightIndexBone = HumanBodyBones.RightIndexDistal;
        /// <summary>
        /// Avatar height in meter (of localPlayer), can be set by an external script for better usability of the keyboard. 
        /// Afterwards, OnAvatarChanged() must be called on this script.
        /// One such script that does all of that is my AvatarCalibrationScript which I sell on my booth page.
        /// </summary>
        [HideInInspector, Tooltip("Avatar height in meter (of localPlayer), can be set by an external script for better usability of the keyboard. Afterwards, OnAvatarChanged() must be called on this script. One such script that does all of that is my AvatarCalibrationScript which I sell on my booth page")]
        public float _avatarHeight = 1.3f;
        #endregion PlayerCalibrationAPI
        #region SerializedFields
#if USE_AREA_TOGGLES && NETWORK_SYNC_VERSION
        [HideInInspector]
        public bool _playerIsInArea = false;
#endif
        /// <summary>
        /// If the button is on / green at start (can be used to set the default state in editor, 
        /// do not modify this at runtime, only use _ExternalButtonOn() and _ExternalButtonOff() for this)
        /// </summary>
        [SerializeField, Tooltip("If the button is on / green at start (can be used to set the default state in editor, do not modify this at runtime, only use _ExternalButtonOn() and _ExternalButtonOff() for this)")]
        private bool _isOnAtStart = false;
        /// <summary>
        /// If the <see cref="_buttonDownEventName"/> should be called on the <see cref="_targetScript"/>
        /// </summary>
        [SerializeField, Tooltip("If the _buttonDownEventName should be called on the _targetScript")]
        private bool _sendButtonDownEvent = true;
        /// <summary>
        /// Name of the event that is fired at <see cref="_targetScript"/> when the button is pressed down.
        /// Begin the event name with an underscore to protect this from being called on the network by malicious client users.
        /// </summary>
        [SerializeField, Tooltip("Name of the event that is fired at _targetScript when the button is pressed down. Begin the event name with an underscore to protect this from being called on the network by malicious client users.")]
        private string _buttonDownEventName = "_ButtonDownEvent";
        /// <summary>
        /// If the <see cref="_buttonUpEventName"/> should be called on the <see cref="_targetScript"/>
        /// </summary>
        [SerializeField, Tooltip("If the _buttonUpEventName should be called on the _targetScript")]
        private bool _sendButtonUpEvent = false;
        /// <summary>
        /// Name of the event that is fired at <see cref="_targetScript"/> when the button is released after being pressed down.
        /// Begin the event name with an underscore to protect this from being called on the network by malicious client users.
        /// </summary>
        [SerializeField, Tooltip("Name of the event that is fired at _targetScript when the button is released after being pressed down. Begin the event name with an underscore to protect this from being called on the network by malicious client users.")]
        private string _buttonUpEventName = "_ButtonUpEvent";
        /// <summary>
        /// Target script that receives <see cref="_buttonDownEventName"/> and <see cref="_buttonUpEventName"/> calls
        /// </summary>
        [SerializeField, Tooltip("(Optional) Target script that receives _buttonDownEventName and _buttonUpEventName calls. Can be empty.")]
        private UdonBehaviour _targetScript = null;
        /// <summary>
        /// GameObject(s) that are set to _isOnAtStart and toggled enabled/disabled via button press
        /// </summary>
        [SerializeField, Tooltip("(Optional) GameObject(s) that are set to _isOn at start and toggled enabled/disabled via button press. Can be empty.")]
        private GameObject[] _toggledGameObjects;
#if !CYCLE_BUTTON_VERSION
        /// <summary>
        /// By default, this button will force all objects into the <see cref="_isOnAtStart"/> state.
        /// If enabled, the original state of each toggled object will be kept from editor and toggled
        /// when the button is pressed, which allows different object states at the same time.
        /// </summary>
        [SerializeField, Tooltip("By default, this button will force all objects into the _isOnAtStart state. If enabled, the original state of each toggled object will be kept from editor and toggled when the button is pressed, which allows different object states at the same time.")]
        private bool _keepEditorObjectState = false;
#endif
#if !NETWORK_SYNC_VERSION && !RADIO_BUTTON_VERSION && !CYCLE_BUTTON_VERSION
        /// <summary>
        /// A network-synced button that should share the same state with this one here, can be empty. 
        /// You can only sync 1 network-synced button with several not-network-synced buttons.
        /// You can press either of them to toggle all, but they need to reference each other 
        /// and also reference the same receiving scripts/objects
        /// </summary>
        [SerializeField, Tooltip("(Optional) Network-synced button that should share the same state with this one here, can be empty. You can only sync 1 network-synced button with several not-network-synced buttons. You can press either of them to toggle all, but they need to reference each other and also reference the same receiving scripts/objects")]
        private SyncedButtonController _networkSyncedButton;
#endif
#if RADIO_BUTTON_VERSION
        /// <summary>
        /// Other radio buttons that should be toggled off when this one here is toggled on and vise versa. 
        /// You can toggle either of them on to toggle all others off, but they need to reference each other.
        /// They can reference different receiving scripts/objects, those are not auto-synced.
        /// </summary>
        [SerializeField, Tooltip("(Optional) Other radio buttons that should be toggled off when this one here is toggled on and vise versa. You can toggle either of them on to toggle all others off, but they need to reference each other. They can reference different receiving scripts/objects, those are not auto-synced.")]
        private RadioButtonController[] _syncedButtons;
#elif CYCLE_BUTTON_VERSION
        /// <summary>
        /// Other cycle buttons that should be toggled when this one here is toggled and vise versa. 
        /// You can toggle either of them to toggle all others, but they need to reference each other.
        /// They can reference different receiving scripts/objects, those are not auto-synced.
        /// </summary>
        [SerializeField, Tooltip("(Optional) Other cycle buttons that should be toggled when this one here is toggled and vise versa. You can toggle either of them to toggle all others, but they need to reference each other. They can reference different receiving scripts/objects, those are not auto-synced.")]
        private CycleButtonController[] _syncedButtons;
#else
        /// <summary>
        /// Other (not network-synced) buttons that should share the same state with this one here. 
        /// You can press either of them to toggle all, but they need to reference each other 
        /// and also reference the same receiving scripts/objects
        /// </summary>
        [SerializeField, Tooltip("(Optional) Other normal buttons that should share the same state with this one here. You can press either of them to toggle all, but they need to reference each other and also reference the same receiving scripts/objects")]
        private ButtonController[] _syncedButtons;
#endif
        /// <summary>
        /// Audio that plays when the button is released after being fully pressed down
        /// </summary>
        [SerializeField, Tooltip("Audio that plays when the button is released after being fully pressed down")]
        private AudioClip _clickUpAudioClip;
        /// <summary>
        /// Audio that plays when the button is fully pressed down
        /// </summary>
        [SerializeField, Tooltip("Audio that plays when the button is fully pressed down")]
        private AudioClip _clickDownAudioClip;
#if !USE_AREA_TOGGLES
        /// <summary>
        /// LOD renderer that activates the push detection (should be LOD0) when the button is on
        /// </summary>
        [SerializeField, Tooltip("LOD renderer that activates the push detection (should be LOD0) when the button is on")]
        private Renderer _lod0RendererWhenOnFromStatic;
        /// <summary>
        /// LOD renderer that activates the push detection (should be LOD0) when the button is off
        /// </summary>
        [SerializeField, Tooltip("LOD renderer that activates the push detection (should be LOD0) when the button is off")]
        private Renderer _lod0RendererWhenOffFromStatic;
#endif
        /// <summary>
        /// Area in which pushing the button is calculated if any bones are inside
        /// </summary>
        [SerializeField, Tooltip("Area in which pushing the button is calculated if any bones are inside")]
        private BoxCollider _pushArea;
        /// <summary>
        /// Button top (the pushable part of the button) for when the button is dynamic and on
        /// </summary>
        [SerializeField, Tooltip("Button top (the pushable part of the button) for when the button is dynamic and on")]
        private GameObject _dynamicButtonTopOn;
        /// <summary>
        /// Button top (the pushable part of the button) for when the button is dynamic and off
        /// </summary>
        [SerializeField, Tooltip("Button top (the pushable part of the button) for when the button is dynamic and off")]
        private GameObject _dynamicButtonTopOff;
        /// <summary>
        /// Button base (the static part of the button) for when the button is dynamic
        /// </summary>
        [SerializeField, Tooltip("Button base (the static part of the button) when the button is dynamic")]
        private GameObject _dynamicButtonBase;
        /// <summary>
        /// Static button model for when the button is on but not being pushed
        /// </summary>
        [SerializeField, Tooltip("Static button model for when the button is on but not being pushed")]
        private GameObject _staticButtonOn;
        /// <summary>
        /// Static button model for when the button is off but not being pushed
        /// </summary>
        [SerializeField, Tooltip("Static button model for when the button is off but not being pushed")]
        private GameObject _staticButtonOff;
        /// <summary>
        /// Start position of the button when not pressed and push direction (blue axis / forward direction).
        /// This object is set to the _buttonPushDirection position at Start().
        /// </summary>
        [SerializeField, Tooltip("Start position of the button when not pressed and push direction (blue axis / forward direction). This object is set to the _buttonPushDirection position at Start().")]
        private Transform _buttonPushDirection;
        #endregion SerializedFields
        #region Settings
        /// <summary>
        /// Finger thickness of a standard sized avatar (1.3m), will automatically scale with avatar size
        /// </summary>
#if EXPOSE_SETTINGS_TO_EDITOR
        [SerializeField, Tooltip("Finger thickness of a standard sized avatar (1.3m), will automatically scale with avatar size")]
        private float FINGER_THICKNESS_DEFAULT = 0.02f;
#else
        private const float FINGER_THICKNESS_DEFAULT = 0.02f;
#endif
        /// <summary>
        /// How far the button can be pressed down from the start position at scale 1
        /// </summary>
#if EXPOSE_SETTINGS_TO_EDITOR
        [SerializeField, Tooltip("How far the button can be pressed down from the start position at scale 1")]
        private float BUTTON_PUSH_DISTANCE_DEFAULT = 0.03f;
#else
        private const float BUTTON_PUSH_DISTANCE_DEFAULT = 0.03f;
#endif
        /// <summary>
        /// At how much of BUTTON_PUSH_DISTANCE the button will trigger,
        /// from 0 to 1, recommended is 0.9 (90%)
        /// </summary>
#if EXPOSE_SETTINGS_TO_EDITOR
        [SerializeField, Tooltip("At how much of BUTTON_PUSH_DISTANCE the button will trigger, from 0 to 1, recommended is 0.9 (90%)")]
        private float BUTTON_TRIGGER_PERCENTAGE = 0.9f;
#else
        private const float BUTTON_TRIGGER_PERCENTAGE = 0.9f;
#endif
        /// <summary>
        /// At how much of BUTTON_PUSH_DISTANCE the button will un-trigger to be pushable again,
        /// from 0 to 1, recommended is 0.55 (55%)
        /// </summary>
#if EXPOSE_SETTINGS_TO_EDITOR
        [SerializeField, Tooltip("At how much of BUTTON_PUSH_DISTANCE the button will un-trigger to be pushable again, from 0 to 1, recommended is 0.55 (55%)")]
        private float BUTTON_UNTRIGGER_PERCENTAGE = 0.55f;
#else
        private const float BUTTON_UNTRIGGER_PERCENTAGE = 0.55f;
#endif
        /// <summary>
        /// Speed in meters/second at which the button will move itself at scale 1
        /// </summary>
#if EXPOSE_SETTINGS_TO_EDITOR
        [SerializeField, Tooltip("Speed in meters/second at which the button will move itself at scale 1")]
        private float MOVING_SPEED_DEFAULT = 0.2f;
#else
        private const float MOVING_SPEED_DEFAULT = 0.2f;
#endif
        /// <summary>
        /// Minimal time (in seconds) that must pass between two button triggers
        /// </summary>
#if EXPOSE_SETTINGS_TO_EDITOR
        [SerializeField, Tooltip("Minimal time (in seconds) that must pass between two button triggers")]
        private float MIN_TRIGGER_TIME_OFFSET = 0.2f;
#else
        private const float MIN_TRIGGER_TIME_OFFSET = 0.2f;
#endif
        #endregion Settings
        #region PrivateFields
#if DEBUG_TEST || EDITOR_TEST
        private string _buttonDebugName = "PARENT_MISSING";
#endif
        private bool _isOn;
        /// <summary>
        /// Current button top of the pushable part of the button
        /// </summary>
        private Transform _currentDynamicButtonTop;
        private bool _isMovingDownDesktop = false;
        private Bounds _pushAreaBounds;
        private float _buttonPushDistance = BUTTON_PUSH_DISTANCE_DEFAULT;
        private float _buttonMovingSpeed = MOVING_SPEED_DEFAULT;
        private float _buttonTriggerDistance;
        private float _buttonUntriggerDistance;
        private float _fingerThickness;
        private float _lastTriggerTime;
        private Renderer _lodLevelRenderer;
        private bool _hasNotFinishedStart = true;
        private float _handPushDistance;
        private bool _wasTriggered = false;
        private bool _wasPushing = false;
        private bool _isPushingRightNow = false;
        private float _currentPushedDistance;
        private bool _leftHandIsClosest;
        private VRCPlayerApi _localPlayer;
        private MeshCollider _desktopButtonCollider;
        private bool _isVR;
        private bool _isInDesktopFallbackMode;
        private bool _desktopButtonForVrDisabled = true;
#if PREVENT_PUSHING_FROM_BEHIND
        private bool _isInDetectionArea = false;
        private bool _wasInFront;
#endif
        private int _currentActiveObjectIndex;
        #endregion PrivateFields
        #region FingerBones
        /// <summary>
        /// The (other) furthest bones from the current avatar. The first index finger can be found in the API region.
        /// </summary>
        private HumanBodyBones _fingerbone2r = HumanBodyBones.RightLittleDistal;
        private HumanBodyBones _fingerbone3r = HumanBodyBones.RightMiddleDistal;
        private HumanBodyBones _fingerbone4r = HumanBodyBones.RightRingDistal;
        private HumanBodyBones _fingerbone5r = HumanBodyBones.RightThumbDistal;
        private HumanBodyBones _fingerbone2l = HumanBodyBones.LeftLittleDistal;
        private HumanBodyBones _fingerbone3l = HumanBodyBones.LeftMiddleDistal;
        private HumanBodyBones _fingerbone4l = HumanBodyBones.LeftRingDistal;
        private HumanBodyBones _fingerbone5l = HumanBodyBones.LeftThumbDistal;
        #endregion FingerBones
        #region StartUpdate
        /// <summary>
        /// Checks in which direction the button is currently oriented
        /// </summary>
        private void Start()
        {
#if !EDITOR_TEST
            _localPlayer = Networking.LocalPlayer;
#if UNITY_EDITOR
            if (_localPlayer == null)
            {
                this.gameObject.SetActive(false);
                return;
            }
#endif
#if CYCLE_BUTTON_VERSION
            _isOn = false;
#else
            _isOn = _isOnAtStart;
#endif
            _isVR = _localPlayer.IsUserInVR();
            if (_targetScript == null && _toggledGameObjects.Length == 0)
            {
                Debug.LogError($"[ButtonController] No UdonBehaviour or toggled game object assigned, the button '{this.transform.parent.name}' won't do anything.");
            }
            //we apply the current state to the objects after start to avoid issues. The randomizer ensures a smoother frametime distribution.
            SendCustomEventDelayedFrames(nameof(_ApplyStartActiveState), Random.Range(1, 30));
#if NETWORK_SYNC_VERSION
            if (_localPlayer.isMaster)
            {
                //If the user is master, this means they are the first one who joined the instance and need to set the default state to network
                ApplyStateToNetwork();
            }
#endif
            if (_sendButtonDownEvent && _buttonDownEventName.Trim() == "")
                _buttonDownEventName = "_ButtonDownEvent";
            if (_sendButtonUpEvent && _buttonUpEventName.Trim() == "")
                _buttonUpEventName = "_ButtonUpEvent";
#else
                _isVR = false;
#endif
            _desktopButtonCollider = this.GetComponent<MeshCollider>();
            if (_desktopButtonCollider == null)
            {
                Debug.LogError($"[ButtonController] No MeshCollider assigned to button '{this.transform.parent.name}'");
                this.gameObject.SetActive(false);
                return;
            }
            if (_desktopButtonForVrDisabled)
            {
                _desktopButtonCollider.enabled = !_isVR; //disable for VR user, enable for desktop user
            }
            else
            {
                _desktopButtonCollider.enabled = true; //enable for all users
            }
            ReadButtonBounds();
            InitializeButtonSwitch();
            MakeStatic();
            _buttonPushDirection.position = _isOn ? _dynamicButtonTopOn.transform.position : _dynamicButtonTopOff.transform.position;
            SetupButtonDistances();
            _fingerThickness = FINGER_THICKNESS_DEFAULT;
#if DEBUG_TEST || EDITOR_TEST
            Transform parent = this.transform.parent;
            if (parent == null)
                Debug.LogError($"[ButtonController] Button-script '{this.name}' has no parent, this is not allowed.");
            else
                _buttonDebugName = parent.name;
#endif
            _hasNotFinishedStart = false;
        }
        /// <summary>
        /// Applies the current active state to all objects at least one frame after Start() to avoid initialization issues
        /// </summary>
        public void _ApplyStartActiveState()
        {
#if CYCLE_BUTTON_VERSION
            if (_toggledGameObjects.Length > 0)
            {
                if (_isOnAtStart)
                {
                    _currentActiveObjectIndex = 0;
                    //enable the first object
                    GameObject obj = _toggledGameObjects[_currentActiveObjectIndex];
                    if (Utilities.IsValid(obj))
                        obj.SetActive(true);
                    //disable all other objects
                    for (int i = 1; i < _toggledGameObjects.Length; i++)
                    {
                        obj = _toggledGameObjects[i];
                        if (Utilities.IsValid(obj))
                            obj.SetActive(false);
                    }
                }
                else
                {
                    _currentActiveObjectIndex = -1;
                    //disable all objects
                    foreach (GameObject obj in _toggledGameObjects)
                    {
                        if (Utilities.IsValid(obj))
                            obj.SetActive(false);
                    }
                }
            }
#else
            if (_keepEditorObjectState) { } //compiler optimization
            else
            {
                //set into default state
                foreach (GameObject obj in _toggledGameObjects)
                {
                    if (Utilities.IsValid(obj))
                        obj.SetActive(_isOn);
                }
            }
#endif
        }
        /// <summary>
        /// Determines all button distances at start
        /// </summary>
        private void SetupButtonDistances()
        {
            float scale = this.transform.lossyScale.y;
            _buttonPushDistance = BUTTON_PUSH_DISTANCE_DEFAULT * scale;
            _buttonMovingSpeed = MOVING_SPEED_DEFAULT * scale;
            if (_buttonPushDistance < 0)
                _buttonPushDistance *= -1f; //correct potential user error
            _buttonTriggerDistance = _buttonPushDistance * BUTTON_TRIGGER_PERCENTAGE;
            _buttonUntriggerDistance = _buttonPushDistance * BUTTON_UNTRIGGER_PERCENTAGE;
        }
        /// <summary>
        /// Reads button bounds at start. If the button won't move or rotate at runtime, those are worldspace bounds,
        /// else localspace bounds are determined.
        /// </summary>
        private void ReadButtonBounds()
        {
            //read the bounds from the push area
#if !ALLOW_BUTTON_TO_MOVE_AND_ROTATE
            _pushAreaBounds = _pushArea.bounds;
#else
            _pushAreaBounds = new Bounds(_pushArea.center, _pushArea.size);
#endif
        }
        /// <summary>
        /// Only run script when target LOD is active
        /// </summary>
        private void Update()
        {
#if UNITY_EDITOR && !EDITOR_TEST
            //we don't run this in editor unless we have an emulator like Cyan-Emu running
            if (_localPlayer == null)
                return;
#endif
#if !USE_AREA_TOGGLES
            if (_lodLevelRenderer.isVisible || _wasPushing)
            {
#elif NETWORK_SYNC_VERSION
            if( _playerIsInArea)
            {
#endif
                if (_isVR)
                    RunButtonForVR();
                else
                    RunButtonForDesktop();
#if !USE_AREA_TOGGLES || NETWORK_SYNC_VERSION
            }
#endif
        }
        #endregion StartUpdate
        #region Calibration
        /// <summary>
        /// Is called from my player calibration script (https://reimajo.booth.pm/items/2753511) when the avatar changed
        /// This is externally called after setting _avatarHeight (happening after localPlayer changed their avatar)
        /// </summary>
        public void _OnAvatarChanged()
        {
            if (_hasNotFinishedStart)
                return;
            if (_isVR)
            {
                if (_leftIndexBone == HumanBodyBones.LeftLowerArm || _rightIndexBone == HumanBodyBones.RightLowerArm)
                {
                    //enable the "desktop" mode because the player is missing all finger bones
                    _desktopButtonCollider.enabled = true;
                    _isVR = false;
                    _isInDesktopFallbackMode = true;
                }
                else
                {
                    //distances are made for a 1.3m avatar as a reference
                    _fingerThickness = FINGER_THICKNESS_DEFAULT * _avatarHeight / 1.3f;
                    //determine the furthest bones from all other fingers
                    _fingerbone2r = _localPlayer.GetBonePosition(HumanBodyBones.RightLittleDistal) == Vector3.zero ? HumanBodyBones.RightLittleIntermediate : HumanBodyBones.RightLittleDistal;
                    _fingerbone3r = _localPlayer.GetBonePosition(HumanBodyBones.RightMiddleDistal) == Vector3.zero ? HumanBodyBones.RightMiddleIntermediate : HumanBodyBones.RightMiddleDistal;
                    _fingerbone4r = _localPlayer.GetBonePosition(HumanBodyBones.RightRingDistal) == Vector3.zero ? HumanBodyBones.RightRingIntermediate : HumanBodyBones.RightRingDistal;
                    _fingerbone5r = _localPlayer.GetBonePosition(HumanBodyBones.RightThumbDistal) == Vector3.zero ? HumanBodyBones.RightThumbIntermediate : HumanBodyBones.RightThumbDistal;
                    _fingerbone2l = _localPlayer.GetBonePosition(HumanBodyBones.LeftLittleDistal) == Vector3.zero ? HumanBodyBones.LeftLittleIntermediate : HumanBodyBones.LeftLittleDistal;
                    _fingerbone3l = _localPlayer.GetBonePosition(HumanBodyBones.LeftMiddleDistal) == Vector3.zero ? HumanBodyBones.LeftMiddleIntermediate : HumanBodyBones.LeftMiddleDistal;
                    _fingerbone4l = _localPlayer.GetBonePosition(HumanBodyBones.LeftRingDistal) == Vector3.zero ? HumanBodyBones.LeftRingIntermediate : HumanBodyBones.LeftRingDistal;
                    _fingerbone5l = _localPlayer.GetBonePosition(HumanBodyBones.LeftThumbDistal) == Vector3.zero ? HumanBodyBones.LeftThumbIntermediate : HumanBodyBones.LeftThumbDistal;
                }
            }
            else if (_isInDesktopFallbackMode)
            {
                if (_leftIndexBone != HumanBodyBones.LastBone && _rightIndexBone != HumanBodyBones.LastBone)
                {
                    _isInDesktopFallbackMode = false;
                    if (_desktopButtonForVrDisabled)
                    {
                        //enable the regular VR mode again
                        _desktopButtonCollider.enabled = false;
                        _isVR = true;
                    }
                }
            }
        }
        #endregion Calibration
        #region RunButtonForVR
        /// <summary>
        /// After determining where the hand bones are, the button runs in 3 steps:
        /// 1. Move the button down if the hand is in bounds & more pushed then it currently was, 
        ///    fire ButtonDown() when the button passes the trigger distance.
        /// 2. Move the button back if the hand is no longer in bounds or less pushed then it currently was
        /// 3. Fire the ButtonUp() event when the button moves back and passes the unTrigger-distance after 
        ///    it was triggered
        /// </summary>
        private void RunButtonForVR()
        {
            CheckAllFingerBones();
            //check if at least one of the bones was in bounds
            if (_isPushingRightNow && _currentPushedDistance <= _handPushDistance)
            {
                if (!_wasPushing)
                {
                    _wasPushing = true;
                    MakeDynamic();
                }
                //pushing the button down
                _currentPushedDistance = Mathf.Min(_handPushDistance, _buttonPushDistance);
                _currentDynamicButtonTop.transform.position = _buttonPushDirection.position + (_buttonPushDirection.forward * _currentPushedDistance);
                //trigger action when limit reached
                if (!_wasTriggered && _currentPushedDistance >= _buttonTriggerDistance && (Time.time - _lastTriggerTime) > MIN_TRIGGER_TIME_OFFSET)
                {
                    _lastTriggerTime = Time.time;
                    ButtonDownEvent();
                    UpdateDynamicButtonObjects();
#if NETWORK_SYNC_VERSION
                    ApplyStateToNetwork();
#endif
                    _wasTriggered = true;
                    AudioSource.PlayClipAtPoint(_clickDownAudioClip, _buttonPushDirection.position, 0.1f);
#if !UNITY_EDITOR
                    if (_leftHandIsClosest)
                        _localPlayer.PlayHapticEventInHand(VRC_Pickup.PickupHand.Left, 0.1f, 1.0f, 30f); //seconds, 0-320hz, 0-1 aplitude
                    else
                        _localPlayer.PlayHapticEventInHand(VRC_Pickup.PickupHand.Right, 0.1f, 1.0f, 30f); //seconds, 0-320hz, 0-1 aplitude
#endif
                }
            }
            else if (_wasPushing)
            {
                //cap hand push distance
                _handPushDistance = Mathf.Min(_handPushDistance, _buttonPushDistance);
                //move it slowly back, but not further than it's currently being pushed
                _currentPushedDistance = Mathf.Max(_handPushDistance, _currentPushedDistance - (Time.deltaTime * _buttonMovingSpeed));
                _currentDynamicButtonTop.transform.position = _buttonPushDirection.position + (_buttonPushDirection.forward * _currentPushedDistance);
                //stop when it's fully moved back
                if (_currentPushedDistance <= 0)
                {
                    _wasPushing = false;
                    MakeStatic();
                }
            }
            //wait until the button moved x percent back to set _wastriggered to false
            if (_wasTriggered)
            {
                if (_currentPushedDistance <= _buttonUntriggerDistance)
                {
                    _wasTriggered = false;
                    ButtonUpEvent();
                    AudioSource.PlayClipAtPoint(_clickUpAudioClip, _buttonPushDirection.position, 0.1f);
#if !UNITY_EDITOR
                    if (_isPushingRightNow)
                    {
                        if (_leftHandIsClosest)
                            _localPlayer.PlayHapticEventInHand(VRC_Pickup.PickupHand.Left, 0.1f, 1.0f, 30f); //seconds, 0-320hz, 0-1 amplitude
                        else
                            _localPlayer.PlayHapticEventInHand(VRC_Pickup.PickupHand.Right, 0.1f, 1.0f, 30f); //seconds, 0-320hz, 0-1 amplitude
                    }
#endif
                }
            }
        }
        /// <summary>
        /// Checks all finger bones if they are in bounds to get the highest push distance of all bones
        /// </summary>
        private void CheckAllFingerBones()
        {
            //check all bones if one is pushing the button
            _isPushingRightNow = false;
#if PREVENT_PUSHING_FROM_BEHIND
            if (_isInDetectionArea) //compiler optimization
            {
                //check all bones if one is inside the detection area
                _isInDetectionArea = false;
            }
#endif
            //reset to 0, will be set by the following methods to the highest value
            _handPushDistance = 0;
#if EDITOR_TEST && UNITY_EDITOR
            CheckBoneDistance(_leftIndexBone, isLeftHand: true);
#else
            //check all left hand bones
            CheckBoneDistance(_leftIndexBone, isLeftHand: true);
            CheckBoneDistance(_fingerbone2l, isLeftHand: true);
            CheckBoneDistance(_fingerbone3l, isLeftHand: true);
            CheckBoneDistance(_fingerbone4l, isLeftHand: true);
            CheckBoneDistance(_fingerbone5l, isLeftHand: true);
            //check all right hand bones
            CheckBoneDistance(_rightIndexBone, isLeftHand: false);
            CheckBoneDistance(_fingerbone2r, isLeftHand: false);
            CheckBoneDistance(_fingerbone3r, isLeftHand: false);
            CheckBoneDistance(_fingerbone4r, isLeftHand: false);
            CheckBoneDistance(_fingerbone5r, isLeftHand: false);
            //check all hand bones
            CheckBoneDistance(HumanBodyBones.RightHand, isLeftHand: false);
            CheckBoneDistance(HumanBodyBones.LeftHand, isLeftHand: true);
#endif
#if PREVENT_PUSHING_FROM_BEHIND
            //check if we were in front of the button once
            if (_wasInFront)
            {
                //if no bone was inside the detection area in this frame, we forget that we were in front once
                if (_isInDetectionArea) { }  //compiler optimization
                else
                {
                    _wasInFront = false;
                }
            }
#endif
        }
        /// <summary>
        /// Checks a single bone if it's inside bounds. If true, the distance to the bone is measured against _buttonPushDirection
        /// </summary>
        private void CheckBoneDistance(HumanBodyBones bone, bool isLeftHand)
        {
#if EDITOR_TEST && UNITY_EDITOR
            Vector3 position = _fakeHand.position;
#else
            Vector3 position = _localPlayer.GetBonePosition(bone);
#endif
#if ALLOW_BUTTON_TO_MOVE_AND_ROTATE
            if (_pushAreaBounds.Contains(_pushArea.transform.InverseTransformPoint(position)))
#else
            if (_pushAreaBounds.Contains(position))
#endif
            {
#if PREVENT_PUSHING_FROM_BEHIND
                if (_isInDetectionArea) { }  //compiler optimization
                else
                {
                    //we first entered the detection area in this frame
                    _isInDetectionArea = true;
                }
#endif
                //measure distances to hand bone
                float distanceToHandNew = SignedDistancePlanePoint(_buttonPushDirection.transform.forward, _buttonPushDirection.position, position) + _fingerThickness;
#if EDITOR_TEST && UNITY_EDITOR
                Debug.Log($"[ButtonController] distanceToHandNew: {distanceToHandNew}");
#endif
                //only the lowest distance is important for us. Must be lower than 0 to be behind the _buttonPushDirection plane.
                if (distanceToHandNew > 0)
                {
                    //only relevant if the current value is bigger than the last value
                    if (_handPushDistance < distanceToHandNew)
                    {
#if PREVENT_PUSHING_FROM_BEHIND
                        //only allow pushing if the hand was already in front of the button before
                        if (_wasInFront)
                        {
                            _handPushDistance = distanceToHandNew;
                            _leftHandIsClosest = isLeftHand;
                            _isPushingRightNow = true;
                        }
#else
                        _handPushDistance = distanceToHandNew;
                        _leftHandIsClosest = isLeftHand;
                        _isPushingRightNow = true;
#endif
                    }
                }
#if PREVENT_PUSHING_FROM_BEHIND
                else
                {
                    if (_wasInFront) { }  //compiler optimization
                    else
                    {
                        //we first entered the front area after being outside of the button area
                        _wasInFront = true;
                    }
                }
#endif
            }
#if EDITOR_TEST && UNITY_EDITOR
            else
            {
                Debug.Log($"[ButtonController] Hand is not in bounds");
            }
#endif
        }
        #endregion RunButtonForVR
        #region RunButtonForDesktop
        /// <summary>
        /// Is called when a desktop user clicks on the button collider.
        /// Do not call this method from your own scripts, use the API instead.
        /// </summary>
        public override void Interact()
        {
            if (_isVR) //avoid that others use this in VR mode which would lead to unexpected behaviour, use the API instead
                return;
#if DEBUG_TEST
            Debug.Log($"[ButtonController] '{_buttonDebugName}' was pressed, is currently {(_isOn ? "ON" : "OFF")}");
#endif
            if (_wasTriggered || _isMovingDownDesktop || (Time.time - _lastTriggerTime) <= MIN_TRIGGER_TIME_OFFSET)
                return;
            if (!_wasPushing) //used to determine if the button is currently static or moving
            {
                _wasPushing = true;
                MakeDynamic();
            }
            _desktopButtonCollider.enabled = false;
            _isMovingDownDesktop = true;
            _wasTriggered = true;
        }
        /// <summary>
        /// Animates the button to move down and then back up while accurately firing the button events like in VR mode
        /// </summary>
        private void RunButtonForDesktop()
        {
            if (!_wasPushing)
                return;
            //check if at least one of the bones was in bounds
            if (_isMovingDownDesktop)
            {
                //pushing the button down
                _currentPushedDistance = Mathf.Min(_buttonPushDistance, _currentPushedDistance + (Time.deltaTime * _buttonMovingSpeed));
                _currentDynamicButtonTop.transform.position = _buttonPushDirection.position + (_buttonPushDirection.forward * _currentPushedDistance);
                //trigger action when limit reached
                if (_currentPushedDistance >= _buttonTriggerDistance)
                {
                    ButtonDownEvent();
                    UpdateDynamicButtonObjects();
#if NETWORK_SYNC_VERSION
                    ApplyStateToNetwork();
#endif
                    AudioSource.PlayClipAtPoint(_clickDownAudioClip, _buttonPushDirection.position, 0.1f);
                    _lastTriggerTime = Time.time;
                    _wasTriggered = true;
                    _isMovingDownDesktop = false;
                }
            }
            else
            {
                //move it slowly back, but not further than it's currently being pushed
                _currentPushedDistance = Mathf.Max(0, _currentPushedDistance - (Time.deltaTime * _buttonMovingSpeed));
                _currentDynamicButtonTop.transform.position = _buttonPushDirection.position + (_buttonPushDirection.forward * _currentPushedDistance);
                //wait until the button moved x percent back to set _wastriggered to false
                if (_wasTriggered)
                {
                    if (_currentPushedDistance <= _buttonUntriggerDistance)
                    {
                        _wasTriggered = false;
                        _desktopButtonCollider.enabled = true;
                        ButtonUpEvent();
                        AudioSource.PlayClipAtPoint(_clickUpAudioClip, _buttonPushDirection.position, 0.1f);
                    }
                }
                //stop when it's fully moved back
                if (_currentPushedDistance <= 0)
                {
                    _wasPushing = false;
                    MakeStatic();
                }
            }
        }
        #endregion RunButtonForDesktop
        #region ExternalControl
        /// <summary>
        /// Call this event from your own scripts to enable the desktop button for VR users
        /// </summary>
        public void _EnableDesktopButtonForVR()
        {
            if (_desktopButtonForVrDisabled)
            {
                _desktopButtonForVrDisabled = false;
                //enable the "desktop" mode
                _isVR = false;
                //don't access the desktop button collider too early since that one is fetched at start
                if (_hasNotFinishedStart)
                    return;
                _desktopButtonCollider.enabled = true;
            }
        }
        /// <summary>
        /// Call this event from your own scripts to enable the desktop button for VR users
        /// </summary>
        public void _DisableDesktopButtonForVR()
        {
            if (_desktopButtonForVrDisabled) { }
            else
            {
                _desktopButtonForVrDisabled = true;
                if (_isInDesktopFallbackMode)
                    return;
                //disable the "desktop" mode
                _isVR = true;
                //don't access the desktop button collider too early since that one is fetched at start
                if (_hasNotFinishedStart)
                    return;
                _desktopButtonCollider.enabled = false;
            }
        }
#if CYCLE_BUTTON_VERSION
        /// <summary>
        /// DON'T CALL THIS EVENT. Call _TurnButtonOn instead.
        /// This here is only called from another button to sync this one instantly without animating it.
        /// </summary>
        public void _ButtonSyncCycleToNextObject()
        {
            //switch to the next object on the list
            _currentActiveObjectIndex++;
            if (_currentActiveObjectIndex >= _toggledGameObjects.Length)
            {
                _currentActiveObjectIndex = _isOnAtStart ? 0 : -1;
            }
        }
#else
        /// <summary>
        /// Call this event from your own scripts to turn this button on.
        /// </summary>
        public void _TurnButtonOn()
        {
            if (!_isOn)
            {
#if DEBUG_TEST
                Debug.Log($"[ButtonController] '{_buttonDebugName}' is set to ON by an external script.");
#endif
                ButtonDownEvent();
                UpdateButtonState();
#if NETWORK_SYNC_VERSION
                ApplyStateToNetwork();
#endif
            }
#if DEBUG_TEST
            else
            {
                Debug.Log($"[ButtonController] '{_buttonDebugName}' is set to ON by an external script but is already ON, skipped event.");
            }
#endif
        }
        /// <summary>
        /// Call this event from your own scripts to turn this button off.
        /// </summary>
        public void _TurnButtonOff()
        {
            if (_isOn)
            {
#if DEBUG_TEST
                Debug.Log($"[ButtonController] '{_buttonDebugName}' is set to OFF by an external script.");
#endif
                ButtonDownEvent();
                UpdateButtonState();
#if NETWORK_SYNC_VERSION
                ApplyStateToNetwork();
#endif
            }
#if DEBUG_TEST
            else
            {
                Debug.Log($"[ButtonController] '{_buttonDebugName}' is set to OFF by an external script but is already OFF, skipped event.");
            }
#endif
        }
        /// <summary>
        /// DON'T CALL THIS EVENT. Call _TurnButtonOn instead.
        /// This here is only called from another button to sync this one instantly without animating it.
        /// </summary>
        public void _ButtonSyncSetButtonOn()
        {
            if (!_isOn)
            {
                _isOn = true;
                UpdateButtonState();
#if NETWORK_SYNC_VERSION
                ApplyStateToNetwork();
#endif
            }
        }
        /// <summary>
        /// DON'T CALL THIS EVENT. Call _TurnButtonOff instead.
        /// This here is only called from another button to sync this one instantly without animating it.
        /// </summary>
        public void _ButtonSyncSetButtonOff()
        {
            if (_isOn)
            {
                _isOn = false;
                UpdateButtonState();
#if NETWORK_SYNC_VERSION
                ApplyStateToNetwork();
#elif RADIO_BUTTON_VERSION
                SendButtonDownToTargetScript();
                ApplyStateToTargetGameObjects();
#endif
            }
        }
        private void UpdateButtonState()
        {
            if (_wasPushing)
                UpdateDynamicButtonObjects();
            else
                UpdateStaticButtonObjects();
        }
#endif
        #endregion ExternalControl
        #region InternalButtonEvents
        /// <summary>
        /// Fires when the button goes down and reached the trigger distance while button is dynamic
        /// </summary>
        private void ButtonDownEvent()
        {
#if CYCLE_BUTTON_VERSION
            _isOn = true;
            if (_toggledGameObjects.Length > 0)
            {
                GameObject obj;
                //special case: If _isOnAtStart is false, we have no object enabled at start.
                if (_currentActiveObjectIndex != -1)
                {
                    //disable the current object if it's valid
                    obj = _toggledGameObjects[_currentActiveObjectIndex];
                    if (Utilities.IsValid(obj))
                        obj.SetActive(false);
                }
                //switch to the next object on the list
                _ButtonSyncCycleToNextObject();
                //special case: If _isOnAtStart is false, we have no object enabled at start.
                if (_currentActiveObjectIndex != -1)
                {
                    //enable the current object if it's valid
                    obj = _toggledGameObjects[_currentActiveObjectIndex];
                    if (Utilities.IsValid(obj))
                        obj.SetActive(true);
                }
                //sync the synced buttons
                foreach (CycleButtonController otherButton in _syncedButtons) { otherButton._ButtonSyncCycleToNextObject(); }
            }
            //propagate this button down event to the target script
            SendButtonDownToTargetScript();
#else
            _isOn = !_isOn;

#if DEBUG_TEST
            Debug.Log($"[ButtonController] '{_buttonDebugName}' ButtonDownEvent, button is now {(_isOn ? "ON" : "OFF")}");
#endif
            SendButtonDownToTargetScript();
            ApplyStateToTargetGameObjects();
            //sync other connected buttons to the same state
            if (_isOn)
            {
#if NETWORK_SYNC_VERSION
                foreach (ButtonController otherButton in _syncedButtons) { otherButton._ButtonSyncSetButtonOn(); }
#elif RADIO_BUTTON_VERSION
                foreach (RadioButtonController otherButton in _syncedButtons) { otherButton._ButtonSyncSetButtonOff(); }
#else
                if (_networkSyncedButton != null)
                    _networkSyncedButton._ButtonSyncSetButtonOn();
                foreach (ButtonController otherButton in _syncedButtons) { otherButton._ButtonSyncSetButtonOn(); }
#endif
            }
            else
            {
#if NETWORK_SYNC_VERSION
                foreach (ButtonController otherButton in _syncedButtons) { otherButton._ButtonSyncSetButtonOff(); }
#elif !RADIO_BUTTON_VERSION
                if (_networkSyncedButton != null)
                    _networkSyncedButton._ButtonSyncSetButtonOff();
                foreach (ButtonController otherButton in _syncedButtons) { otherButton._ButtonSyncSetButtonOff(); }
#endif
            }
#endif
        }
        /// <summary>
        /// Applies the current <see cref="_isOn"/> state to the assigned <see cref="_targetScript"/>
        /// </summary>
        private void SendButtonDownToTargetScript()
        {
#if DEBUG_TEST
            if (_sendButtonDownEvent && _targetScript != null)
                Debug.Log($"[ButtonController] '{_buttonDebugName}' sending Event '{_buttonDownEventName}' to Script '{_targetScript.name}'");
#endif
#if !EDITOR_TEST
            if (_sendButtonDownEvent)
            {
                if (Utilities.IsValid(_targetScript))
                    _targetScript.SendCustomEvent(_buttonDownEventName);
            }
#endif
        }
#if !CYCLE_BUTTON_VERSION
        /// <summary>
        /// Applies the current <see cref="_isOn"/> state to all assigned <see cref="_toggledGameObjects"/>
        /// </summary>
        private void ApplyStateToTargetGameObjects()
        {
            if (_keepEditorObjectState) //this is more optimized
            {
                foreach (GameObject obj in _toggledGameObjects)
                {
                    if (Utilities.IsValid(obj))
                        obj.SetActive(!obj.activeSelf); //active self is the child state, ignoring the parent state
                }
            }
            else
            {
                foreach (GameObject obj in _toggledGameObjects)
                {
                    if (Utilities.IsValid(obj))
                        obj.SetActive(_isOn);
                }
            }
        }
#endif
        /// <summary>
        /// Updates the dynamic button objects (assuming it is currently in the dynamic state)
        /// </summary>
        private void UpdateDynamicButtonObjects()
        {
            if (_isOn)
            {
                _dynamicButtonTopOn.transform.position = _currentDynamicButtonTop.position;
                _currentDynamicButtonTop = _dynamicButtonTopOn.transform;
                _dynamicButtonTopOn.SetActive(true);
                _dynamicButtonTopOff.SetActive(false);
            }
            else
            {
                _dynamicButtonTopOff.transform.position = _currentDynamicButtonTop.position;
                _currentDynamicButtonTop = _dynamicButtonTopOff.transform;
                _dynamicButtonTopOn.SetActive(false);
                _dynamicButtonTopOff.SetActive(true);
            }
        }
#if !CYCLE_BUTTON_VERSION
        /// <summary>
        /// Updates the static button objects (assuming it is currently in the static state)
        /// </summary>
        private void UpdateStaticButtonObjects()
        {
            if (_isOn)
            {
                _staticButtonOn.SetActive(true);
                _staticButtonOff.SetActive(false);
#if !USE_AREA_TOGGLES
                _lodLevelRenderer = _lod0RendererWhenOnFromStatic;
#endif
            }
            else
            {
                _staticButtonOn.SetActive(false);
                _staticButtonOff.SetActive(true);
#if !USE_AREA_TOGGLES
                _lodLevelRenderer = _lod0RendererWhenOffFromStatic;
#endif
            }
        }
#endif
        /// <summary>
        /// Fires when button is released after being triggered and reached the un-trigger distance
        /// </summary>
        private void ButtonUpEvent()
        {
#if CYCLE_BUTTON_VERSION
            _isOn = false;
            UpdateDynamicButtonObjects();
#endif
#if !EDITOR_TEST
            if (_sendButtonUpEvent)
            {
                if (Utilities.IsValid(_targetScript))
                    _targetScript.SendCustomEvent(_buttonUpEventName);
            }
#else
            Debug.Log($"[ButtonController] '{_buttonDebugName}' ButtonUp event");
#endif
        }
        #endregion InternalButtonEvents
        #region DynamicStaticSwitch
        /// <summary>
        /// To initialize the button switch, all switching components must be disabled
        /// </summary>
        private void InitializeButtonSwitch()
        {
            _staticButtonOn.SetActive(false);
            _staticButtonOff.SetActive(false);
            _dynamicButtonTopOn.SetActive(false);
            _dynamicButtonTopOff.SetActive(false);
        }
        /// <summary>
        /// Switch button to the static version in which it has one drawcall less and can also be marked as static
        /// This state is always active while the button is not in direct operation
        /// </summary>
        private void MakeStatic()
        {
            //turn off dynamic base
            _dynamicButtonBase.SetActive(false);
            //turn on static button part
            if (_isOn)
            {
                _dynamicButtonTopOn.SetActive(false); //turn off dynamic part
                _staticButtonOn.SetActive(true);
#if !USE_AREA_TOGGLES
                _lodLevelRenderer = _lod0RendererWhenOnFromStatic;
#endif
            }
            else
            {
                _dynamicButtonTopOff.SetActive(false); //turn off dynamic part
                _staticButtonOff.SetActive(true);
#if !USE_AREA_TOGGLES
                _lodLevelRenderer = _lod0RendererWhenOffFromStatic;
#endif
            }
#if EDITOR_TEST && UNITY_EDITOR
            Debug.Log($"[ButtonController] '{_buttonDebugName}' turned to static");
#endif
        }
        /// <summary>
        /// Switch button to the dynamic version in which it has one drawcall more but can move
        /// This state is only held during direct operation of the button
        /// </summary>
        private void MakeDynamic()
        {
            //turn on dynamic base
            _dynamicButtonBase.SetActive(true);
            //turn on moving dynamic part
            if (_isOn)
            {
                _staticButtonOn.SetActive(false); //turn of static part
                _dynamicButtonTopOn.SetActive(true);
                _currentDynamicButtonTop = _dynamicButtonTopOn.transform;
            }
            else
            {
                _staticButtonOff.SetActive(false); //turn of static part
                _dynamicButtonTopOff.SetActive(true);
                _currentDynamicButtonTop = _dynamicButtonTopOff.transform;
            }
#if EDITOR_TEST && UNITY_EDITOR
            Debug.Log($"[ButtonController] '{_buttonDebugName}' turned to dynamic");
#endif
        }
        #endregion DynamicStaticSwitch
        #region GeneralFunctions
        /// <summary>
        /// Get the shortest distance between a point and a plane (signed to include the direction as well)
        /// </summary>
        public float SignedDistancePlanePoint(Vector3 planeNormal, Vector3 planePoint, Vector3 point)
        {
            return Vector3.Dot(planeNormal, (point - planePoint));
        }
        #endregion GeneralFunctions
        #region NetworkSync
#if NETWORK_SYNC_VERSION
        /// <summary>
        /// Is called each time a network package is received (rougly 5 times per second)
        /// </summary>
        public override void OnDeserialization()
        {
            if (_syncedState != _isOn)
            {
                ApplyStateFromNetwork();
            }
        }
        /// <summary>
        /// Allows any player to set their current button state as the synced button state for everyone else
        /// </summary>
        private void ApplyStateToNetwork()
        {
            if (!Networking.IsOwner(this.gameObject))
            {
                Networking.SetOwner(_localPlayer, this.gameObject);
            }
            _syncedState = _isOn;
            RequestSerialization();
#if DEBUG_TEST
            Debug.Log($"[ButtonController] '{_buttonDebugName}' applied new state ({_syncedState}) to network.");
#endif
        }
        /// <summary>
        /// Is called by all users on the network if their state isn't the synced state.
        /// </summary>
        private void ApplyStateFromNetwork()
        {
#if DEBUG_TEST
                Debug.Log($"[ButtonController] '{_buttonDebugName}' applied new state ({_syncedState}) from network.");
#endif
            _isOn = _syncedState;
#if !EDITOR_TEST
            if (_targetScript != null)
            {
                if (_sendButtonDownEvent)
                    _targetScript.SendCustomEvent(_buttonDownEventName);
                if (_sendButtonUpEvent)
                    _targetScript.SendCustomEvent(_buttonUpEventName);
            }
#else
            Debug.Log($"[ButtonController] '{_buttonDebugName}' called ButtonDown + Up event from network state change");
#endif
            ApplyStateToTargetGameObjects();
            //Using external calls also on this button since they do exactly the same + check if dynamic or static update is needed
            if (_isOn)
            {
                //sync other connected buttons to the same state
                foreach (ButtonController otherButton in _syncedButtons) { otherButton._ButtonSyncSetButtonOn(); }
            }
            else
            {
                //sync other connected buttons to the same state
                foreach (ButtonController otherButton in _syncedButtons) { otherButton._ButtonSyncSetButtonOff(); }
            }
            //apply the new state to self
            UpdateButtonState();
        }
#endif
        #endregion NetworkSync
    }
}
#endregion Code