
using Okashi.Permissions;
using System;
using TMPro;
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;
using VRC.Udon.Common.Interfaces;

public class Door : UdonSharpBehaviour
{
    public Animator animator;
    public string boolValue;
    public bool useGlobal = true;

    public GameObject lockedRef;
    private float openTime;
    
    public bool isOpened;
    [UdonSynced] public bool isGlobalOpened;
    public float maxOpenTime = 5;
    [Space]
    public Transform dropOffPoint;
    public bool tpOnOpen;
    public Door tpLocation;
    [Space]
    public PermissionManager permMgr;
    public int displayIndex;
    public SpriteRenderer roleSprite;
    public TextMeshPro roleName;
    private string ColorName = "_EmissionColor1";
    public bool isUnlocked = false;
    [Space]
    public DoorRequestManager requestManager;

    #region Permission Codes
    private int Continue = 100;
    private int Switching_Protocols = 101;
    private int Early_Hints = 103;
    private int OK = 200;
    private int Created = 201;
    private int Accepted = 202;
    private int Non_Authoritative_Information = 203;
    private int No_Content = 204;
    private int Reset_Content = 205;
    private int Partial_Content = 206;
    private int Multiple_Choices = 300;
    private int Moved_Permanently = 301;
    private int Found = 302;
    private int See_Other = 303;
    private int Not_Modified = 304;
    private int Temporary_Redirect = 307;
    private int Permanent_Redirect = 308;
    private int Bad_Request = 400;
    private int Unauthorized = 401;
    private int Payment_Required = 402;
    private int Forbidden = 403;
    private int Not_Found = 404;
    private int Method_Not_Allowed = 405;
    private int Not_Acceptable = 406;
    private int Proxy_Authentication_Required = 407;
    private int Request_Timeout = 408;
    private int Conflict = 409;
    private int Gone = 410;
    private int Length_Required = 411;
    private int Precondition_Failed = 412;
    private int Payload_Too_Large = 413;
    private int URI_Too_Long = 414;
    private int Unsupported_Media_Type = 415;
    private int Range_Not_Satisfiable = 416;
    private int Expectation_Failed = 417;
    private int Im_a_teapot = 418;
    private int Unprocessable_Entity = 422;
    private int Too_Early = 425;
    private int Upgrade_Required = 426;
    private int Precondition_Required = 428;
    private int Too_Many_Requests = 429;
    private int Request_Header_Fields_Too_Large = 431;
    private int Unavailable_For_Legal_Reasons = 451;
    private int Internal_Server_Error = 500;
    private int Not_Implemented = 501;
    private int Bad_Gateway = 502;
    private int Service_Unavailable = 503;
    private int Gateway_Timeout = 504;
    private int HTTP_Version_Not_Supported = 505;
    private int Variant_Also_Negotiates = 506;
    private int Insufficient_Storage = 507;
    private int Loop_Detected = 508;
    private int Not_Extended = 510;
    private int Network_Authentication_Required = 511;
    #endregion


    private void Start()
    {
        if (!permMgr)
        {
            var pmgo = GameObject.Find("PermissionManager");
            permMgr = pmgo.GetComponent<PermissionManager>();
        }
        if (roleSprite) roleSprite.gameObject.SetActive(permMgr);
        if (permMgr)
        {
            if (roleSprite)
            {
                roleSprite.sprite = permMgr.roles[displayIndex].permIcon;
                roleSprite.material.SetColor(ColorName, permMgr.roles[displayIndex].permColor);
            }
            if (roleName)
                roleName.text = permMgr.roles[displayIndex].PrettyName();
        }
    }

    public void  Update()
    {
        if(openTime > 0)
        {
            openTime -= 1 * Time.deltaTime;
            if (openTime <= 0) CloseDoor();

        }
        if (!tpOnOpen)
            animator.SetBool(boolValue, (isGlobalOpened || isOpened) && isLocked() == Accepted);
    }

    public void OpenDoor()
    {
        if (isLocked() == Unauthorized)
        {
            
            LogOut("Unauthorized, Request has been sent to Staff");
            Networking.SetOwner(Networking.LocalPlayer, tpLocation.requestManager.gameObject);
            tpLocation.requestManager.want_playername = Networking.LocalPlayer.displayName;
            tpLocation.requestManager.SendCustomNetworkEvent(NetworkEventTarget.All, "Show");
            requestManager.ShowWithMessage("Unauthorized, Request has been sent to Staff Room.\n\nPlease wait...");
            return;
        }
        if(isLocked() == Forbidden)
        { 
            LogOut("Access Forbidden");
            return;
        } 


        if (useGlobal)
        {
            isGlobalOpened = true;
            if (tpOnOpen && tpLocation != null)
                TPPlayer(Networking.GetOwner(gameObject), tpLocation.dropOffPoint.position);
        }
        else
        {
            isOpened = true;
            if (tpOnOpen && tpLocation != null)
                TPPlayer(Networking.LocalPlayer, tpLocation.dropOffPoint.position);
        }
        openTime = tpOnOpen ? 0.5f : maxOpenTime;
    }

    private void LogOut(string value)
    {
        var prefix = "Airlock Door";
        Debug.Log($"[{prefix.ToUpper()}] {value}");
    }

    private void CloseDoor()
    {
        if (useGlobal)
        {
            Networking.SetOwner(Networking.LocalPlayer, gameObject);
            isGlobalOpened = false;
        }
        else
        {
            isOpened = false;
        }
    }

    public int isLocked()
    {
        if (isUnlocked) return Accepted;
        if (lockedRef != null && !lockedRef.activeSelf) return Accepted;
        return Forbidden;
    }

    public void TPPlayer(VRCPlayerApi player, Vector3 position) => player.TeleportTo(position, Quaternion.identity);
}
