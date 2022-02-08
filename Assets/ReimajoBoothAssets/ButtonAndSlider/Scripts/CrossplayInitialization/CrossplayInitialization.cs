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
    /// Makes sure a desktop user and VR user can have different objects in the world that are only activated for them.
    /// The not needed objects are deactivated and destroyed.
    /// </summary>
    [UdonBehaviourSyncMode(BehaviourSyncMode.NoVariableSync)]
    public class CrossplayInitialization : UdonSharpBehaviour
    {
        /// <summary>
        /// GameObject that are destroyed when the user is in desktop mode
        /// </summary>
        [SerializeField]
        private GameObject[] _vrOnlyObjects = new GameObject[0];
        [SerializeField]
        private bool _destroyVrOnlyObjectsOnDesktop = true;
        /// <summary>
        /// GameObject that are destroyed when the user is in VR mode
        /// </summary>
        [SerializeField]
        private GameObject[] _desktopOnlyObjects = new GameObject[0];
        [SerializeField]
        private bool _destroyDesktopOnlyObjectsOnVR = true;
        public void Start()
        {
            VRCPlayerApi localPlayer = Networking.LocalPlayer;
            if (localPlayer != null)
            {
                if (localPlayer.IsUserInVR())
                {
                    foreach (GameObject obj in _vrOnlyObjects)
                    {
                        obj.SetActive(true);
                    }
                    foreach (GameObject obj in _desktopOnlyObjects)
                    {
                        if (_destroyDesktopOnlyObjectsOnVR)
                            Destroy(obj);
                        else
                            obj.SetActive(false);
                    }
                }
                else
                {
                    foreach (GameObject obj in _desktopOnlyObjects)
                    {
                        obj.SetActive(true);
                    }
                    foreach (GameObject obj in _vrOnlyObjects)
                    {
                        if (_destroyVrOnlyObjectsOnDesktop)
                            Destroy(obj);
                        else
                            obj.SetActive(false);
                    }
                }
            }
            Destroy(this.gameObject);
        }
    }
}
