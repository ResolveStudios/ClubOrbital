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
//---------------------------------------------------------------------------------------------------------
#endregion CompilerSettings
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
    /// Script can be in the scene as many times as you want. It needs to have a box collider marked as 
    /// a trigger collider attached to itself. It's recommended to put the gameObject on the 
    /// MirrorReflection layer to avoid problems with the menu raycast in game.
    /// 
    /// You should NOT have "Transfer Ownership on Collision" enabled for this script.
    /// </summary>
    [RequireComponent(typeof(BoxCollider)), UdonBehaviourSyncMode(BehaviourSyncMode.NoVariableSync)]
    public class AreaToggle : UdonSharpBehaviour
    {
        #region SerializedFields
        /// <summary>
        /// If false, the gameObjects will be activated when the player enters the zone and 
        /// deactivated when the player leaves the zone. If true, it's the other way around.
        /// </summary>
        [SerializeField, Tooltip("If false, the gameObjects will be activated when the player enters the zone and deactivated when the player leaves the zone. If true, it's the other way around.")]
        private bool _inverted = false;
        /// <summary>
        /// All objects that should be active when the player is inside the trigger area and
        /// inactive when the player left the trigger area
        /// </summary>
        [SerializeField, Tooltip("All objects that should be active when the player is inside the trigger area and inactive when the player left the trigger area")]
        private GameObject[] _toggledObjects;
        /// <summary>
        /// All scripts with a public bool '_playerIsInArea' which is set to true when the player 
        /// is inside the trigger area and set to false when the player left the trigger area.
        /// This is needed for networked buttons/sliders to "pause" the script update loop without pausing syncing.
        /// </summary>
        [SerializeField, Tooltip("All scripts with a public bool '_playerIsInArea' which is set to true when the player is inside the trigger area and set to false when the player left the trigger area. This is needed for networked buttons/sliders to ''pause'' the script update loop without pausing syncing.")]
        private UdonSharpBehaviour[] _toggledScriptBooleans;
        #endregion SerializedFields
        #region PrivateFields
        /// <summary>
        /// We need to track if player is inside the area because we can't gurantee that Start() is 
        /// always called before OnPlayerTriggerEnter() which is one weird thing in VRChat that we need to deal with
        /// </summary>
        private bool _playerIsInArea = false;
        #endregion PrivateFields
        #region StartSetup
        /// <summary>
        /// We set the default state at the start of the game, unless the player has already entered the area before this is called
        /// </summary>
        private void Start()
        {
            //we apply the current state to the objects after start to avoid issues. The randomizer ensures a smoother frametime distribution.
            SendCustomEventDelayedFrames(nameof(_ApplyStartActiveState), Random.Range(1, 30));
        }
        /// <summary>
        /// Start method which is called once at the first update frame, to ensure that Start() 
        /// of all other scripts was already called before eventually disabling them.
        /// </summary>
        public void _ApplyStartActiveState()
        {
            if (_playerIsInArea)
                SetNewState(newState: !_inverted);
            else
                SetNewState(newState: _inverted);
        }
        #endregion StartSetup
        #region PlayerTrigger
        /// <summary>
        /// Is called when localPlayer entered the trigger collider zone, turns all 
        /// objects in <see cref="_toggledObjects"/> on
        /// </summary>
        public override void OnPlayerTriggerEnter(VRCPlayerApi playerWhoEntered)
        {
            if (playerWhoEntered != Networking.LocalPlayer)
                return;
            _playerIsInArea = true;
            SetNewState(newState: !_inverted);
        }
        /// <summary>
        /// Is called when localPlayer left the trigger collider zone, turns all 
        /// objects in <see cref="_toggledObjects"/> off
        /// </summary>
        public override void OnPlayerTriggerExit(VRCPlayerApi playerWhoLeft)
        {
            if (playerWhoLeft != Networking.LocalPlayer)
                return;
            _playerIsInArea = false;
            SetNewState(newState: _inverted);
        }
        #endregion PlayerTrigger
        #region ObjectAndScriptState
        /// <summary>
        /// Setting the active state of each gameObject in <see cref="_toggledObjects"/>
        /// to the new state <param name="newState"/> if the object is valid.
        /// Also setting the bool _playerIsInArea to the <paramref name="newState"/> on each
        /// script in <see cref="_toggledScriptBooleans"/>  if the script object is valid.
        /// </summary>
        private void SetNewState(bool newState)
        {
            foreach (GameObject obj in _toggledObjects)
            {
                if (Utilities.IsValid(obj))
                    obj.SetActive(newState);
            }
            foreach(UdonSharpBehaviour script in _toggledScriptBooleans)
            {
                if (Utilities.IsValid(script))
                    script.SetProgramVariable("_playerIsInArea", newState);
            }
        }
        #endregion ObjectAndScriptState
    }
}