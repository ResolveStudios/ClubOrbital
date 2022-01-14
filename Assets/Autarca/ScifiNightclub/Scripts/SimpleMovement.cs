using System.Collections;
using System.Collections.Generic;
using UdonSharp;
using UnityEngine;

namespace Autarca
{
    public class SimpleMovement : UdonSharpBehaviour
    {
        public Transform[] waypoints;
        public float movementSpeed = 10f;
        public float rotationSpeed = 2f;
        public float minDistance = 0.1f;

        private Transform _transform;
        private int index;
        private Quaternion rdir;
        private Vector3 mdir;

        void Start()
        {
            _transform = transform;
        }

        void Update()
        {
            if (Vector3.Distance(_transform.position, waypoints[index].position) <= minDistance)
            {
                index++;
                if (index > waypoints.Length - 1) index = 0;
            }

            mdir = (waypoints[index].position - _transform.position).normalized;
            rdir = Quaternion.LookRotation(mdir);

            _transform.rotation = Quaternion.Slerp(_transform.rotation, rdir, rotationSpeed * Time.deltaTime);

            _transform.position += mdir * movementSpeed * Time.deltaTime;
        }
    }
}