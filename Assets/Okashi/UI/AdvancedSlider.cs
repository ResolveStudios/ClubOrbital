
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;
using TMPro;
using UnityEngine.UI;
using System;

namespace Okashi.UI
{
    public class AdvancedSlider : UdonSharpBehaviour
    {
        [SerializeField] private string _name;
        [UdonSynced, SerializeField] private float _value;
        [SerializeField] private float _minValue = 0f;
        [SerializeField] private float _maxValue = 1f;
        [SerializeField] private float _multiplier = 1;
        [Space(20)]
        [SerializeField] private TextMeshProUGUI nameLabel;
        [SerializeField] private Slider slider;
        [SerializeField] private InputField inputField;
        private float _oldValue;


        private void Start()
        {
            slider.minValue = _minValue;
            slider.maxValue = _maxValue;
            nameLabel.text = _name;
            ReInit();
        }


        private void ReInit()
        {
            slider.value = _value;
            inputField.text = ((_value / _maxValue ) * _multiplier).ToString("n1");
            _value = slider.value;

            _oldValue = _value;
           
        }

        public void OnSliderValueChanged()
        {
            Networking.SetOwner(Networking.LocalPlayer, gameObject);
            _value = slider.value;
            ReInit();
        }
        public void OnInputFieldValueChanged()
        {
            Networking.SetOwner(Networking.LocalPlayer, gameObject);
            float val = 0;
            if (float.TryParse(inputField.text, out val))
                _value = val / _multiplier;
            ReInit();
        }

        public float GetValue() { return (_value / _maxValue) * _multiplier; }

    }
}