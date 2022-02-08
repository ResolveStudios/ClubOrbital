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
    public class ColliderToggle : UdonSharpBehaviour
    {
        #region SerializedFields        
        /// <summary>
        /// If the colliders should be enabled by default
        /// </summary>
        [SerializeField, Tooltip("")]
        private bool _isOnAtStart = false;
        /// <summary>
        /// All toggled colliders in the world that should be toggled on/off
        /// </summary>
        [SerializeField, Tooltip("All toggled colliders in the world that should be toggled on/off")]
        private Collider[] _toggledColliders = new Collider[0];
        #endregion SerializedFields
        #region PrivateFields
        private bool _isOn;
        private int _currentScript;
        #endregion PrivateFields
        #region Start
        private void Start()
        {
            _isOn = _isOnAtStart;
            _currentScript = _toggledColliders.Length;
            SendCustomEventDelayedFrames(nameof(_SetNextColliderEnabledState), 1);
        }
        #endregion Start
        #region ButtonApi
        /// <summary>
        /// Is called from a button on this script when the button changes its on/off state.
        /// </summary>
        public void _ButtonDownEvent()
        {
            _isOn = !_isOn;
            _currentScript = _toggledColliders.Length;
            SendCustomEventDelayedFrames(nameof(_SetNextColliderEnabledState), 1);
        }
        #endregion ButtonApi
        #region ColliderControl
        /// <summary>
        /// Sets the enabled state of all <see cref="_toggledColliders"/> to the current <see cref="_isOn"/> value
        /// </summary>
        public void _SetNextColliderEnabledState()
        {
            //we can count down first since _receivingUdonSharpBehaviours.Length is not a valid index
            _currentScript--;
            if (_currentScript < 0)
                return;
            Collider collider = _toggledColliders[_currentScript];
            if(Utilities.IsValid(collider))
                collider.enabled = _isOn;
            SendCustomEventDelayedFrames(nameof(_SetNextColliderEnabledState), 1);
        }
        #endregion ColliderControl
    }
}
