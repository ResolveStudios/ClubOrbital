using UnityEngine;
using UnityEditor;
using System.Collections.Generic;
/// <summary>
/// Script from Reimajo purchased at https://reimajo.booth.pm/, to be used in the worlds of the person who bought the asset only.
/// Make sure to join my discord to receive update notifications for this asset and support: https://discord.gg/SWkNA394Mm
/// If you have any issues, please contact me on Discord (https://discord.gg/SWkNA394Mm) or Booth or Twitter https://twitter.com/ReimajoChan
/// Do not give any of the asset files or parts of them to anyone else.
/// 
/// Note: This editorscript was made since I don't want to manually select each renderer myself when changing a material. 
/// You might not need it yourself and you can simply delete it from your assets folder.
/// I wanted to include it for those who might find it useful. It can be used on any other object as well.
/// </summary>
public class SelectRenderer : ScriptableObject
{
    [MenuItem("GameObject/Reimajo/SelectChildRenderers", false, 30)]
    static void SelectChildRenderers()
    {
        SelectAllChildRenderer();
    }
    static void SelectAllChildRenderer()
    {
        if (Selection.transforms.Length == 0)
        {
            Debug.LogError("[SelectRenderer] Nothing is selected");
            return;
        }
        List<GameObject> objWithRenderer = new List<GameObject>();
        foreach (GameObject selectedObj in Selection.gameObjects)
        {
            Renderer[] renderers = selectedObj.GetComponentsInChildren<Renderer>();
            foreach (Renderer renderer in renderers)
            {
                GameObject rendererObj = renderer.gameObject;
                if (!objWithRenderer.Contains(rendererObj))
                    objWithRenderer.Add(rendererObj);
            }
        }
        Debug.Log($"[SelectRenderer] Selected {objWithRenderer.Count} objects");
        Selection.objects = objWithRenderer.ToArray();
    }
}
