using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEditor;
using UnityEngine;

public class SceneCleanupEditorWindow : EditorWindow
{
    private static SceneCleanupEditorWindow _self;
    
    [MenuItem("Okashi/Scene Cleaner")]
    public static void Open()
    {
        _self = GetWindow<SceneCleanupEditorWindow>();
        _self.titleContent = new GUIContent("Scene Cleaner");
        _self.Show();
    }

    private void OnGUI()
    {
        Repaint();

        var meshFilters = Resources.FindObjectsOfTypeAll<MeshFilter>().Where(x => x.sharedMesh == null).ToList();
        var skinnedMeshRenderers = Resources.FindObjectsOfTypeAll<SkinnedMeshRenderer>().Where(x => x.sharedMesh == null).ToList();
        GUILayout.Box($"Scene Contains\nMesh Filters {meshFilters.Count}\tSkinned Mesh Renderers {skinnedMeshRenderers.Count}", GUILayout.ExpandWidth(true));

        if (GUILayout.Button("Clean Scene"))
        {
            foreach (var filter in meshFilters)
            {
                if (filter.sharedMesh == null && filter.transform.childCount <= 0)
                {
                    try
                    {
                        if (PrefabUtility.IsPartOfPrefabInstance(filter.transform.root.gameObject))
                            PrefabUtility.UnpackPrefabInstance(filter.transform.root.gameObject, PrefabUnpackMode.Completely, InteractionMode.AutomatedAction);
                        DestroyImmediate(filter.gameObject, true);
                    }
                    catch (Exception ex)
                    {
                        Debug.Log(AssetDatabase.GetAssetPath(filter.gameObject));
                    }
                    
                }
            }
        }
    }
}
