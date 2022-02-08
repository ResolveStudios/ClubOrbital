#region Usings
using System.Collections.Generic;
using System.IO;
using UnityEditor;
using UnityEngine;
using UnityEngine.Rendering;
#endregion Usings
/// <summary>
/// Script from Reimajo purchased at https://reimajo.booth.pm/, to be used in the worlds of the person who bought the asset only.
/// Make sure to join my discord to receive update notifications for this asset and support: https://discord.gg/SWkNA394Mm
/// If you have any issues, please contact me on Discord (https://discord.gg/SWkNA394Mm) or Booth or Twitter https://twitter.com/ReimajoChan
/// Do not give any of the asset files or parts of them to anyone else.
/// </summary>
namespace ReimajoBoothAssetsEditorScripts
{
    /// <summary>
    /// Script to re-bake all meshes in case you want to change the default button position by moving 
    /// this -> EDITOR_Settings_DefaultPosition -> Base -> MovingPart 
    /// on it's local Z-axis.
    /// 
    /// To create a new button variant that doesn't overwrite the meshes of the existing ones, simply
    /// rename the root object (where this script is on). Overwriting existing meshes with a different z-position
    /// will cause existing buttons in your scene to not function properly. To avoid this, you should duplicate 
    /// and rename the setup for each button variant in the baking scene.
    /// 
    /// This is an editor script to make your life easier, but not part of the Udon# code and as such
    /// it is not documented or optimized for performance (since that would be a waste of time, given
    /// that this code will only run once in editor on demand and is there to reduce work time, not increase it).
    /// </summary>
    [CustomEditor(typeof(BakeButton))]
    public class BakeButtonGUI : Editor
    {
        /// <summary>
        /// The real offset inside the fbx asset, do not change this
        /// </summary>
        private const float MODEL_MOVINGPART_OFFSET = -0.04f;
        /// <summary>
        /// The asset path, do not change this or move files, all my assets depend on this hierarchy
        /// </summary>
        private const string BAKED_MESH_PATH = "Assets/ReimajoBoothAssets/ButtonAndSlider/CombinedMeshes";
        private BakeButton _script;
        private GameObject _thisObject;
        private bool _bakingSucceeded;
        public void OnEnable()
        {
            _script = (BakeButton)target;
            _thisObject = _script.gameObject;
        }

        public override void OnInspectorGUI()
        {
            if (GUILayout.Button("Bake Button", GUILayout.MinHeight(25f)))
            {
                _bakingSucceeded = true;
                MakeSurePathExists(BAKED_MESH_PATH);
                GameObject buttonModelExport = GetChildWithName(_thisObject.transform, "PushButtonExport");
                GameObject staticOnBakeTargetParent = GetChildWithName(buttonModelExport.transform, "_staticButtonOn");
                GameObject staticOffBakeTargetParent = GetChildWithName(buttonModelExport.transform, "_staticButtonOff");
                GameObject skinnedButtonOnSourceParent = GetChildWithName(_thisObject.transform, "EDITOR_SkinnedButtonOn");
                GameObject skinnedButtonOffSourceParent = GetChildWithName(_thisObject.transform, "EDITOR_SkinnedButtonOff");
                SetDynamicButtonPositions(buttonModelExport.transform);
                BakeButton(skinnedButtonOnSourceParent, staticOnBakeTargetParent, "On");
                BakeButton(skinnedButtonOffSourceParent, staticOffBakeTargetParent, "Off");
                if (_bakingSucceeded)
                    Debug.Log("<color=green>Baking succeeded</color>");
            }
        }

