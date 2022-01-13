using UnityEngine;
using VRC.SDKBase;
using System;

namespace VRCAudioLink
{
    #if UDON
    using UdonSharp;
    using VRC.Udon;

    public class AudioReactiveMaterial : UdonSharpBehaviour
    {
        public AudioLink audioLink;
        public int band;
        [Range(0, 127)]
        public int delay;
        public bool affectIntensity = true;
        public float intensityMultiplier = 1f;
        public float hueShift;

        [SerializeField] private MeshRenderer _renderer;
        [SerializeField] private int _materialIndex;
        [SerializeField] private string _colorProperty = "_EmissionColor";
        [SerializeField] private string _colorIntensityProperty = "_EmissionStrength";
        private int _dataIndex;
        private Color _initialColor;

        void Start()
        {
            if (!_renderer) return;
            _initialColor = _renderer.materials[_materialIndex].GetColor(_colorProperty);
            _dataIndex = (band * 128) + delay;
        }

        void Update()
        {
            if (!_renderer) return;
            Color[] audioData = (Color[])audioLink.GetProgramVariable("audioData");
            if(audioData.Length != 0)       // check for audioLink initialization
            {
                float amplitude = audioData[_dataIndex].grayscale;
                if (affectIntensity) _renderer.materials[_materialIndex].SetFloat(_colorIntensityProperty, amplitude * intensityMultiplier);
                _renderer.materials[_materialIndex].SetColor(_colorProperty, HueShift(_initialColor, amplitude * hueShift));
            }
        }

        private Color HueShift(Color color, float hueShiftAmount)
        {
            float h, s, v;
            Color.RGBToHSV(color, out h, out s, out v);
            h += hueShiftAmount;
            return Color.HSVToRGB(h, s, v);
        }
    }
#else
    public class AudioReactiveLight : MonoBehaviour
    {
    }
#endif
}