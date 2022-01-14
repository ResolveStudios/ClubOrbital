using System.IO;
using UnityEngine;

namespace Okashi.PlaylistManager.Editors
{
    public static class Referances
    {
        public static string TOOLS { get; private set; }
        public static string YOUTUBEDL_EXE_NAME { get; private set; }
        public static string YOUTUBEDL_EXE { get; private set; }
        public static string YOUTUBEDL_FFMPEG { get; private set; }
        public static string YOUTUBEDL_FFMPEG_NAME { get; private set; }
        public static string OKPROCESSOR_EXE_NAME { get; private set; }
        public static string OKPROCESSOR_EXE { get; private set; }
        public static string YOUTUBEDL_TMP { get; private set; }
        public static string YOUTUBEDL_IMG { get; private set; }

        public static void Init()
        {
            YOUTUBEDL_EXE_NAME = "youtube-dl.exe";
            YOUTUBEDL_FFMPEG_NAME = "ffmpeg.exe";
            OKPROCESSOR_EXE_NAME = "okprocessor.exe";

            TOOLS = $"{new DirectoryInfo(Application.dataPath).Parent.FullName}\\YoutubeDLTools".Replace("/", "\\");
            YOUTUBEDL_EXE = $"{TOOLS}/{YOUTUBEDL_EXE_NAME}".Replace("/", "\\");
            YOUTUBEDL_FFMPEG = $"{TOOLS}\\{YOUTUBEDL_FFMPEG_NAME}".Replace("/", "\\");
            YOUTUBEDL_TMP = $"{TOOLS}\\temp";
            YOUTUBEDL_IMG = Application.dataPath + $"/Resources/SongLibrary".Replace("/", "\\");
            OKPROCESSOR_EXE = $"{TOOLS}/{OKPROCESSOR_EXE_NAME}".Replace("/", "\\");

            Directory.CreateDirectory(YOUTUBEDL_TMP);
        }
        internal static string ChangeExtention(string source, string ext)
        {
            source = source.Split('.')[0];
            return $"{source}.{ext.Replace(".", string.Empty)}";
        }
    }
}