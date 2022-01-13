using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net;
using System.Reflection;
using System.Text;
using System.Text.RegularExpressions;
using Unity.Plastic.Newtonsoft.Json;
using UnityEditor;
using UnityEditorInternal;
using UnityEngine;
using Debug = UnityEngine.Debug;

namespace Okashi.PlaylistManager.Editors
{
    public class OkashiPlaylistManager : EditorWindow
    {
        private static OkashiPlaylistManager _window;
        public OPMLookup songLookup = null;
        public TextAsset playlistFile;
        public Rect nswr;
        ReorderableList reorder;
        internal List<SongEntry> songEntries = new List<SongEntry>();
        private Vector2 scroll;
        private System.Random rng = new System.Random();

        private void OnEnable()
        {
            Referances.Init();
            if (playlistFile) Refresh();
            reorder = new ReorderableList(songEntries, typeof(SongEntry), true, false, false, false);
            reorder.drawElementCallback += OnDrawElements;
            reorder.elementHeightCallback += (l) => 50;
        }
        private void OnDestroy()
        {
            if (songLookup)
                DestroyImmediate(songLookup);
            foreach (var _file in Directory.GetFiles(Referances.YOUTUBEDL_TMP)) File.Delete(_file);
            Directory.Delete(Referances.YOUTUBEDL_TMP);
        }
        public void OnGUI()
        {
            Repaint();

            reorder.draggable = songLookup == null;
            EditorGUILayout.BeginHorizontal();
            playlistFile = (TextAsset)EditorGUILayout.ObjectField("Playlist File", playlistFile, typeof(TextAsset), true);
            EditorGUI.BeginDisabledGroup(songEntries.Count < 2);
            if (GUILayout.Button("Suffle", GUILayout.ExpandWidth(false))) Suffle();
            EditorGUI.EndDisabledGroup();
            EditorGUI.BeginDisabledGroup(!playlistFile);
            if (GUILayout.Button("Refresh", GUILayout.ExpandWidth(false))) Refresh();
            if (GUILayout.Button("Update", GUILayout.ExpandWidth(false)))
            {
                SaveUpdate();
                Refresh();
            }
            EditorGUI.EndDisabledGroup();
            EditorGUILayout.EndHorizontal();
            EditorGUI.BeginDisabledGroup(songLookup != null);
            if (GUILayout.Button(new GUIContent("Search", "Search for soung")))
            {
                songLookup = CreateInstance<OPMLookup>();
                songLookup.parent = this;
            }
            EditorGUI.EndDisabledGroup();
            if(!songLookup)
            {
                scroll = EditorGUILayout.BeginScrollView(scroll);
                reorder.DoLayoutList();
                EditorGUILayout.EndScrollView();
                EditorGUILayout.BeginHorizontal();
                GUILayout.Space(position.width / 2);
                EditorGUI.BeginDisabledGroup(songEntries.Count <= 0);
                if (GUILayout.Button(new GUIContent("-", "Remove selected song entry from playlist"), GUILayout.ExpandWidth(false)))
                {
                    if (reorder.index == -1) songEntries.RemoveAt(songEntries.IndexOf(songEntries.Last()));
                    else songEntries.RemoveAt(reorder.index);
                }
                if (GUILayout.Button(new GUIContent("X", "Clear all entry in playlist"), GUILayout.ExpandWidth(false)))
                {
                    songEntries = new List<SongEntry>();
                    ReEnable();
                }
                EditorGUI.EndDisabledGroup();
                if (GUILayout.Button(new GUIContent("+", "Add song entry to playlist"), GUILayout.ExpandWidth(false)))
                {
                    songEntries.Add(new SongEntry());
                }
                EditorGUILayout.EndHorizontal();
            }
            else songLookup.OnInspectorGUI();
        }

        [MenuItem("Okashi/PlaylistManager")]
        public static void ShowOPMWindow()
        {
            _window = GetWindow<OkashiPlaylistManager>();
            _window.titleContent = new GUIContent("Okashi Playlist Manager");
            _window.Show();
        }
        private void ReEnable()
        {
            Referances.Init();
            reorder = new ReorderableList(songEntries, typeof(SongEntry), true, false, false, false);
            reorder.drawElementCallback += OnDrawElements;
            reorder.elementHeightCallback += (l) => 50;
        }
        private void OnDrawElements(Rect rect, int index, bool isActive, bool isFocused)
        {
            EditorGUI.BeginDisabledGroup(songLookup != null);
            EditorGUI.LabelField(new Rect(rect.x, rect.y + 10, 20, 20), $"{index + 1}:");
            songEntries[index].desc = EditorGUI.TextField(new Rect(rect.x + 20, rect.y, rect.width - 60, 20), "Name", songEntries[index].desc);
            songEntries[index].link = EditorGUI.TextField(new Rect(rect.x + 20, rect.y + 20, rect.width - 60, 20), "Link", songEntries[index].link);
            songEntries[index].imageurl = AssetDatabase.GetAssetPath(EditorGUI.ObjectField(new Rect(rect.width - 30, rect.y, 40, 40),
                AssetDatabase.LoadAssetAtPath<Sprite>(songEntries[index].imageurl), typeof(Sprite), true));
            EditorGUI.EndDisabledGroup();
        }
        private void Suffle()
        {
            int n = songEntries.Count;
            while (n > 1)
            {
                n--;
                int k = rng.Next(n + 1);
                SongEntry value = songEntries[k];
                songEntries[k] = songEntries[n];
                songEntries[n] = value;
            }
        }
        public void SaveUpdate()
        {
            var sb = new StringBuilder();
            foreach (var entry in songEntries)
            {
                sb.AppendLine($"@{entry.link}");
                sb.AppendLine($"/{(!string.IsNullOrEmpty(entry.imageurl) ? entry.imageurl : "")}");
                sb.AppendLine($"{entry.desc}");
            }
            File.WriteAllText(AssetDatabase.GetAssetPath(playlistFile), sb.ToString());
            AssetDatabase.Refresh();
        }
        public void Refresh()
        {
            songEntries.Clear();
            var songs = playlistFile.text.Split('@');
            foreach (var song in songs)
            {
                var parts = song.Replace("\r", string.Empty).Split('\n').ToList();
                for (int i = 0; i < parts.Count; i++)
                    if (parts[i].Equals(string.Empty))
                        parts.RemoveAt(i);
                if (parts.Count > 1)
                {
                    songEntries.Add(new SongEntry()
                    {
                        link = parts[0],
                        imageurl = parts[1].Remove(0, 1),
                        desc = parts[2]
                    });
                }
            }
        }
    }
}