
using TMPro;
using UdonSharp;
using UnityEngine;
using UnityEngine.UI;
using VRC.SDKBase;
using VRC.Udon;

public class ImageCaracelEntry : UdonSharpBehaviour
{
    public void SetSprite(Sprite sprite)
    {
        var commingSoon = transform.Find("CommingSoon").gameObject;
        var image = transform.Find("Image").GetComponent<Image>();

        if (image)
            image.sprite = sprite;
        if (commingSoon)
            commingSoon.SetActive(!sprite);
    }
    public void SetTopLabel(string value)
    {
        var topLabel = transform.Find("TopLable").GetComponent<TextMeshProUGUI>();
        if (topLabel)
            topLabel.text = value;
    }
    public void SetBottomLabel(string value)
    {
        var topLabel = transform.Find("BottomLable").GetComponent<TextMeshProUGUI>();
        if (topLabel)
            topLabel.text = value;
    }
    public void SetSideLabel(string value)
    {
        var sideLabel = transform.Find("VerticleLabel").GetComponent<TextMeshProUGUI>();
        if (sideLabel)
            sideLabel.text = value;
    }
}
