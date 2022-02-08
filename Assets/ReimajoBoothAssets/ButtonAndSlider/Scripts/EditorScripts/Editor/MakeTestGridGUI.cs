using UnityEditor;
using UnityEngine;
/// <summary>
/// Script from Reimajo purchased at https://reimajo.booth.pm/, to be used in the worlds of the person who bought the asset only.
/// Make sure to join my discord to receive update notifications for this asset and support: https://discord.gg/SWkNA394Mm
/// If you have any issues, please contact me on Discord (https://discord.gg/SWkNA394Mm) or Booth or Twitter https://twitter.com/ReimajoChan
/// Do not give any of the asset files or parts of them to anyone else.
/// </summary>
namespace ReimajoBoothAssetsEditorScripts
{
    /// <summary>
    /// Script to prove that a classic skinned mesh renderer button would have 2x the performance impact compared
    /// to my approach of baking the mesh to have a normal mesh renderer. Static batching would further increase
    /// performance if the button doesn't need to move. Removing additional textures such as the baked occlusion 
    /// map could also help, those are only "nice to have" but not nessasary.
    /// 
    /// This is an editor script to make your life easier, but not part of the Udon# code and as such
    /// it is not documented or optimized for performance (since that would be a waste of time, given
    /// that this code will only run once in editor on demand and is there to reduce work time, not increase it).
    /// </summary>
    [CustomEditor(typeof(MakeTestGrid))]
    public class MakeTestGridGUI : Editor
    {
        //--------------------------- change grid settings here ----------------
        #region Settings
        /// <summary>
        /// How many rows the test grid should have
        /// </summary>
        private const int HORIZONTAL_COUNT = 20;
        /// <summary>
        /// How many columns the test grid should have
        /// </summary>
        private const int VERTICAL_COUNT = 10;
        /// <summary>
        /// Distance between two objects on the grid
        /// </summary>
        private const float GRID_DISTANCE = 0.2f;
        #endregion Settings
        //--------------------------- change grid settings here ----------------
        MakeTestGrid _script;
        GameObject _thisObject;
        public void OnEnable()
        {
            _script = (MakeTestGrid)target;
            _thisObject = _script.gameObject;
        }
        public override void OnInspectorGUI()
        {
            if (GUILayout.Button("Make Test Grid", GUILayout.MinHeight(25f)))
            {
                if (_thisObject.transform.childCount == 0)
                {
                    Debug.LogError("[MakeTestGrid] There is no child object that can be duplicated. Drag an object under this one first.");
                    return;
                }
                GameObject childPrefab = _thisObject.transform.GetChild(0).gameObject;
                Vector3 position = Vector3.zero;
                int count = 1;
                for (int i = 0; i < VERTICAL_COUNT; i++)
                {
                    position.y += GRID_DISTANCE;
                    position.z = 0;
                    for (int ii = 0; ii < HORIZONTAL_COUNT; ii++)
                    {
                        position.z += GRID_DISTANCE;
                        GameObject newObj = Instantiate(childPrefab);
                        newObj.transform.localPosition = position;
                        newObj.name = count.ToString();
                        newObj.transform.parent = _thisObject.transform;
                        count++;
                    }
                }
            }
        }
    }
}