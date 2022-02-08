#region DontTouchThis
#define NETWORK_SYNC_VERSION //Don't touch this, leave it as it is
#endregion DontTouchThis

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
//    !!!! Activating this cannot be easily reverted, since editor assignements will be removed. !!!!//#define EDITOR_TEST //uncomment unless you want to test the button in editor (without an emulator), comment out for live builds.
#define NETWORK_LERP //Smoothly moves the slider locally when a remote player moves it, with performance cost
//#define DEBUG_TEST //uncomment in live build, only to test the slider in game with extensive debug logs
//----------------------------------------------------------------------------------------------------
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
    //*********************** ONLY EDIT THE SYNCED-SLIDER SCRIPT! ***************************
    /// <summary>
    /// Script needs a _targetScript assigned in editor.
    /// You should NOT have "Synchronize Position" enabled for this script (should be default off anyway unless you set it manually).
    /// You should NOT have "Transfer Ownership on Collision" enabled for this script.
    /// </summary>
    [UdonBehaviourSyncMode(BehaviourSyncMode.Manual)]
    public class SyncedSliderController : UdonSharpBehaviour
    #region VariantControl
#if NETWORK_SYNC_VERSION
    //waiting for UdonSharp 1.0 to be able to use this again (broke with Unity 2019)
    //[UdonBehaviourSyncMode(BehaviourSyncMode.Manual)]
    //public class SyncedSliderController : UdonSharpBehaviour
#else
    //waiting for UdonSharp 1.0 to be able to use this again (broke with Unity 2019)
    //[UdonBehaviourSyncMode(BehaviourSyncMode.NoVariableSync)]
    //public class SliderController : UdonSharpBehaviour
