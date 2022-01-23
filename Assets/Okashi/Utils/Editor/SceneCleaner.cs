using System;
using System.Collections.Generic;
using System.Linq;
using UnityEditor;
using UnityEditorInternal;
using UnityEngine;
using UnityEngine.SceneManagement;

public class SceneCleaner : EditorWindow
{
    private static SceneCleaner _self;

    public ReorderableList _list;
    public List<GameObject> gameObjects = new List<GameObject>();
    private Vector2 sv;

    public void OnEnable()
    {
        Refresh();
       
    }

    private void Refresh()
    {
        gameObjects = Resources.FindObjectsOfTypeAll<MeshFilter>().Where(x => x.sharedMesh == null || x.sharedMesh.name.Contains("Instance"))
            .Select(x => x.gameObject).ToList();

        _list = new ReorderableList(gameObjects, typeof(GameObject), true, true, false, false);
        _list.drawHeaderCallback += r => { EditorGUI.LabelField(r, $"Game Objects ({gameObjects.Count})"); };
        _list.drawElementCallback += (r, i, b, a) =>
        {
            EditorGUI.ObjectField(new Rect(r.x, r.y, r.width - 50, r.height), new GUIContent("Object"), gameObjects[i], typeof(GameObject), true);
            if(GUI.Button(new Rect(r.width - 25, r.y, 50, r.height), "Select"))
            {
                Selection.activeGameObject = gameObjects[i];
                EditorGUIUtility.PingObject(Selection.activeGameObject);
            }
        };
    }

    [MenuItem("Okashi/Scene Cleaner")]
    public static void Open()
    {
        _self = GetWindow<SceneCleaner>();
        _self.titleContent = new GUIContent("Scene Cleaner");
        _self.Show();
    }

    private void OnGUI()
    {
        Repaint();
        Refresh();

        var meshFilters = Resources.FindObjectsOfTypeAll<MeshFilter>().Where(x => x.sharedMesh == null).ToList();
        var skinnedMeshRenderers = Resources.FindObjectsOfTypeAll<SkinnedMeshRenderer>().Where(x => x.sharedMesh == null).ToList();
        GUILayout.Box($"Scene Contains\nMesh Filters {meshFilters.Count}\tSkinned Mesh Renderers {skinnedMeshRenderers.Count}", GUILayout.ExpandWidth(true));

        if (GUILayout.Button("Refresh")) Refresh();
        sv = EditorGUILayout.BeginScrollView(sv);
        _list.DoLayoutList();
        EditorGUILayout.EndScrollView();
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