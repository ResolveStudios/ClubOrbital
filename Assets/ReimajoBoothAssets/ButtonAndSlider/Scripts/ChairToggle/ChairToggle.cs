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
    public class ChairToggle : UdonSharpBehaviour
    {
        #region SerializedFields        
        /// <summary>
        /// If the stations should be enabled by default
        /// </summary>
        [SerializeField, Tooltip("")]
        private bool _isOnAtStart = false;
        /// <summary>
        /// All VRC Stations (chairs) in the world that should be toggled on/off
        /// </summary>
        [SerializeField, Tooltip("All VRC Stations (chairs) in the world that should be toggled on/off")]
        private Collider[] _toggledChairs = new Collider[0];
        #endregion SerializedFields
        #region PrivateFields
        private bool _isOn;
        private int _currentScript;
        #endregion PrivateFields
        #region Start
        private void Start()
        {
            _isOn = _isOnAtStart;
            _currentScript = _toggledChairs.Length;
            SendCustomEventDelayedFrames(nameof(_SetNextStationActiveState), 1);
        }
        #endregion Start
        #region ButtonApi
        /// <summary>
        /// Is called from a button on this script when the button changes its on/off state.
        /// </summary>
        public void _ButtonDownEvent()
        {
            _isOn = !_isOn;
            _currentScript = _toggledChairs.Length;
            SendCustomEventDelayedFrames(nameof(_SetNextStationActiveState), 1);
        }
        #endregion ButtonApi
        #region StationControl
        /// <summary>
        /// Sets the active state of all <see cref="_toggledChairs"/> to the current <see cref="_isOn"/> value
        /// </summary>
        public void _SetNextStationActiveState()
        {
            //we can count down first since _receivingUdonSharpBehaviours.Length is not a valid index
            _currentScript--;
            if (_currentScript < 0)
                return;
            Collider chairCollider = _toggledChairs[_currentScript];
            if (Utilities.IsValid(chairCollider))
                chairCollider.enabled = _isOn;
            SendCustomEventDelayedFrames(nameof(_SetNextStationActiveState), 1);
        }
        #endregion StationControl
    }
}