        private void SetDynamicButtonPositions(Transform buttonModelExport)
        {
            GameObject editorSettingsDefaultPosition = GetChildWithName(_thisObject.transform, "EDITOR_Settings_DefaultPosition");
            GameObject editorSettingsBase = GetChildWithName(editorSettingsDefaultPosition.transform, "Base");
            GameObject movingPart = GetChildWithName(editorSettingsBase.transform, "MovingPart");
            Vector3 targetPosition = movingPart.transform.position;
            GameObject dynamicButton = GetChildWithName(buttonModelExport.transform, "DynamicButton");
            GameObject dynamicButtonTopOn = GetChildWithName(dynamicButton.transform, "_dynamicButtonTopOn");
            GameObject dynamicButtonTopOff = GetChildWithName(dynamicButton.transform, "_dynamicButtonTopOff");
            dynamicButtonTopOn.transform.position = targetPosition;
            dynamicButtonTopOff.transform.position = targetPosition;
            BakeColliderToTarget(source: dynamicButtonTopOn, target: buttonModelExport.gameObject, $"{_thisObject.name}_DesktopButtonMeshCollider");
        }

        private void BakeButton(GameObject skinnedButton, GameObject staticButton, string name)
        {
            GameObject sourceLod0 = GetChildWithName(skinnedButton.transform, $"ButtonAll{name}_LOD0");
            GameObject sourceLod1 = GetChildWithName(skinnedButton.transform, $"ButtonAll{name}_LOD1");
            GameObject sourceLod2 = GetChildWithName(skinnedButton.transform, $"ButtonAll{name}_LOD2");

            List<GameObject> targetsLod0 = new List<GameObject> {
                GetChildWithName(staticButton.transform, $"_lod0RendererWhen{name}FromStatic"),
                GetChildWithName(staticButton.transform, $"Button{name}_LOD0")
            };
            List<GameObject> targetsLod1 = new List<GameObject> {
                GetChildWithName(staticButton.transform, $"Button{name}_LOD1")
            };
            List<GameObject> targetsLod2 = new List<GameObject> {
                GetChildWithName(staticButton.transform, $"Button{name}_LOD2")
            };

            BakeRendererToTarget(source: sourceLod0, targets: targetsLod0, $"{name}Lod0");
            BakeRendererToTarget(source: sourceLod1, targets: targetsLod1, $"{name}Lod1");
            BakeRendererToTarget(source: sourceLod2, targets: targetsLod2, $"{name}Lod2");
        }

        private void BakeRendererToTarget(GameObject source, List<GameObject> targets, string assetName)
        {
            SkinnedMeshRenderer skinnedMeshRenderer = source.GetComponent<SkinnedMeshRenderer>();
            Mesh mesh = new Mesh();
            skinnedMeshRenderer.BakeMesh(mesh);
            AssetDatabase.CreateAsset(mesh, $"{BAKED_MESH_PATH}/{_thisObject.name}_{assetName}.asset");
            foreach (GameObject target in targets)
            {
                var filter = target.GetComponent<MeshFilter>();
                filter.sharedMesh = mesh;
                var renderer = target.GetComponent<MeshRenderer>();
                renderer.sharedMaterial = skinnedMeshRenderer.sharedMaterial;
                var collider = target.GetComponent<MeshCollider>();
                if (collider != null)
                    collider.sharedMesh = mesh;
            }
        }

