
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

public class LurasSwitch : UdonSharpBehaviour
{
    [Header("------------------------------------------------------------------")]
    [Header("■■■　機能切り替えスライダー／Function switching slider　■■■")]
    [Header("------------------------------------------------------------------")]
    [Header("[0]トグルスイッチ／ToggleSwitch")]
    [Header("[1] シーケンススイッチ／Sequence switch")]

    [Space(20)]

    [Range(0, 1)] public int switchID;

    [Space(10)]

    [SerializeField] private bool isGlobal = false;

    [Space(10)]

    [Header("------------------------------------------------------------------")]

    [Header("ターゲットオブジェクトのsizeに数を入れて切り替えたいオブジェクトをドラッグ＆ドロップ")]
    [Header("Enter a number in size and drag and drop the object you want to switch")]

    [Space(10)]

    [SerializeField] private GameObject[] targetObject;



    private bool isMaster = false;
    private bool isFirstTimeJoin = true;

    private int activeObjectIndex = 0;



    void Start()
    {
        if (Networking.IsMaster)
        {
            isMaster = true;
        }

        switch (switchID)
        {
            case 0:
                break;


            case 1:
                SwitchActiveObject();
                break;
        }

    }

    public override void Interact()
    {
        switch (switchID)
        {
            case 0:
                //  SwitchType -ToggleObject-

                if (!isGlobal)
                {
                    //Local
                    ToggleObjectLocal();    //ObjectIndexのオンオフを反転させる
                }
                if (isGlobal)
                {
                    //Global
                    SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "ToggleObjectLocal");  //ObjectIndexのオンオフを反転させるのを全員に送信
                }
                break;






            case 1:
                //  SwitchType -SwitchSequenceObjectLocal-

                if (!isGlobal)
                {
                    //Local
                    NextObjectIndex();  //次のObjectIndexに切り替える
                }
                else
                {
                    //Global
                    SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "NextObjectIndex");    //次のObjectIndexに切り替えるのを全員に送信
                }
                break;


        }
    }


    public override void OnPlayerJoined(VRCPlayerApi player)
    {
        switch (switchID)
        {
            case 0:     //  SwitchType -ToggleObject-
                if (isGlobal)
                {
                    if (isMaster)
                    {
                        CheckAllActiveToggle();
                    }
                }

                break;



            case 1:     //SwitchType -SwitchSequenceObject
                if (isGlobal)
                {
                    if (isMaster)   //Masterが全員にオブジェクトの表示状況を送信
                    {
                        CheckAllActiveIndex();
                    }
                }

                break;

        }
    }


    public void ToggleObjectLocal()     //オブジェクトのアクティブを切り替え
    {
        for (int x = 0; x < targetObject.Length; x = x + 1)
        {
            if (targetObject[x] != null)     //配列内のNullチェック
            {
                targetObject[x].SetActive(!targetObject[x].activeSelf);     //現在の状態を確認してオブジェクトのアクティブを反転
            }
        }
    }


    private void SwitchActiveObject()    //activeObjectIndexをセットして反映させる
    {
        for (int x = 0; x < targetObject.Length; x = x + 1)
        {
            if (targetObject[x] != null)    //配列内のNullチェック
            {
                targetObject[x].SetActive(x == activeObjectIndex);      //番号に対応したオブジェクトをオンにする
            }
        }
    }


    private void AddActiveObjectIndex()  //activeObjectIndexに１を足す
    {
        activeObjectIndex = activeObjectIndex + 1;

        if (activeObjectIndex >= targetObject.Length)
        {
            activeObjectIndex = 0;
        }
    }



    public void NextObjectIndex()   //次のObjectIndexに切り替える
    {
        AddActiveObjectIndex();     //activeObjectIndexに１を足す
        SwitchActiveObject();       //activeObjectIndexをセットして反映させる
    }



    //SendCustomNetworkEventに引数を使えないので力技


    private void CheckAllActiveToggle()     //それぞれのtargetObjectがTrueの場合、全体にステータスを送信してTrueにさせる
    {
        if (targetObject.Length >= 1)
        {
            if (targetObject[0] != null)
            {
                if (targetObject[0].activeSelf)
                {
                    SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "ActiveSend0");
                }
                else
                {
                    SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend0");
                }

            }
        }
        if (targetObject.Length >= 2)
        {
            if (targetObject[1] != null)
            {
                if (targetObject[1].activeSelf)
                {
                    SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "ActiveSend1");
                }
                else
                {
                    SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend1");
                }
            }
        }
        if (targetObject.Length >= 3)
        {
            if (targetObject[2] != null)
            {
                if (targetObject[2].activeSelf)
                {
                    SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "ActiveSend2");
                }
                else
                {
                    SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend2");
                }

            }
        }
        if (targetObject.Length >= 4)
        {
            if (targetObject[3] != null)
            {
                if (targetObject[3].activeSelf)
                {
                    SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "ActiveSend3");
                }
                else
                {
                    SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend3");
                }
            }
        }
        if (targetObject.Length >= 5)
        {
            if (targetObject[4] != null)
            {
                if (targetObject[4].activeSelf)
                {
                    SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "ActiveSend4");
                }
                else
                {
                    SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend4");
                }
            }

        }
        if (targetObject.Length >= 6)
        {
            if (targetObject[5] != null)
            {
                if (targetObject[5].activeSelf)
                {
                    SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "ActiveSend5");
                }
                else
                {
                    SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend5");
                }
            }
        }
        if (targetObject.Length >= 7)
        {
            if (targetObject[6] != null)
            {
                if (targetObject[6].activeSelf)
                {
                    SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "ActiveSend6");
                }
                else
                {
                    SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend6");
                }

            }
        }
        if (targetObject.Length >= 8)
        {
            if (targetObject[7] != null)
            {
                if (targetObject[7].activeSelf)
                {
                    SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "ActiveSend7");
                }
                else
                {
                    SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend7");
                }

            }
        }
        if (targetObject.Length >= 9)
        {
            if (targetObject[8] != null)
            {
                if (targetObject[8].activeSelf)
                {
                    SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "ActiveSend8");
                }
                else
                {
                    SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend8");
                }

            }
        }
        if (targetObject.Length >= 10)
        {
            if (targetObject[9] != null)
            {
                if (targetObject[9].activeSelf)
                {
                    SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "ActiveSend9");
                }
                else
                {
                    SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend9");
                }

            }
        }



    }

    private void CheckAllActiveIndex()
    {

        //0-9まで使用可能
        if (activeObjectIndex == 0)
        {
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "ActiveSend0");


            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend1");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend2");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend3");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend4");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend5");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend6");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend7");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend8");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend9");

        }

        if (activeObjectIndex == 1)
        {
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "ActiveSend1");


            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend0");

            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend2");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend3");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend4");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend5");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend6");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend7");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend8");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend9");

        }

        if (activeObjectIndex == 2)
        {
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "ActiveSend2");


            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend0");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend1");

            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend3");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend4");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend5");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend6");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend7");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend8");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend9");

        }

        if (activeObjectIndex == 3)
        {
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "ActiveSend3");


            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend0");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend1");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend2");

            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend4");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend5");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend6");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend7");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend8");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend9");

        }

        if (activeObjectIndex == 4)
        {
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "ActiveSend4");


            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend0");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend1");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend2");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend3");

            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend5");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend6");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend7");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend8");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend9");

        }

        if (activeObjectIndex == 5)
        {
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "ActiveSend5");


            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend0");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend1");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend2");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend3");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend4");

            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend6");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend7");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend8");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend9");

        }

        if (activeObjectIndex == 6)
        {
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "ActiveSend6");


            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend0");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend1");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend2");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend3");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend4");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend5");

            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend7");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend8");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend9");

        }

        if (activeObjectIndex == 7)
        {
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "ActiveSend7");


            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend0");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend1");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend2");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend3");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend4");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend5");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend6");

            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend8");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend9");

        }

        if (activeObjectIndex == 8)
        {
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "ActiveSend8");


            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend0");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend1");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend2");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend3");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend4");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend5");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend6");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend7");

            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend9");

        }

        if (activeObjectIndex == 9)
        {
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "ActiveSend9");


            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend0");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend1");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend2");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend3");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend4");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend5");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend6");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend7");
            SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "InActiveSend8");

        }


    }

    //index番号の送信&セット

    public void ActiveSend(int index)
    {
        if (targetObject.Length >= index + 1)
        {
            if (targetObject[index] != null)
            {
                targetObject[index].SetActive(true);
            }
        }
    }

    public void InActiveSend(int index)
    {
        if (targetObject.Length >= index + 1)
        {
            if (targetObject[index] != null)
            {
                targetObject[index].SetActive(false);
            }
        }
    }


    public void ActiveSend0()
    {
        ActiveSend(0);

        if (switchID == 0)
        {
            activeObjectIndex = 0;
        }
    }
    public void ActiveSend1()
    {
        ActiveSend(1);

        if (switchID == 1)
        {
            activeObjectIndex = 1;
        }
    }
    public void ActiveSend2()
    {
        ActiveSend(2);

        if (switchID == 1)
        {
            activeObjectIndex = 2;
        }
    }
    public void ActiveSend3()
    {
        ActiveSend(3);

        if (switchID == 1)
        {
            activeObjectIndex = 3;
        }
    }
    public void ActiveSend4()
    {
        ActiveSend(4);

        if (switchID == 1)
        {
            activeObjectIndex = 4;
        }
    }
    public void ActiveSend5()
    {
        ActiveSend(5);

        if (switchID == 1)
        {
            activeObjectIndex = 5;
        }
    }
    public void ActiveSend6()
    {
        ActiveSend(6);

        if (switchID == 1)
        {
            activeObjectIndex = 6;
        }
    }
    public void ActiveSend7()
    {
        ActiveSend(7);

        if (switchID == 1)
        {
            activeObjectIndex = 7;
        }
    }
    public void ActiveSend8()
    {
        ActiveSend(8);

        if (switchID == 1)
        {
            activeObjectIndex = 8;
        }
    }
    public void ActiveSend9()
    {
        ActiveSend(9);

        if (switchID == 1)
        {
            activeObjectIndex = 9;
        }
    }


    public void InActiveSend0()
    {
        InActiveSend(0);
    }
    public void InActiveSend1()
    {
        InActiveSend(1);
    }
    public void InActiveSend2()
    {
        InActiveSend(2);
    }
    public void InActiveSend3()
    {
        InActiveSend(3);
    }
    public void InActiveSend4()
    {
        InActiveSend(4);
    }
    public void InActiveSend5()
    {
        InActiveSend(5);
    }
    public void InActiveSend6()
    {
        InActiveSend(6);
    }
    public void InActiveSend7()
    {
        InActiveSend(7);
    }
    public void InActiveSend8()
    {
        InActiveSend(8);

    }
    public void InActiveSend9()
    {
        InActiveSend(9);
    }

}
