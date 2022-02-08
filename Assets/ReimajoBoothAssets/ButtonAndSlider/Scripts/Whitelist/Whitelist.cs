#region CompilerSettings
//#define EXPOSE_WHITELIST_AND_SETTINGS //due to the availability of modded clients, we do not expose the whitelist to the editor by default.
// You can still choose to do so at your own risk, but I don't recommend it, since it's also exposing them to mod users.
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
    /// This script should only be once in the world. It allows you to resctrict certain components
    /// to certain users. 
    /// 
    /// You should NOT have "Synchronize Position" enabled for this script (should be default off anyway unless you set it manually).
    /// You should NOT have "Transfer Ownership on Collision" enabled for this script.
    /// </summary>
    [UdonBehaviourSyncMode(BehaviourSyncMode.NoVariableSync)]
    public class Whitelist : UdonSharpBehaviour
    {
        #region Whitelist
        /// <summary>
        /// List of Display names (not account names!), case sensitive. 
        /// On the VRChat Website it's the username displayed on top. This username can be changed each 90 days by the users.
        /// Make sure to copy & paste the name, since the website does not properly display the name itself and users can 
        /// have invisible characters or lookalike characters in their names. DO NOT USE CHROME, FireFox works fine, but 
        /// Chrome displays the names in all CAPS which is incorrect.
        /// 
        /// Example list: 
        /// private string[] _whitelist = new string[] 
        /// { "Reimajo", "Sero Kaiju", "JoRoFox" };
        /// </summary>
#if EXPOSE_WHITELIST_AND_SETTINGS
        [SerializeField, Tooltip("List of Display names (not account names!), case sensitive. On the VRChat Website it's the username displayed on top. This username can be changed each 90 days by the users. Make sure to copy & paste the name, since the website does not properly display the name itself and users can have invisible characters or lookalike characters in their names. DO NOT USE CHROME, FireFox works fine, but Chrome displays the names in all CAPS which is incorrect.")]
#endif
        private string[] _whitelist = new string[]
        { "Reimajo", "Sero Kaiju", "JoRoFox" }; //<- put your own names here. 
        #endregion Whitelist
        #region Settings
        /// <summary>
        /// If true, the objects + their childs will be destroyed if the user is not whitelisted.
        /// This is safer than leaving them in the scene, but can break other scripts
        /// that might try to access those objects or any child of it, such as an area toggle.
        /// </summary>
#if EXPOSE_WHITELIST_AND_SETTINGS
        [SerializeField, Tooltip("If true, the objects will be destroyed if the user is not whitelisted. This is safer than leaving them in the scene, but can break other scripts that might try to access those objects or any child of it, such as an area toggle.")]
#endif
        private bool _destroyObjects = false;
        /// <summary>
        /// If true, the object where this script is on + their childs will be destroyed if the user is not whitelisted.
        /// This is safer than leaving them in the scene, just make sure to not have any childs under this script
        /// which are referenced by other scripts in the scene that might try to access those objects or any child of it, 
        /// such as an area toggle.
        /// </summary>
#if EXPOSE_WHITELIST_AND_SETTINGS
        [SerializeField, Tooltip("If true, the object where this script is on + their childs will be destroyed if the user is not whitelisted. This is safer than leaving them in the scene, just make sure to not have any childs under this script which are referenced by other scripts in the scene that might try to access those objects or any child of it, such as an area toggle.")]
#endif
        private bool _destroySelf = false;
        #endregion Settings
        #region SerializedFields
        /// <summary>
        /// All objects which should only be available for users in the <see cref="_whitelist"/>.
        /// Make sure that those objects are disabled in editor for optimal security.
        /// </summary>
        [SerializeField, Tooltip("All objects which should only be available for users in the Whitelist. Make sure that those objects are disabled in editor for optimal security.")]
        private GameObject[] _objectsForWhitelistedUsersOnly = new GameObject[0];
        #endregion SerializedFields
        #region StartSetup
        /// <summary>
        /// We set the default state at the start of the game, unless the player has already entered the area before this is called
        /// </summary>
        private void Start()
        {
            if(Networking.LocalPlayer == null)
            {
                this.gameObject.SetActive(false);
                return;
            }
            //checking if localPlayer is in the whitelist
            if(System.Array.IndexOf(_whitelist, Networking.LocalPlayer.displayName) != -1)
            {
                EnableObjects();
            }
            else if(_destroyObjects)
            {
                DestroyObjects();
            }
            else
            {
                DisableObjects();
            }
            //this script here is no longer needed
            if(_destroySelf)
            {
                Destroy(this.gameObject);
            }
        }
        #endregion StartSetup
        #region ObjectStateControl
        /// <summary>
        /// Is called when the user is whitelisted to enable all objects for them
        /// </summary>
        private void EnableObjects()
        {
            foreach (GameObject obj in _objectsForWhitelistedUsersOnly)
            {
                if (VRC.SDKBase.Utilities.IsValid(obj))
                    obj.SetActive(true);
            }
        }
        /// <summary>
        /// Is called when the user is NOT whitelisted and <see cref="_destroyObjects"/> 
        /// is disabled to disable all objects for them
        /// </summary>
        private void DisableObjects()
        {
            foreach (GameObject obj in _objectsForWhitelistedUsersOnly)
            {
                if (VRC.SDKBase.Utilities.IsValid(obj))
                    obj.SetActive(false);
            }
        }
        /// <summary>
        /// Is called when the user is NOT whitelisted and <see cref="_destroyObjects"/> 
        /// is enabled to destroy all objects for them
        /// </summary>
        private void DestroyObjects()
        {
            foreach (GameObject obj in _objectsForWhitelistedUsersOnly)
            {
                if (VRC.SDKBase.Utilities.IsValid(obj))
                    Destroy(obj);
            }
        }
        #endregion ObjectStateControl
    }
}