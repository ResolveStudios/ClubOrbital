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
    /// Script to apply the LOD settings from the first LOD renderer under this object to 
    /// all LOD renderer from buttons in the scene.
    /// 
    /// This is an editor script to make your life easier, but not part of the Udon# code and as such
    /// it is not documented or optimized for performance (since that would be a waste of time, given
    /// that this code will only run once in editor on demand and is there to reduce work time, not increase it).
    /// </summary>
    [CustomEditor(typeof(LodSettingsChanger))]
    public class LodSettingsChangerGUI : Editor
    {
        private GameObject _thisObject;
        private const string BUTTON_NAME_1 = "_staticButtonOn";
        private const string BUTTON_NAME_2 = "_staticButtonOff";
        public void OnEnable()
        {
            LodSettingsChanger script = (LodSettingsChanger)target;
            _thisObject = script.gameObject;
        }
        public override void OnInspectorGUI()
        {
            if (GUILayout.Button("Apply LOD settings to all buttons in scene", GUILayout.MinHeight(25f)))
            {
                LODGroup lodTemplate = _thisObject.GetComponentInChildren<LODGroup>();
                if (lodTemplate != null)
                {
                    int lodCountTemplate = lodTemplate.lodCount;
                    LOD[] lodsFromTemplate = lodTemplate.GetLODs();
                    //read LOD levels from template
                    float[] lodLevelsFromTemplate = new float[lodCountTemplate];
                    for (int i = 0; i < lodCountTemplate; i++)
                    {
                        lodLevelsFromTemplate[i] = lodsFromTemplate[i].screenRelativeTransitionHeight;
                    }
                    LODGroup[] sceneLodGroups = FindObjectsOfType<LODGroup>();
                    int count = 0;
                    foreach (LODGroup lodGroup in sceneLodGroups)
                    {
                        if (lodGroup == lodTemplate)
                            continue;
                        if (lodGroup.lodCount != lodCountTemplate)
                            continue;
                        if (lodGroup.gameObject.name == BUTTON_NAME_1 || lodGroup.gameObject.name == BUTTON_NAME_2)
                        {
                            LOD[] lod = lodGroup.GetLODs();
                            for (int i = 0; i < lodCountTemplate; i++)
                            {
                                lod[i].screenRelativeTransitionHeight = lodLevelsFromTemplate[i];
                            }
                            lodGroup.SetLODs(lod);
                            count++;
                        }
                    }
                    Debug.Log($"Applied settings to {count} LOD groups in the scene.");
                }
                else
                {
                    Debug.LogError("No LOD-Group component found under this script");
                }
            }
        }
    }
}