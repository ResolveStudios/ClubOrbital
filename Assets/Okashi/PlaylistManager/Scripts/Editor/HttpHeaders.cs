using Unity.Plastic.Newtonsoft.Json;

namespace Okashi.PlaylistManager.Editors
{
    public class HttpHeaders
    {
        public string Accept;

        [JsonProperty("Accept-Language")]
        public string AcceptLanguage;

        [JsonProperty("User-Agent")]
        public string UserAgent;

        [JsonProperty("Accept-Charset")]
        public string AcceptCharset;

        [JsonProperty("Accept-Encoding")]
        public string AcceptEncoding;
    }
}