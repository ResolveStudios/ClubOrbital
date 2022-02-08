#region CompilerSettings
//--------------------------------- Compiler Settings -----------------------------------------------------
//#define USE_AREA_TOGGLES //uncomment if you use area toggles for all buttons, in which case the buttons will
//    not check the LOD renderer to stay idle and can also be pushed without looking at them. This drastically
//    increases frametime if you don't set area toggles up for all buttons to control when the player is in reach to them.
//    I highly recommend that you turn this on and strictly use area toggles for all sliders and buttons.
//    Make sure to activate this option in all button and slider variant scripts.
//    !!!! Activating this cannot be easily reverted, since editor assignements will be removed. !!!!
#define ALLOW_BUTTON_TO_MOVE_AND_ROTATE //if the button doesn't need to move or rotate, uncomment this to save performance
//---------------------------------------------------------------------------------------------------------
#endregion CompilerSettings
#region Usings
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;
#endregion Usings
/// <summary>
/// Script from Reimajo purchased at https://reimajo.booth.pm/, to be used in the worlds of the person who bought the asset only.
/// Make sure to join my discord to receive update notifications for this asset and support: https://discord.gg/SWkNA394Mm
/// If you have any issues, please contact me on Discord (https://discord.gg/SWkNA394Mm) or Booth or Twitter https://twitter.com/ReimajoChan
/// Do not give any of the asset files or parts of them to anyone else.
/// </summary>
namespace ReimajoBoothAssets
{
    /// <summary>
    /// Script can be in the scene as many times as you want. It needs to have a box collider attached to itself. 
    /// 
    /// This is a simplified button variant to be used as a touch button without any UI, as seen 
    /// in the VirtualFurence world e.g on the Roomba power button.
    /// 
    /// You should NOT have "Transfer Ownership on Collision" enabled for this script.
    /// </summary>
    [RequireComponent(typeof(Collider)), UdonBehaviourSyncMode(BehaviourSyncMode.NoVariableSync)]
    public class TouchButtonNoGui : UdonSharpBehaviour
    {
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
        /// Avatar height in meter (of localPlayer), can be set by an external script for better usability of the keyboard. 
        /// Afterwards, OnAvatarChanged() must be called on this script.
        /// One such script that does all of that is my AvatarCalibrationScript which I sell on my booth page.
        /// </summary>
        [HideInInspector, Tooltip("Avatar height in meter (of localPlayer), can be set by an external script for better usability of the keyboard. Afterwards, OnAvatarChanged() must be called on this script. One such script that does all of that is my AvatarCalibrationScript which I sell on my booth page")]
        public float _avatarHeight = 1.3f;
        #endregion API
        #region SerializedFields
        /// <summary>
        /// If the button is currently on (can be used to set the default state in editor, 
        /// do not modify this at runtime, only use _ExternalButtonOn() and _ExternalButtonOff() for this)
        /// </summary>
        [SerializeField, Tooltip("If the button is currently on (can be used to set the default state in editor, do not modify this at runtime, only use _ExternalButtonOn() and _ExternalButtonOff() for this)")]
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
        /// <summary>
        /// Area in which pushing the button is true if any bones are inside
        /// </summary>
        [SerializeField, Tooltip("Area in which pushing the button is true if any bones are inside")]
        private BoxCollider _pushAreaForVR;
        #endregion SerializedFields
        #region Settings
        /// <summary>
        /// Finger thickness of a standard sized avatar (1.3m), will automatically scale with avatar size
        /// </summary>
        private const float FINGER_THICKNESS_DEFAULT = 0.02f;
        /// <summary>
        /// How far away from the surface the finger can be to trigger the button
        /// </summary>
        private const float SURFACE_OFFSET = 0.005f;
        /// <summary>
        /// Time in seconds between each button check when the player is within <see cref="CLOSE_RANGE"/>
        /// </summary>
        private const float CLOSE_TIMER = 0.1f;
#if !USE_AREA_TOGGLES
        /// <summary>
        /// How far away the player root of a default sized player (1.3f) can be to still 
        /// run the close timer instead of the far timer.
        /// </summary>
        private const float CLOSE_RANGE = 5f;
        /// <summary>
        /// Time in seconds between each button check when the player is outside of <see cref="CLOSE_RANGE"/>
        /// </summary>
        private const float FAR_TIMER = 1.5f;
#endif
        #endregion Settings
        #region PrivateFields
#if !ALLOW_BUTTON_TO_MOVE_AND_ROTATE
        Vector3 _buttonPosition;
        Vector3 _buttonUp;
#endif
        private bool _desktopButtonForVrDisabled = true;
        private Bounds _pushAreaBoundsForVR;
        VRCPlayerApi _localPlayer;
        private bool _isOn;
        private bool _isVR;
        private bool _hasFinishedStart;
        private bool _isInDesktopFallbackMode;
        private float _fingerThickness;
        private Collider _desktopButtonCollider;
        private bool _wasInBounds;
#if !USE_AREA_TOGGLES
        private float _closeRange;
#endif
        #endregion PrivateFields
        #region Start
        void Start()
        {
            _localPlayer = Networking.LocalPlayer;
#if UNITY_EDITOR
            if (_localPlayer == null)
                return;
#endif
            _desktopButtonCollider = this.GetComponent<Collider>();
            if (_desktopButtonCollider == null)
            {
                Debug.Log("[PB_VRButton] No MeshCollider assigned to VR button in PB_VRButton");
                this.gameObject.SetActive(false);
                return;
            }
            _isOn = _isOnAtStart;
            _isVR = _localPlayer.IsUserInVR();
            if (_targetScript == null && _toggledGameObjects.Length == 0)
            {
                Debug.LogError("[PB_VRButton] No UdonBehaviour or toggled game object assigned, this button won't do anything.");
            }
#if !ALLOW_BUTTON_TO_MOVE_AND_ROTATE
            _buttonPosition = this.transform.position;
            _buttonUp = this.transform.up;
#endif
            //we apply the current state to the objects after start to avoid issues. The randomizer ensures a smoother frametime distribution.
            SendCustomEventDelayedFrames(nameof(_ApplyStartActiveState), Random.Range(1, 30));
            ReadButtonBounds();
            if (_desktopButtonForVrDisabled)
            {
                _desktopButtonCollider.enabled = !_isVR;
            }
            else
            {
                _desktopButtonCollider.enabled = true;
            }
            if (_isVR)
            {
                //by offsetting each script instance by a random amount of milliseconds, we 
                //archieve a better distribution of frametime spikes over time
                SendCustomEventDelayedSeconds(nameof(_RunButtonForVR), Random.Range(0f, 1f));
            }
        }
        /// <summary>
        /// Applies the current active state to all objects at least one frame after Start() to avoid initialization issues
        /// </summary>
        public void _ApplyStartActiveState()
        {
            //set into default state
            foreach (GameObject obj in _toggledGameObjects)
            {
                if (Utilities.IsValid(obj))
                    obj.SetActive(_isOn);
            }
        }
        /// <summary>
        /// Reads button bounds at start. If the button won't move or rotate at runtime, those are worldspace bounds,
        /// else localspace bounds are determined.
        /// </summary>
        private void ReadButtonBounds()
        {
            //read the bounds from the push area
#if !ALLOW_BUTTON_TO_MOVE_AND_ROTATE
            _pushAreaBoundsForVR = _pushAreaForVR.bounds;
#else
            _pushAreaBoundsForVR = new Bounds(_pushAreaForVR.center, _pushAreaForVR.size);
#endif
        }
        #endregion Start
        #region Calibration
        /// <summary>
        /// Is called from my player calibration script (https://reimajo.booth.pm/items/2753511) when the avatar changed
        /// This is externally called after setting _avatarHeight (happening after localPlayer changed their avatar)
        /// </summary>
        public void _OnAvatarChanged()
        {
            if (!_hasFinishedStart)
                return;
            if (_isVR)
            {
                if (_leftIndexBone == HumanBodyBones.LeftLowerArm || _rightIndexBone == HumanBodyBones.RightLowerArm)
                {
                    //enable the "desktop" mode because the player is missing all finger bones
                    _desktopButtonCollider.enabled = true;
                    _isVR = false;
                    _isInDesktopFallbackMode = true;
                    //note: We do not stop the VR button process because this might create several parallel "threads"
                    //if we ever start it again and didn't stopped the old "thread" before doing so.
                }
                else
                {
                    //distances are made for a 1.3m avatar as a reference
                    _fingerThickness = SURFACE_OFFSET + (FINGER_THICKNESS_DEFAULT * _avatarHeight / 1.3f);
#if !USE_AREA_TOGGLES
                    _closeRange = CLOSE_RANGE * _avatarHeight / 1.3f;
#endif
                }
            }
            else if (_isInDesktopFallbackMode)
            {
                if (_leftIndexBone != HumanBodyBones.LastBone && _rightIndexBone != HumanBodyBones.LastBone)
                {
                    //enable the regular VR mode again
                    _desktopButtonCollider.enabled = false;
                    _isVR = true;
                    _isInDesktopFallbackMode = false;
                }
            }
        }
        #endregion Calibration
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
                    _desktopButtonCollider.enabled = true;
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
                    _desktopButtonCollider.enabled = false;
                }
            }
        }
        #endregion ExternalAPI
        #region RunButtonForDesktop
        /// <summary>
        /// Is called when the player presses the collider on desktop
        /// </summary>
        public override void Interact()
        {
            OnButtonDown();
        }
        #endregion RunButtonForDesktop
        #region RunButtonForVR
        /// <summary>
        /// Checks all finger bones if they are in bounds to get the highest push distance of all bones
        /// </summary>
        public void _RunButtonForVR()
        {
#if !USE_AREA_TOGGLES
#if ALLOW_BUTTON_TO_MOVE_AND_ROTATE
            float distanceToPlayer = Vector3.Distance(_localPlayer.GetPosition(), this.transform.position);
#else
            float distanceToPlayer = Vector3.Distance(_localPlayer.GetPosition(), _buttonPosition);
#endif
            if (distanceToPlayer <= CLOSE_RANGE)
            {
#endif
                //check the left finger bone
                if (IsButtonPressed(_leftIndexBone, isLeftHand: true) || IsButtonPressed(_rightIndexBone, isLeftHand: false))
                {
                    if (!_wasInBounds)
                    {
                        _wasInBounds = true;
                        OnButtonDown();
                    }
                }
                else if (_wasInBounds)
                {
                    _wasInBounds = false;
                    OnButtonUp();
                }
                SendCustomEventDelayedSeconds(nameof(_RunButtonForVR), CLOSE_TIMER);
#if !USE_AREA_TOGGLES
            }
            else
            {
                SendCustomEventDelayedSeconds(nameof(_RunButtonForVR), FAR_TIMER);
            }
#endif
        }
        /// <summary>
        /// Checks a single bone if it's inside bounds. If true, the distance to the bone is measured against _buttonPushDirection
        /// </summary>
        private bool IsButtonPressed(HumanBodyBones bone, bool isLeftHand)
        {
            Vector3 position = _localPlayer.GetBonePosition(bone);
#if ALLOW_BUTTON_TO_MOVE_AND_ROTATE
            if (_pushAreaBoundsForVR.Contains(_pushAreaForVR.transform.InverseTransformPoint(position)))
#else
            if (_pushAreaBoundsForVR.Contains(position))
#endif
            {
                //measure distances to hand bone
#if ALLOW_BUTTON_TO_MOVE_AND_ROTATE
                float distanceToHandNew = SignedDistancePlanePoint(this.transform.up, this.transform.position, position) - _fingerThickness;
#else
                float distanceToHandNew = SignedDistancePlanePoint(_buttonUp, _buttonPosition, position) - _fingerThickness;
#endif
                //Must be lower than 0 to be behind the _buttonPushDirection plane.
                if (distanceToHandNew < 0)
                {
                    return true;
                }
            }
            return false;
        }
        #endregion RunButtonForVR
        #region ButtonEvent
        /// <summary>
        /// Internal event is called once when the finger bone is pressing the button
        /// </summary>
        private void OnButtonDown()
        {
            _isOn = !_isOn;
            if (_sendButtonDownEvent)
            {
                if (Utilities.IsValid(_targetScript))
                    _targetScript.SendCustomEvent(_buttonDownEventName);
            }
            foreach (GameObject obj in _toggledGameObjects)
            {
                if (Utilities.IsValid(obj))
                    obj.SetActive(_isOn);
            }
        }
        /// <summary>
        /// Internal event is called once when the finger bone is no longer pressing the button
        /// </summary>
        private void OnButtonUp()
        {
            if (_sendButtonUpEvent && _targetScript != null)
                _targetScript.SendCustomEvent(_buttonUpEventName);
        }
        #endregion ButtonEvent
        #region GeneralFunctions
        /// <summary>
        /// Get the shortest distance between a point and a plane (signed to include the direction as well)
        /// </summary>
        public float SignedDistancePlanePoint(Vector3 planeNormal, Vector3 planePoint, Vector3 point)
        {
            return Vector3.Dot(planeNormal, (point - planePoint));
        }
        #endregion GeneralFunctions
    }
}
