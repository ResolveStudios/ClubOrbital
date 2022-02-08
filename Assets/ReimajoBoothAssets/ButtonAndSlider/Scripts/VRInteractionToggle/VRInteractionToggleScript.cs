#region Usings
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
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
    /// Script should only be once in the world.
    /// 
    /// You should NOT have "Transfer Ownership on Collision" enabled for this script.
    /// </summary>
    [UdonBehaviourSyncMode(BehaviourSyncMode.NoVariableSync)]
    public class VRInteractionToggleScript : UdonSharpBehaviour
    {
        #region SerializedFields        
        /// <summary>
        /// All UdonSharpBehaviours in the world that should receive the _EnableDesktopButtonForVR / _DisableDesktopButtonForVR events
        /// </summary>
        [SerializeField, Tooltip("All UdonSharpBehaviours in the world that should receive the _EnableDesktopButtonForVR / _DisableDesktopButtonForVR events")]
        private UdonSharpBehaviour[] _receivingUdonSharpBehaviours;
        #endregion SerializedFields
        #region PrivateFields
        private bool _isEnabled = false; //do not set this to true unless you set the value in the receiving scripts to true as well, default is false there
        private string _eventName = "_EnableDesktopButtonForVR";
        private int _currentScript;
        #endregion PrivateFields
        #region ButtonApi
        /// <summary>
        /// Is called from a button on this script when the button changes its on/off state.
        /// </summary>
        public void _ButtonDownEvent()
        {
            _eventName = _isEnabled ? "_DisableDesktopButtonForVR" :"_EnableDesktopButtonForVR";
            _currentScript = _receivingUdonSharpBehaviours.Length;
            SendCustomEventDelayedFrames(nameof(_SetDesktopInteractionStateForNextScript), 1);
            _isEnabled = !_isEnabled;
        }
        #endregion ButtonApi
        #region ApplyState
        /// <summary>
        /// Sets the enabled state of all <see cref="_receivingUdonSharpBehaviours"/> to the current <see cref="_isEnabled"/> value
        /// </summary>
        public void _SetDesktopInteractionStateForNextScript()
        {
            //we can count down first since _receivingUdonSharpBehaviours.Length is not a valid index
            _currentScript--;
            if (_currentScript < 0)
                return;
            UdonSharpBehaviour script = _receivingUdonSharpBehaviours[_currentScript];
            if (Utilities.IsValid(script))
                script.SendCustomEvent(_eventName);
            SendCustomEventDelayedFrames(nameof(_SetDesktopInteractionStateForNextScript), 1);
        }
        #endregion ApplyState
    }
}