#endif
    #endregion ClassName
    {
        #region SyncedFields
#if NETWORK_SYNC_VERSION
        /// <summary>
        /// The synced button state, where true = on, false = off
        /// </summary>
        [UdonSynced, HideInInspector]
        public float _syncedState = 0f;
#endif
        #endregion SyncedFields
        #region EditorTest
#if EDITOR_TEST
        [SerializeField]
        private Transform _fakeHand;
#endif
        #endregion EditorTest
        #region API
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
        /// Current relative value (0..1) of this slider to sync it with other sliders.
        /// After changing this value, _ApplyExternalValue() must be called.
        /// </summary>
        [HideInInspector]
        public float _currentValue = 0.8f;
        #endregion API
        #region SerializedFields
#if USE_AREA_TOGGLES && NETWORK_SYNC_VERSION
        [HideInInspector]
        public bool _playerIsInArea = false;
#endif
        /// <summary>
        /// Value of the slider at start (is sent to _targetScript and also moves the slider there)
        /// </summary>
        [SerializeField, Tooltip("Value of the slider at start (is sent to _targetScript and also moves the slider there)")]
        private float _sliderValueAtStart = 0.5f;
        /// <summary>
        /// Name of the public field on the target script that receives the current value of the slider (0...1f)
        /// </summary>
        [SerializeField, Tooltip("Name of the public field on the target script that receives the current value of the slider (0...1f)")]
        private string _sliderVariableName = "_sliderValue";
        /// <summary>
        /// Name of the public methof on the target script that is called after setting _sliderVariableName when the value changed
        /// </summary>
        [SerializeField, Tooltip("Name of the public methof on the target script that is called after setting _sliderVariableName when the value changed")]
        private string _eventNameAfterValueChanged = "_SliderValueChanged";
        /// <summary>
        /// Name of the target script that receives _sliderVariableName and _eventNameAfterValueChanged when the value changed
        /// </summary>
        [SerializeField, Tooltip("Name of the target script that receives _sliderVariableName and _eventNameAfterValueChanged when the value changed")]
        private UdonBehaviour _targetScript;
#if !NETWORK_SYNC_VERSION
        /// <summary>
        /// A network-synced slider that should share the same state with this one here, can be empty. 
        /// You can only sync 1 network-synced slider with several not-network-synced sliders.
        /// You can move either of them to move all, but they need to reference each other 
        /// and also reference the same receiving script
        /// </summary>
        [SerializeField, Tooltip("(Optional) A network-synced slider that should share the same state with this one here, can be empty. You can only sync 1 network-synced slider with several not-network-synced sliders. You can move either of them to move all, but they need to reference each other and also reference the same receiving script.")]
        private SyncedSliderController _networkSyncedSlider;
#endif
        /// <summary>
        /// All other sliders in the scene that should stay in sync with this one
        /// </summary>
        [SerializeField, Tooltip("All other sliders in the scene that should stay in sync with this one")]
        private SliderController[] _syncedSliders;
        /// <summary>
        /// Handle of the slider that moves
        /// </summary>
        [SerializeField, Tooltip("Handle of the slider that moves")]
        private Transform _slidingPart;
#if !USE_AREA_TOGGLES
        /// <summary>
        /// LOD that activates the interaction detection (should be LOD0)
        /// </summary>
        [SerializeField, Tooltip("LOD that activates the interaction detection (should be LOD0)")]
        private Renderer _lod0Renderer;
#endif
        /// <summary>
        /// Minimum position of the slider (value 0), also plane 
        /// pointing forward inside the interaction zone for calculating the hand bone distance
        /// </summary>
        [SerializeField, Tooltip("Minimum position of the slider (value 0), also plane pointing forward inside the interaction zone for calculating the hand bone distance")]
        private Transform _minSliderPositionAndInteractionPlane;
        /// <summary>
        /// Maximum position of the slider (value 1)
        /// </summary>
        [SerializeField, Tooltip("Maximum position of the slider (value 1)")]
        private Transform _maxSliderPosition;
        /// <summary>
        /// Box to read hand bone detection bounds from
        /// </summary>
        [SerializeField, Tooltip("Box to read hand bone detection bounds from")]
        private BoxCollider _pushArea;
        /// <summary>
        /// Components needed for desktop users to interact with the slider
        /// </summary>
        [SerializeField, Tooltip("Components needed for desktop users to interact with the slider")]
        private GameObject _desktopSliderComponents;
        /// <summary>
        /// UI slider needed (only) for desktop users to interact with the slider
        /// </summary>
        [SerializeField, Tooltip("UI slider needed (only) for desktop users to interact with the slider")]
        private UnityEngine.UI.Slider _sliderUI;
        #endregion SerializedFields
        #region PrivateFields
        private bool _desktopButtonForVrDisabled = true;
        private Bounds _pushAreaBounds;
        private bool _isVR;
        private bool _isInDesktopFallbackMode = false;
        private VRCPlayerApi _localPlayer;
        private float _maxTravelDistance;
        private bool _firstTimeInBounds = true;
        private float _firstTimeInBoundsDistanceToPlane;
        private float _ignoreNextSliderChangedEventFromTime;
        private const float LOCK_TIME = 1f;
#if NETWORK_LERP
        private const float MIN_LERP_SPEED = 0.02f;
        private const float LERP_SPEED_MULTIPLIER = 5f;
        private bool _networkLerpPending;
        private float _currentLerpSpeed;
        private bool _lerpDirectionIsPositive;
#endif
        #endregion PrivateFields
        #region StartUpdate
        /// <summary>
        /// Check if everything is setup correctly to avoid null checks on runtime
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
            _isVR = _localPlayer.IsUserInVR();
            if (_targetScript == null)
            {
                Debug.LogError("[PB_VRSlider] No UdonBehaviour assigned to SliderVRScript, this script won't run.");
                this.gameObject.SetActive(false);
                return;
            }
#else
            _isVR = true;
#endif
            if (_desktopButtonForVrDisabled)
            {
                _desktopSliderComponents.SetActive(!_isVR); //disable for VR user, enable for desktop user
            }
            else
            {
                _desktopSliderComponents.SetActive(true); //enable for all users
            }
            _pushAreaBounds = new Bounds(_pushArea.center, _pushArea.size);
            _maxTravelDistance = Mathf.Abs(SignedDistancePlanePoint(_minSliderPositionAndInteractionPlane.forward, _minSliderPositionAndInteractionPlane.position, _maxSliderPosition.position));
            _ignoreNextSliderChangedEventFromTime = Time.time;
            _sliderUI.value = _sliderValueAtStart;
            _currentValue = _sliderValueAtStart;
#if NETWORK_SYNC_VERSION
            if (_localPlayer.isMaster)
            {
                //If the user is master, this means they are the first one who joined the instance and we need to set the default state
                ApplyStateToNetwork();
            }
#endif
            SetSliderToCurrentValue();
        }
        /// <summary>
        /// should only run on local player when the LOD is active
        /// </summary>
        private void Update()
        {
#if UNITY_EDITOR && !EDITOR_TEST
            //we don't run this in editor unless we have an emulator like Cyan-Emu running
            if (_localPlayer == null)
                return;
#endif
#if NETWORK_LERP && NETWORK_SYNC_VERSION
            if (_networkLerpPending)
            {
                NetworkLerpToTargetValue();
                return;
            }
#endif
#if !USE_AREA_TOGGLES
            if (_lod0Renderer.isVisible)
            {
#elif NETWORK_SYNC_VERSION
            if( _playerIsInArea)
            {
#endif
                SliderVRController();
#if !USE_AREA_TOGGLES || NETWORK_SYNC_VERSION
            }
#endif
        }
#if NETWORK_LERP && NETWORK_SYNC_VERSION
        /// <summary>
        /// Moves the slider with <see cref="_currentValue"/> towards <see cref="_syncedState"/> with a constant speed
        /// that is determined during each <see cref="OnDeserialization"/> which fires roughly 5 times per second.
        /// </summary>
        private void NetworkLerpToTargetValue()
        {
            //lerping the slider towards the target value
            if (_lerpDirectionIsPositive)
            {
                _currentValue += Mathf.Min(_syncedState - _currentValue, _currentLerpSpeed * Time.deltaTime);
            }
            else
            {
                _currentValue += Mathf.Max(_syncedState - _currentValue, _currentLerpSpeed * Time.deltaTime);
            }
            if (!_isVR)
            {
                _sliderUI.value = _currentValue;
            }
            SetSliderToCurrentValue();
            SyncAllSliders();
            if (_syncedState - _currentValue == 0)
            {
                //stop lerping since we've reached the target value.
                _networkLerpPending = false;
                //lock the UI slider since _networkLerpPending will no longer lock it
                _ignoreNextSliderChangedEventFromTime = Time.time;
            }
        }
#endif
        #endregion StartUpdate
        #region ExternalAPI
        /// <summary>
        /// Call this event from your own scripts to enable the desktop button for VR users
        /// </summary>
        public void _EnableDesktopButtonForVR()
        {
            if (_desktopButtonForVrDisabled)
            {
                if (_localPlayer.IsUserInVR())
                {
                    _desktopButtonForVrDisabled = false;
                    //enable the "desktop" mode
                    _isVR = false;
                    _desktopSliderComponents.SetActive(true);
                }
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
                if (_localPlayer.IsUserInVR())
                {
                    //disable the "desktop" mode
                    _isVR = true;
                    _desktopSliderComponents.SetActive(false);
                }
            }
        }
        /// <summary>
        /// Use this to change the slider's value from your own scripts!
        /// Must be called AFTER <see cref="_currentValue"/> got changed by your script.
        /// </summary>
        public void _ApplyExternalValue()
        {
            ApplyValueFromExternalSourceInternally();
#if NETWORK_SYNC_VERSION
            ApplyStateToNetwork();
#endif
        }
        /// <summary>
        /// Internal function that is called when an external value should be applied to this and all synced sliders.
        /// </summary>
        private void ApplyValueFromExternalSourceInternally()
        {
            SetSliderToCurrentValue();
            if (!_isVR)
            {
                _ignoreNextSliderChangedEventFromTime = Time.time;
                _sliderUI.value = _currentValue;
            }
            SyncAllSliders();
        }
        #endregion ExternalAPI
        #region PlayerCalibration
        /// <summary>
        /// Is called from my player calibration script (https://reimajo.booth.pm/items/2753511) when the avatar changed
        /// </summary>
        public void _OnAvatarChanged()
        {
            if (_isVR)
            {
                if (_leftIndexBone == HumanBodyBones.LeftLowerArm || _rightIndexBone == HumanBodyBones.RightLowerArm)
                {
                    //enable the "desktop" mode because the player is missing finger bones
                    _isVR = false;
                    _isInDesktopFallbackMode = true;
                    _desktopSliderComponents.SetActive(true);
                    _ignoreNextSliderChangedEventFromTime = Time.time;
                    _sliderUI.value = _currentValue;
                }
            }
            else if (_isInDesktopFallbackMode)
            {
                if (_leftIndexBone != HumanBodyBones.LastBone && _rightIndexBone != HumanBodyBones.LastBone)
                {
                    //enable the regular VR mode again
                    _desktopSliderComponents.SetActive(false);
                    _isVR = true;
                    _isInDesktopFallbackMode = false;
                }
            }
        }
        #endregion PlayerCalibration
        #region SyncOtherSliders
        /// <summary>
        /// Is called to sync all other sliders in <see cref="_syncedSliders"/>
        /// to the current value of this slider.
        /// </summary>
        private void SyncAllSliders()
        {
            foreach (SliderController otherSlider in _syncedSliders)
            {
                otherSlider._currentValue = this._currentValue;
                otherSlider._ApplyValueFromExternalSlider();
            }
#if !NETWORK_SYNC_VERSION
            if (_networkSyncedSlider != null)
            {
                _networkSyncedSlider._currentValue = this._currentValue;
                _networkSyncedSlider._ApplyValueFromExternalSlider();
            }
#endif
        }
        /// <summary>
        /// Is called from another slider after _currentValue got changed to apply that change to this slider.
        /// </summary>
        public void _ApplyValueFromExternalSlider()
        {
            SetSliderToCurrentValue();
            if (!_isVR)
            {
                _ignoreNextSliderChangedEventFromTime = Time.time;
                _sliderUI.value = _currentValue;
            }
#if NETWORK_SYNC_VERSION
            ApplyStateToNetwork();
#endif
        }
        #endregion SyncOtherSliders
        #region DesktopUISlider
        /// <summary>
        /// Event is called when user changes the UI Slider position
        /// </summary>
        public void _UISliderChanged()
        {
            if (_isVR)
                return;
#if NETWORK_LERP
            if (_networkLerpPending)
                return;
#endif
            if (Time.time - _ignoreNextSliderChangedEventFromTime < LOCK_TIME)
            {
#if DEBUG_TEST
                Debug.Log($"[PB_VRSlider] Slider is currently locked, ingnoring UI event.");
#endif
                return;
            }
            _currentValue = _sliderUI.value;
            SetSliderToCurrentValue();
#if NETWORK_SYNC_VERSION
            ApplyStateToNetwork();
#endif
            SyncAllSliders();
        }
        #endregion DesktopUISlider
        #region SliderVRController
        /// <summary>
        /// Controls the slider for VR users by moving it relative to the first 
        /// point of contact while the hands are touching the bounds
        /// </summary>
        private void SliderVRController()
        {
            float distanceToHand = 0f; //so it is never the biggest
            bool isInBoundRightNow = false;
#if EDITOR_TEST
            Vector3 leftIndexPosition = _fakeHand.position;
            Vector3 rightIndexPosition = _fakeHand.position;
#else
            Vector3 leftIndexPosition = _localPlayer.GetBonePosition(_leftIndexBone);
            Vector3 rightIndexPosition = _localPlayer.GetBonePosition(_rightIndexBone);
#endif
            Vector3 planeNormal = _minSliderPositionAndInteractionPlane.forward;
            Vector3 planePoint = _minSliderPositionAndInteractionPlane.position;
            if (_pushAreaBounds.Contains(_pushArea.transform.InverseTransformPoint(rightIndexPosition)))
            {
                //measure distance to dominant index finger
                distanceToHand = SignedDistancePlanePoint(planeNormal, planePoint, rightIndexPosition);
                if (distanceToHand > 0)
                {
                    isInBoundRightNow = true;
                }
                else
                {
                    distanceToHand = 0;
                }
            }
            else if (_pushAreaBounds.Contains(_pushArea.transform.InverseTransformPoint(leftIndexPosition)))
            {
                //measure distance to non-dominant index finger
                distanceToHand = SignedDistancePlanePoint(planeNormal, planePoint, leftIndexPosition);
                if (distanceToHand > 0)
                {
                    isInBoundRightNow = true;
                }
                else
                {
                    distanceToHand = 0;
                }
            }
            //check if hand is in bounds
            if (isInBoundRightNow)
            {
                if (_firstTimeInBounds)
                {
                    _firstTimeInBounds = false;
                    _firstTimeInBoundsDistanceToPlane = distanceToHand - SignedDistancePlanePoint(planeNormal, planePoint, _slidingPart.position);
                }
                //pushing the slider
                _currentValue = Mathf.Clamp(distanceToHand - _firstTimeInBoundsDistanceToPlane, 0, _maxTravelDistance) / _maxTravelDistance;
                SetSliderToCurrentValue();
#if NETWORK_SYNC_VERSION
                ApplyStateToNetwork();
#endif
                SyncAllSliders();
            }
            else
            {
                _firstTimeInBounds = true;
            }
        }
        /// <summary>
        /// Moves the slider to a certain value
        /// </summary>
        private void SetSliderToCurrentValue()
        {
            _slidingPart.position = Vector3.Lerp(_minSliderPositionAndInteractionPlane.position, _maxSliderPosition.position, _currentValue);
#if EDITOR_TEST
            if (_targetScript == null)
                return;
#endif
            _targetScript.SetProgramVariable(_sliderVariableName, _currentValue);
            _targetScript.SendCustomEvent(_eventNameAfterValueChanged);
        }
        #endregion SliderVRController
        #region CommonFunctions
        /// <summary>
        /// Get the shortest distance between a point and a plane. The output is signed so it holds information
        /// as to which side of the plane normal the point is.
        /// </summary>
        private float SignedDistancePlanePoint(Vector3 planeNormal, Vector3 planePoint, Vector3 point)
        {
            return Vector3.Dot(planeNormal, (point - planePoint));
        }
        #endregion CommonFunctions
        #region NetworkSync
#if NETWORK_SYNC_VERSION
        /// <summary>
        /// Is called each time a network package is received (rougly 5 times per second)
        /// </summary>
        public override void OnDeserialization()
        {
            if (_syncedState != _currentValue)
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
            _syncedState = _currentValue;
            RequestSerialization();
#if EDITOR_TEST
            Debug.Log($"[PB_VRSlider] Applied new state ({_syncedState}) to network.");
#endif
        }
        /// <summary>
        /// Is called by all users on the network if their state isn't the synced state.
        /// </summary>
        private void ApplyStateFromNetwork()
        {
#if EDITOR_TEST
                Debug.Log($"[PB_VRSlider] Applied new state ({_syncedState}) from network.");
#endif
#if NETWORK_LERP
            _networkLerpPending = true;
            _currentLerpSpeed = (_syncedState - _currentValue) * LERP_SPEED_MULTIPLIER;
            _lerpDirectionIsPositive = _currentLerpSpeed >= 0;
            //we need to ensure a minimal lerp speed, else the slider may never reach it's target or stays locked for too long
            _currentLerpSpeed = _lerpDirectionIsPositive ? Mathf.Max(MIN_LERP_SPEED, _currentLerpSpeed) : Mathf.Min(-MIN_LERP_SPEED, _currentLerpSpeed);
#else
            _currentValue = _syncedState;
#endif
            //apply value to this slider and all synced sliders
            ApplyValueFromExternalSourceInternally();
        }
#endif
        #endregion NetworkSync
    }
}
#endregion Code