        private void BakeColliderToTarget(GameObject source, GameObject target, string assetName)
        {
            MeshFilter meshFilter = source.GetComponentInChildren<MeshFilter>();
            if (meshFilter == null)
            {
                _bakingSucceeded = false;
                Debug.LogError("Source object has no mesh filter, can't create a mesh collider from it.");
                return;
            }
            List<MeshFilter> meshFilters = new List<MeshFilter>();
            meshFilters.Add(meshFilter);
            Vector3 realPosition = meshFilter.transform.position;
            Quaternion realRotation = meshFilter.transform.rotation;
            float newOffset = MODEL_MOVINGPART_OFFSET - source.transform.localPosition.z;
            meshFilter.transform.position = new Vector3(0, newOffset, 0);
            meshFilter.transform.rotation = Quaternion.identity;
            CombineMeshesToOne(meshFilters, assetName, target, targetIsMeshCollider: true);
            meshFilter.transform.position = realPosition;
            meshFilter.transform.rotation = realRotation;
        }
        /// <summary>
        /// Returns the child with the name under the specified transform, returns null if no such child was found
        /// </summary>
        private GameObject GetChildWithName(Transform parent, string name)
        {
            int childCount = parent.childCount;
            for (int i = 0; i < childCount; i++)
            {
                if (parent.GetChild(i).name == name)
                    return parent.GetChild(i).gameObject;
            }
            _bakingSucceeded = false;
            Debug.LogError($"[BakeButtonGUI] Can't find a child with the name '{name}' under the parent {parent.name}");
            return null;
        }
        #region MeshCombiner
        /// <summary>
        /// Combines all meshes from the meshFilters in all childs as long as they share the same material
        /// Highly modified version of https://github.com/sirgru/MeshCombineWizard/blob/master/MeshCombineWizard.cs
        /// </summary>
        public void CombineMeshesToOne(List<MeshFilter> meshFilters, string assetTargetName, GameObject targetObject, bool targetIsMeshCollider)
        {
            bool is32bit = false;

            // Locals
            Dictionary<Material, List<MeshFilter>> materialToMeshFilterList = new Dictionary<Material, List<MeshFilter>>();

            // Go through all mesh filters and establish the mapping between the materials and all mesh filters using it.
            foreach (var meshFilter in meshFilters)
            {
                var meshRenderer = meshFilter.GetComponent<MeshRenderer>();
                if (meshRenderer == null)
                {
                    Debug.LogWarning("The Mesh Filter on object " + meshFilter.name + " has no Mesh Renderer component attached. Skipping.");
                    continue;
                }

                var materials = meshRenderer.sharedMaterials;
                if (materials == null)
                {
                    Debug.LogWarning("The Mesh Renderer on object " + meshFilter.name + " has no material assigned. Skipping.");
                    continue;
                }

                // If there are multiple materials on a single mesh, cancel.
                if (materials.Length > 1)
                {
                    _bakingSucceeded = false;
                    Debug.LogError("Objects with multiple materials on the same mesh are not supported. Create multiple meshes from this object's sub-meshes in an external 3D tool and assign separate materials to each. Operation cancelled.");
                    return;
                }
                var material = materials[0];

                // Add material to mesh filter mapping to dictionary
                if (materialToMeshFilterList.ContainsKey(material)) materialToMeshFilterList[material].Add(meshFilter);
                else materialToMeshFilterList.Add(material, new List<MeshFilter>() { meshFilter });
            }

            // If there are multiple meshes with different materials, cancel (my customization doesn't support that)
            if (materialToMeshFilterList.Count > 1)
            {
                _bakingSucceeded = false;
                Debug.LogError("Objects with multiple meshes from a different material are not supported. Operation cancelled.");
                return;
            }

            // For each material, create a new merged object, in the scene and in the assets folder.
            foreach (var entry in materialToMeshFilterList)
            {
                List<MeshFilter> meshesWithSameMaterial = entry.Value;

                CombineInstance[] combine = new CombineInstance[meshesWithSameMaterial.Count];
                for (int i = 0; i < meshesWithSameMaterial.Count; i++)
                {
                    combine[i].mesh = meshesWithSameMaterial[i].sharedMesh;
                    combine[i].transform = meshesWithSameMaterial[i].transform.localToWorldMatrix;
                }

                // Create a new mesh using the combined properties
                var format = is32bit ? IndexFormat.UInt32 : IndexFormat.UInt16;
                Mesh combinedMesh = new Mesh { indexFormat = format };
                combinedMesh.CombineMeshes(combine);

                // Create asset
                AssetDatabase.CreateAsset(combinedMesh, $"{BAKED_MESH_PATH}/{assetTargetName}.asset");

                if (targetIsMeshCollider)
                {
                    var meshCollider = targetObject.GetComponent<MeshCollider>();
                    meshCollider.sharedMesh = combinedMesh;
                }
                else
                {
                    var filter = targetObject.GetComponent<MeshFilter>();
                    filter.sharedMesh = combinedMesh;
                    var renderer = targetObject.GetComponent<MeshRenderer>();
                    renderer.sharedMaterial = entry.Key;
                }
            }
        }
        /// <summary>
        /// makes sure path exists, creates it if needed
        /// </summary>
        public void MakeSurePathExists(string path)
        {
            if (!Directory.Exists(path))
                Directory.CreateDirectory(path);
        }
        #endregion MeshCombiner
    }
}