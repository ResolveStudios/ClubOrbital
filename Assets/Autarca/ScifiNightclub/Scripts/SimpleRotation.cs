using System.Collections;
using System.Collections.Generic;
using UdonSharp;
using UnityEngine;

namespace Autarca
{
    public class SimpleRotation : UdonSharpBehaviour
    {
        public Vector3 rotation;

        private Transform _transform;

        private void Start()
        {
            _transform = transform;
        }

        public override void PostLateUpdate()
        {
            _transform.Rotate(rotation * Time.deltaTime);
        }
    }
}