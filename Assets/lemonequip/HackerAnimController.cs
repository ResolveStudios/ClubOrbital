
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

public class HackerAnimController : UdonSharpBehaviour
{
    public Animator[] anims;
    [SerializeField] private float time;
    [SerializeField] private float maxtime = 5f;
    [SerializeField] private float time2;
    [SerializeField] private Animator erroranim;

    public override void PostLateUpdate()
    {
        time += Time.deltaTime;
        if(time >= maxtime)
        {
            time = 0;
            bool haserror = false;
            foreach (var _anim in anims)
                if (_anim.GetBool("Warning")) 
                    haserror = true;
            maxtime = Random.Range(1, haserror ? 5 : 20);
            var anim = anims[Random.Range(0, anims.Length)];
            anim.SetBool("Warning", !anim.GetBool("Warning"));
            if (anim.GetBool("Warning"))
            {
                time2 = 0;
                erroranim = anim;
            }
        }

        if (erroranim)
        {
            time2 += Time.deltaTime;
            if (time2 >= 2f)
            {
                erroranim.SetBool("Warning", false);
                time2 = 0;
                erroranim = null;
            }
        }

        foreach (var anim in anims)
            anim.SetFloat("Speed", Random.Range(0f, 0.3f));
    }

}
