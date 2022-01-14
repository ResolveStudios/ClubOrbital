using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
namespace Okashi.PlaylistManager.Editors
{
    public class YtResultsEntryEditor : Editor
    {
        public int id;
        internal OPMLookup parent;
        internal float pbPercentage;
        internal bool previewing;
        internal string progresstext;
        private Editor audioClipEditor;
        GUIStyle bgColor = new GUIStyle();

        public override void OnInspectorGUI()
        {
            Repaint();
            try
            {
                var content = new GUIContent();
                content.text =
                    $"{parent.entryList[id].title}\n" +
                    $"{parent.entryList[id].url}\n" +
                    $"{TimeSpan.FromSeconds(parent.entryList[id].duration)}";
                if (parent.entryList[id].more != null) content.image = parent.entryList[id].more.thumbnailRef;
                content.tooltip = "Click to see more info";
                GUI.skin.button.imagePosition = ImagePosition.ImageLeft;
                GUI.skin.button.alignment = TextAnchor.MiddleLeft;
                if (GUILayout.Button(new GUIContent(content), GUILayout.Height(50), GUILayout.Width(parent.parent.position.width - 20)))
                {
                    parent.entryList.FindAll(x => x != parent.entryList[id]).ForEach(x => x.expanded = false);
                    parent.entryList.FindAll(x => x != parent.entryList[id]).ForEach(x => x.more = null);
                    parent.entryList[id].expanded = !parent.entryList[id].expanded;
                    if (parent.entryList[id].expanded && parent.entryList[id].more == null) 
                        TaskManager.RunAsync(() => parent.RunSearch(id));
                }
                GUI.skin.button.imagePosition = ImagePosition.ImageLeft;
                GUI.skin.button.alignment = TextAnchor.MiddleCenter;
                if (parent.entryList[id].expanded)
                {
                    if (parent.entryList[id].more == null)
                    {
                        EditorGUILayout.HelpBox("Please wait, Loading result info...", MessageType.Warning);
                    }
                    else
                    {
                        //EditorGUILayout.ObjectField(parent.entryList[id].more.thumbnailRef, typeof(Texture2D), false, GUILayout.Width(16 * 5), GUILayout.Height(9 * 5));

                        if (previewing)
                        {
                            EditorGUILayout.BeginHorizontal();
                            if (GUILayout.Button("X", GUILayout.ExpandWidth(false), GUILayout.Height(60)))
                                parent.ClosePreview(id);
                            if (pbPercentage <= 0)
                            {
                                if (parent.entryList[id].more.audioclipRef != null)
                                {
                                    if (audioClipEditor == null)
                                    {
                                        audioClipEditor = CreateEditor(parent.entryList[id].more.audioclipRef);
                                        audioClipEditor.ReloadPreviewInstances();
                                    }
                                    audioClipEditor.OnPreviewGUI(EditorGUILayout.GetControlRect(true, 60), bgColor);
                                }
                            }
                            if (pbPercentage > 0f)
                            {
                                EditorGUI.ProgressBar(EditorGUILayout.GetControlRect(true, 60), pbPercentage, $"Downloading Audio...{progresstext}");
                            }
                            EditorGUILayout.EndHorizontal();
                        }
                        else
                        {
                            EditorGUI.BeginDisabledGroup(parent.entryList[id].more == null || !parent.entryList[id].more.isReady);
                            if (GUILayout.Button("Preview", GUILayout.Height(60)))
                            {
                                previewing = true;
                                TaskManager.RunAsync(() => parent.GetAudio(id));
                            }
                            EditorGUI.EndDisabledGroup();
                        }
                        EditorGUILayout.SelectableLabel(parent.entryList[id].more.description, GUILayout.Height(300));
                        EditorGUI.BeginDisabledGroup(!CanAdd());
                        if (GUILayout.Button($"Playlist Add [ {(parent.entryList[id].more == null || !parent.entryList[id].more.isReady ? string.Empty : parent.entryList[id].more.title)} ]"))
                            TaskManager.RunAsync(() => parent.Use(id));
                        EditorGUI.EndDisabledGroup();
                        if (GUILayout.Button("Go Back"))
                        {
                            parent.ClosePreview(id);
                            parent.entryList[id].more = null;
                            audioClipEditor = null;
                        }
                    }
                }
            }
            catch
            {
                EditorGUILayout.HelpBox("Unable to draw UI", MessageType.Warning);
            }
        }

        private bool CanAdd()
        {
            if (parent.parent == null) return false;
            if (parent.parent.playlistFile == null) return false;
            if (parent.entryList[id].more == null) return false;
            if (parent.entryList[id].more.thumbnailSpriteLoading) return false;
            if (!parent.entryList[id].more.isReady) return false;

            return true;
        }
    }
}