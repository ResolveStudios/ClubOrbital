using System;
using System.Collections;
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
    public enum OutputType { Output, Error }
    public class OPMLookup : Editor
    {
        private string queryInput;
        internal List<YtResultsEntry> entryList = new List<YtResultsEntry>();
        private Vector2 lookupInfoScroll;
        internal OkashiPlaylistManager parent;
        private bool searching;
        private bool thumbnailing;
        private Vector2 scroll;
        private Editor audioClipEditor;
        private Editor thumbnailEditor;
        internal GUIContent titleContent;

        public void OnEnable()
        {
            Referances.Init();
            Clean();
        }
        public void OnDestroy()
        {
            Clean();
            ((OkashiPlaylistManager)parent).songLookup = null;
        }
        public override void OnInspectorGUI()
        {
            Repaint();
            TaskManager.Update();

            GUILayout.Space(10);
            GUILayout.Box(new GUIContent("Dynamic Search Engine", "The url or search turm  of the youtube video"), GUILayout.ExpandWidth(true));
            EditorGUILayout.BeginHorizontal();
            queryInput = EditorGUILayout.TextField(queryInput);
            EditorGUI.BeginDisabledGroup(searching == true || string.IsNullOrEmpty(queryInput));
            if (GUILayout.Button(new GUIContent("Search", "Search youtube for videos"), GUILayout.Width(55)))
            {
                if (string.IsNullOrEmpty(queryInput)) return;
                TaskManager.RunOnMainThread(Clean);
                TaskManager.RunAsync(() => RunSearch(queryInput));
            }
            EditorGUI.EndDisabledGroup();
            EditorGUILayout.EndHorizontal();

            DrawResults();

            if (GUILayout.Button("Close"))
            {
                DestroyImmediate(this);
            }
        }

        internal void ClosePreview(int index)
        {
            entryList[index].editor.pbPercentage = 0;
            entryList[index].editor.previewing = false;
            StopAudioPlayback();
            if (entryList[index].more != null && entryList[index].more.audioclipRef != null) DestroyImmediate(entryList[index].more.audioclipRef);
            audioClipEditor = null;
        }
        private void StopAudioPlayback()
        {
            Assembly unityEditorAssembly = typeof(AudioImporter).Assembly;
            Type audioUtilClass = unityEditorAssembly.GetType("UnityEditor.AudioUtil");
            MethodInfo method = audioUtilClass.GetMethod("StopAllClips", BindingFlags.Static | BindingFlags.Public, null, new Type[] { }, null);
            method.Invoke(null, new object[] { });
        }
        private void StartAudioPlayback(AudioClip clip)
        {
            Assembly unityEditorAssembly = typeof(AudioImporter).Assembly;
            Type audioUtilClass = unityEditorAssembly.GetType("UnityEditor.AudioUtil");
            MethodInfo method = audioUtilClass.GetMethod(
                "PlayClip",
                BindingFlags.Static | BindingFlags.Public,
                null,
                new System.Type[] {
                typeof(AudioClip)
                },
                null
            );
            method.Invoke(
                null,
                new object[] {
                clip
                }
            );

        }
        public void DrawResults()
        {
            if (entryList == null) return;
            scroll = EditorGUILayout.BeginScrollView(scroll);

            for (int i = 0; i < entryList.Count; i++)
            {
                if (entryList[i].editor == null)
                {
                    entryList[i].editor = CreateInstance<YtResultsEntryEditor>();
                    entryList[i].editor.parent = this;
                    entryList[i].editor.id = i;
                }
                entryList[i].editor.OnInspectorGUI();
            }

            EditorGUILayout.EndScrollView();
        }

        private bool isThumbnailValid(int index)
        {
            var res =
                thumbnailEditor != null &&
                (entryList[index].more.thumbnailRef != null);
            return res;
        }

        private void RunSearch(string url)
        {
            var query = string.Empty;

            if (url.StartsWith("http://") || url.StartsWith("https://"))
                query = $"ytsearch1:\"{url}\"";
            else
                query = $"ytsearch50:\"{url}\"";
            var processInfo = default(ProcessStartInfo);
            processInfo = new ProcessStartInfo($"\"{Referances.YOUTUBEDL_EXE}\"", $"-vJ --no-playlist --flat-playlist {query}");
            processInfo.CreateNoWindow = true;
            processInfo.UseShellExecute = false;
            processInfo.RedirectStandardError = true;
            processInfo.RedirectStandardOutput = true;
            var process = new Process();
            process.StartInfo = processInfo;
            entryList = new List<YtResultsEntry>();
            process.OutputDataReceived += (object sender, DataReceivedEventArgs e) =>
            {
                if (e != null && e.Data.StartsWith("{"))
                {
                    var _results = JsonConvert.DeserializeObject<YtResults>(e.Data);
                    entryList = new List<YtResultsEntry>(_results.entries);
                    entryList.ForEach(x => x.url = $"https://youtu.be/{x.url}");
                    searching = false;
                }
            };
            process.ErrorDataReceived += (object sender, DataReceivedEventArgs e) =>
            {
                if (e.Data != null)
                {
                    if (e.Data.Contains("[debug]")) return;
                    Debug.LogWarning($"EDR: {e.Data}");
                }
            };
            process.Start();
            process.BeginOutputReadLine();
            process.BeginErrorReadLine();
            process.WaitForExit();
            searching = false;
            process.Close();
        }
        internal void RunSearch(int index)
        {
            var processInfo = new ProcessStartInfo($"\"{Referances.YOUTUBEDL_EXE}\"", $"-vJ --print-json {entryList[index].url}");
            processInfo.CreateNoWindow = true;
            processInfo.UseShellExecute = false;
            processInfo.RedirectStandardError = true;
            processInfo.RedirectStandardOutput = true;
            var process = new Process();
            process.StartInfo = processInfo;
            process.OutputDataReceived += (object sender, DataReceivedEventArgs e) =>
            {
                if (e.Data.StartsWith("{"))
                {
                    entryList[index].more = JsonUtility.FromJson<YtResult>(e.Data);
                    entryList[index].more.json = e.Data;
                    entryList[index].more.isReady = true;
                    TaskManager.RunAsync(() => GetThumbnail(index));
                }
            };
            process.ErrorDataReceived += (object sender, DataReceivedEventArgs e) =>
            {

                if (e.Data != null)
                {
                    if (e.Data.Contains("[debug]")) return;
                    Debug.LogWarning($"EDR: {e.Data}");
                }
            };
            process.Start();
            process.BeginOutputReadLine();
            process.BeginErrorReadLine();
            process.WaitForExit();
            TaskManager.RunAsync(() => GetThumbnail(index));
            searching = false;
            process.Close();
        }
        internal void GetThumbnail(int index)
        {
            var title = entryList[index].more.title;
            Regex rgx = new Regex("[^a-zA-Z0-9 -]");
            title = rgx.Replace(title, "");
            title = title.Replace(' ', '-');
            title = title.ToLower();
            var imageFile = $"{Referances.YOUTUBEDL_TMP}\\{title}.png";
            entryList[index].more.thumbnailRef = null;
            if (!File.Exists(imageFile))
            {
                Debug.Log($"Creating Thumbnail: {imageFile}");
                TaskManager.RunAsync(() =>
                {
                    WebClient client = new WebClient();
                    client.DownloadDataCompleted += (o, a) =>
                    {
                        while (a.Result == null) { };
                        var bytes = a.Result;
                        using (var ms = new MemoryStream(bytes))
                        {
                            var webpimageFile = Referances.ChangeExtention(imageFile, "webp");
                            File.WriteAllBytes(webpimageFile, ms.ToArray());
                            var processInfo = new ProcessStartInfo($"\"{Referances.OKPROCESSOR_EXE}\"", $"-convert --image-type-png \"{webpimageFile}\"");
                            processInfo.CreateNoWindow = true;
                            processInfo.UseShellExecute = false;
                            processInfo.RedirectStandardError = true;
                            processInfo.RedirectStandardOutput = true;
                            var process = new Process();
                            process.StartInfo = processInfo;
                            process.OutputDataReceived += (object sender, DataReceivedEventArgs e) =>
                            {
                                OnOutput(e, OutputType.Output);
                            };
                            process.ErrorDataReceived += (object sender, DataReceivedEventArgs e) => { OnOutput(e, OutputType.Error); };
                            process.Start();
                            process.BeginOutputReadLine();
                            process.BeginErrorReadLine();
                            process.WaitForExit();
                            process.Close();
                        }
                    };
                    client.DownloadDataAsync(new Uri(entryList[index].more.thumbnail));
                });
                while (!File.Exists(imageFile)) { }
            }
            Texture2D dummytex = null;
            if (File.Exists(imageFile))
            {
                Debug.Log("Loading video thumbnail...");
                TaskManager.RunOnMainThread(() =>
                {
                    //GetThumbnail
                    var bytes = File.ReadAllBytes(imageFile);
                    Debug.Log($"Processing {bytes.Length}...");
                    var _texture = new Texture2D(2, 2);
                    _texture.LoadImage(bytes);
                    _texture.Apply();
                    dummytex = _texture;
                });
            }
            while (dummytex == null) { }
            if (dummytex) entryList[index].more.thumbnailRef = dummytex;
            entryList[index].more.thumbnailSpriteLoading = false;
            thumbnailing = false;
        }
        internal void GetAudio(int index)
        {
            entryList[index].editor.pbPercentage = 0f;
            var title = entryList[index].title;
            Regex rgx = new Regex("[^a-zA-Z0-9 -]");
            title = rgx.Replace(title, "");
            title = title.Replace(' ', '-');
            title = title.ToLower();
            var audioclipFile = $"{Referances.YOUTUBEDL_TMP}/{title}.mp3".Replace("/", "\\");
            entryList[index].more.audioclipRef = null;
            Debug.Log($"Creating AudioClip: {audioclipFile}");
            if (!File.Exists(audioclipFile))
            {
                var processInfo = new ProcessStartInfo($"\"{Referances.YOUTUBEDL_EXE}\"", $"--rm-cache-dir -o \"{Referances.YOUTUBEDL_TMP.Replace("/", "\\")}\\{title}.%(ext)s\" --ffmpeg-location \"{Referances.YOUTUBEDL_FFMPEG}\" -x --audio-format mp3 {entryList[index].more.webpage_url}");
                processInfo.CreateNoWindow = true;
                processInfo.UseShellExecute = false;
                processInfo.RedirectStandardError = true;
                processInfo.RedirectStandardOutput = true;
                var process = new Process();
                process.StartInfo = processInfo;
                process.OutputDataReceived += (object sender, DataReceivedEventArgs e) =>
                {
                    if (e.Data.Contains("ETA"))
                    {
                        var sb = new StringBuilder();
                        var parts = e.Data.Split(new[] { " " }, StringSplitOptions.RemoveEmptyEntries).ToList();
                        foreach (var part in parts) sb.AppendLine(part);
                        entryList[index].editor.pbPercentage = float.Parse(parts[1].Replace("%", string.Empty)) / 100f;
                        entryList[index].editor.progresstext = $"[ {entryList[index].editor.pbPercentage * 100}% of 100% ][ {parts[3]} at {parts[5]} ][ {parts[6]} {parts[7]} ]";
                    }
                    else if (e.Data.StartsWith("[ffmpeg]"))
                    {
                        var _clipFile = e.Data.Split(new[] { "n:" }, StringSplitOptions.RemoveEmptyEntries)[1];
                        if (_clipFile == audioclipFile) Debug.Log("File Match");
                        process.Close();
                        return;
                    }
                };
                process.ErrorDataReceived += (object sender, DataReceivedEventArgs e) =>
                {
                    OnOutput(e, OutputType.Error);
                    entryList.ForEach(x => TaskManager.RunOnMainThread(() => ClosePreview(entryList.IndexOf(x))));
                };
                process.Start();
                process.BeginOutputReadLine();
                process.BeginErrorReadLine();
                process.WaitForExit();
                entryList[index].editor.previewing = true;
                process.Close();
            }
            if (File.Exists(audioclipFile))
            {
                Debug.Log("Loading audio...");
                var bytes = File.ReadAllBytes(audioclipFile);
                Debug.Log($"Processing {bytes.Length}...");
                TaskManager.RunOnMainThread(() =>
                {
                    DestroyImmediate(entryList[index].more.audioclipRef);
                    DestroyImmediate(audioClipEditor);

                    WWW audioLoader = new WWW(audioclipFile);
                    var _clip = audioLoader.GetAudioClip();
                    entryList[index].more.audioclipRef = _clip;
                });
            }
            while (entryList[index].more.audioclipRef == null) { }
            entryList[index].editor.previewing = true;
            entryList[index].editor.pbPercentage = 0f;
        }
        internal void Use(int index)
        {
            var title = entryList[index].more.title;
            Regex rgx = new Regex("[^a-zA-Z0-9 -]");
            title = rgx.Replace(title, "");
            title = title.Replace(' ', '-');
            title = title.ToLower();
            var from = $"{Referances.YOUTUBEDL_TMP}\\{title}.png";
            var to = $"{Referances.YOUTUBEDL_IMG}\\{title}.png";
            if (File.Exists(to)) File.Delete(to);
            File.Copy(from, to);
            TaskManager.RunOnMainThread(() =>
            {
                AssetDatabase.Refresh();
                var app = new AssetPostprocessor();
                app.assetPath = $"Assets{Referances.YOUTUBEDL_IMG.Split(new[] { "Assets" }, StringSplitOptions.RemoveEmptyEntries)[1].Replace("\\", "/")}/{title}.png";
                TextureImporter importer = (TextureImporter)app.assetImporter;
                importer.textureType = TextureImporterType.Sprite;
                importer.textureShape = TextureImporterShape.Texture2D;
                importer.spriteImportMode = SpriteImportMode.Single;
                importer.maxTextureSize = 2048;
                importer.npotScale = TextureImporterNPOTScale.None;
                importer.mipmapEnabled = false;
                importer.isReadable = true;
                importer.alphaIsTransparency = true;
                importer.SaveAndReimport();
                AssetDatabase.Refresh();
                entryList[index].more.thumbnailRef = Resources.Load<Sprite>($"SongLibrary/{title}").texture;
                var entries = parent.songEntries;
                entryList[index].more.webpage_url = entryList[index].more.webpage_url.Replace("www.", string.Empty);
                entryList[index].more.webpage_url = entryList[index].more.webpage_url.Replace("youtube.com", "youtu.be");
                entryList[index].more.webpage_url = entryList[index].more.webpage_url.Replace("watch?v=", string.Empty);
                if (entries.Find(x => x.link == entryList[index].more.webpage_url) != null)
                {
                    var _entry = entries.Find(x => x.link == entryList[index].more.webpage_url);
                    if (EditorUtility.DisplayDialog("OPM", "Playlist already contains entry, would you like to update it?", "Update", "Cancel"))
                    {
                        var imagePath = $"{AssetDatabase.GetAssetPath(entryList[index].more.thumbnailRef)}";
                        entries[entries.IndexOf(_entry)].link = entryList[index].more.webpage_url;
                        entries[entries.IndexOf(_entry)].desc = entryList[index].more.title;
                        entries[entries.IndexOf(_entry)].imageurl = imagePath;
                    }
                }
                else
                {
                    var _entry = new SongEntry();
                    _entry.link = entryList[index].more.webpage_url;
                    _entry.desc = entryList[index].more.title;
                    var imagePath = $"{AssetDatabase.GetAssetPath(entryList[index].more.thumbnailRef)}";
                    _entry.imageurl = imagePath;
                    entries.Add(_entry);
                }
                parent.songEntries = entries;
                parent.SaveUpdate();
                parent.Refresh();
            });
        }
        private void OnOutput(DataReceivedEventArgs e, OutputType type)
        {
            switch (type)
            {
                case OutputType.Output:
                    if (!string.IsNullOrEmpty(e.Data)) { }
                    break;
                case OutputType.Error:
                    if (!string.IsNullOrEmpty(e.Data))
                    {
                        Debug.LogError($"{type} >> {e.Data}");
                    }
                    break;
            }
        }
        private void Clean()
        {
            entryList.ForEach(x => ClosePreview(entryList.IndexOf(x)));
            entryList.ForEach(x => x.expanded = false);
            entryList.ForEach(x => x.more = null);
            entryList.ForEach(x => x.editor = null);
            entryList = new List<YtResultsEntry>();
            searching = false;
            thumbnailEditor = null;
            audioClipEditor = null;
        }
    }
}
