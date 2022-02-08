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
    /// This script can be multiple times in the world.
    /// It plays a sound event from a list each time _ButtonDownEvent() is called, starting with the first sound and then looping over the list,
    /// at the position of this gameObject and with the specified _audioVolume.
    /// 
    /// You should NOT have "Synchronize Position" enabled for this script (should be default off anyway unless you set it manually).
    /// You should NOT have "Transfer Ownership on Collision" enabled for this script.
    /// </summary>
    [UdonBehaviourSyncMode(BehaviourSyncMode.NoVariableSync)]
    public class SoundEventLoop : UdonSharpBehaviour
    {
        #region SerializedFields
        /// <summary>
        /// A list of sound events that will be played one by one on each button press in an order, starting with the first one on the first button press
        /// </summary>
        [SerializeField, Tooltip("A list of sound events that will be played one by one on each button press in an order, starting with the first one on the first button press.")]
        private AudioClip[] _audioClips = new AudioClip[0];
        /// <summary>
        /// Volume at which the audio is being played
        /// </summary>
        [SerializeField, Range(0,1), Tooltip("Volume at which the audio is being played.")]
        private float _audioVolume = 1f;
        #endregion SerializedFields
        #region PrivateFields
        private int _nextSoundEvent = 0;
        #endregion PrivateFields
        #region Start
        /// <summary>
        /// Is called once after loading the world or when this object is enabled for the first time
        /// </summary>
        private void Start()
        {
            if (_audioClips.Length == 0)
                Debug.LogError($"No Audio clips assigned to SoundEventLoop '{this.name}'");
        }
        #endregion Start
        #region SoundEventLoop
        /// <summary>
        /// Can be called externally by e.g. a button to play the next sound.
        /// </summary>
        public void _ButtonDownEvent()
        {
            PlayNextSound();
        }
        /// <summary>
        /// Plays the audio clip number <see cref="_nextSoundEvent"/> from the array <see cref="_audioClips"/>
        /// at the position of this object
        /// </summary>
        private void PlayNextSound()
        {
            if (_audioClips.Length == 0)
                return;
            if (_nextSoundEvent >= _audioClips.Length)
                _nextSoundEvent = 0;
            AudioSource.PlayClipAtPoint(_audioClips[_nextSoundEvent], this.transform.position, _audioVolume);
            _nextSoundEvent++;
        }
        #endregion SoundEventLoop
    }
}