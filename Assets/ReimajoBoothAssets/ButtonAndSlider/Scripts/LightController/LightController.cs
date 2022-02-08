//#define DEBUG_TEST
#region Usings
using UnityEngine;
using UdonSharp;
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
    /// Example script to demonstrate how the slider can be used to set values on another script.
    /// This script here controls the intensity of an light source.
    /// 
    /// If the on/off buttons are pressed too often in a row, the light will go off & require the master button to be pressed to turn power back on.
    /// 
    /// You should NOT have "Synchronize Position" enabled for this script (should be default off anyway unless you set it manually).
    /// You should NOT have "Transfer Ownership on Collision" enabled for this script.
    /// </summary>
    [UdonBehaviourSyncMode(BehaviourSyncMode.NoVariableSync)]
    public class LightController : UdonSharpBehaviour
    {
        /// <summary>
        /// Is set by the slider, after that the slider will call the method <see cref="SliderValueChanged"/>
        /// </summary>
        public float _sliderValue = 1;
        [SerializeField, Tooltip("The light component")]
        private Light[] _lightSources;
        [SerializeField, Tooltip("The master button to turn the power back on, synced")]
        private SyncedButtonController _mainPowerButton;
        private int _buttonPressCounter;
        /// <summary>
        /// How many times the light can be toggle quickly in a row before it trips the main power
        /// </summary>
        private const int MAX_SHORT_BUTTON_INTERACTIONS = 6;
        private const float INTERACTION_TIME_THRESHOLD = 1f;
        private float _lastInteractionTime;
        private bool _powerIsOut;
        private void Start()
        {
            foreach (Light light in _lightSources)
            {
                light.intensity = _sliderValue;
                light.enabled = !_powerIsOut;
            }
        }
        /// <summary>
        /// Is called by the slider after updating <see cref="_sliderValue"/>
        /// </summary>
        public void _SliderValueChanged()
        {
            foreach (Light light in _lightSources)
            {
                light.intensity = _sliderValue;
            }
        }
        /// <summary>
        /// Must be called from all regular light buttons
        /// </summary>
        public void _ButtonDownEvent()
        {
            if (!_powerIsOut)
            {
                if(Time.time - _lastInteractionTime < INTERACTION_TIME_THRESHOLD)
                {
                    _buttonPressCounter++;
#if DEBUG_TEST
                    Debug.Log($"[LightController] Counter is now at {_buttonPressCounter}.");
#endif
                    if (_buttonPressCounter > MAX_SHORT_BUTTON_INTERACTIONS)
                    {
#if DEBUG_TEST
                    Debug.Log("[LightController] Main power tripped.");
#endif
                        _mainPowerButton._TurnButtonOff();
                    }
                }
                else
                {
                    _buttonPressCounter = 1;
#if DEBUG_TEST
                    Debug.Log($"[LightController] Counter is now back at 1.");
#endif
                }
                _lastInteractionTime = Time.time;
            }
        }
        /// <summary>
        /// Must be called from <see cref="_mainPowerButton"/>
        /// </summary>
        public void _MainPowerButtonDownEvent()
        {
            ToggleMainPowerState();
#if DEBUG_TEST
            Debug.Log("[LightController] Toggled main power");
#endif
        }
        /// <summary>
        /// Toggles the main power state
        /// </summary>
        /// <param name="newState"></param>
        private void ToggleMainPowerState()
        {
            _powerIsOut = !_powerIsOut;
            foreach (Light light in _lightSources)
            {
                light.enabled = !_powerIsOut;
            }
            _buttonPressCounter = 0;
        }
    }
}