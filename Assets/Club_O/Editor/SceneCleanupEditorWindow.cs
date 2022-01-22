using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

public class SceneCleanupEditorWindow : EditorWindow
{
    private static SceneCleanupEditorWindow _self;
    private MeshFilter[] meshFilters;
    private SkinnedMeshRenderer[] skinnedMeshRenderers;

    [MenuItem("Tools/Scene Cleaner")]
    public static void Open()
    {
        _self = GetWindow<SceneCleanupEditorWindow>();
        _self.titleContent = new GUIContent("Scene Cleaner");
        _self.Show();
    }

    private void OnGUI()
    {
        Repaint();

        meshFilters = Resources.FindObjectsOfTypeAll<MeshFilter>();
        skinnedMeshRenderers = Resources.FindObjectsOfTypeAll<SkinnedMeshRenderer>();
        GUILayout.Box($"Scene Contains\nMesh Filters {meshFilters.Length}\tSkinned Mesh Renderers {skinnedMeshRenderers.Length}", GUILayout.ExpandWidth(true));

        if (GUILayout.Button("Clean Scene"))
        {
            foreach (var filter in meshFilters)
            {
                if (filter.mesh == null && filter.transform.childCount <= 0)
                    DestroyImmediate(filter.gameObject);
            }
        }
    }
}
