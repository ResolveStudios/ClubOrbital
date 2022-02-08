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
    /// This script here controls the volume of an audio source.
    /// 
    /// You should NOT have "Synchronize Position" enabled for this script (should be default off anyway unless you set it manually).
    /// You should NOT have "Transfer Ownership on Collision" enabled for this script.
    /// </summary>
    [RequireComponent(typeof(AudioSource)), UdonBehaviourSyncMode(BehaviourSyncMode.NoVariableSync)]
    public class BackgroundMusicController : UdonSharpBehaviour
    {
        #region SerializedFields
        /// <summary>
        /// Is set by the slider, after that the slider will call the method <see cref="SliderValueChanged"/>
        /// </summary>
        [HideInInspector]
        public float _sliderValue = 0;
        /// <summary>
        /// The audio source component where the music is playing from
        /// </summary>
        [SerializeField, Tooltip("The audio source component where the music is playing from")]
        private AudioSource _backgroundMusicPlayer;
        #endregion SerializedFields
        #region Start
        /// <summary>
        /// Is called once at the start of the world, sets the player to the 
        /// current value (which is 0 if this is called before initializing the slider 
        /// or the slider start value if this is called after initializing the slider)
        /// </summary>
        private void Start()
        {
            _backgroundMusicPlayer.volume = _sliderValue;
        }
        #endregion Start
        #region SliderEvent
        /// <summary>
        /// Is called by the slider after updating <see cref="_sliderValue"/>
        /// </summary>
        public void _SliderValueChanged()
        {
            _backgroundMusicPlayer.volume = _sliderValue;
        }
        #endregion SliderEvent
    }
}