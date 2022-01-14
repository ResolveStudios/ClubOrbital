using Autarca;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

[CustomEditor(typeof(SimpleMovement))]
public class SimpleMovementEditor : Editor
{

    private SimpleMovement self
    {
        get
        {
            try
            {
                return (SimpleMovement)target;
            }
            catch
            {
                return (SimpleMovement)target;
            }
        }
    }
    public void OnSceneGUI()
    {
        Repaint();

        Handles.color = Color.blue;
        for (int w = 0; w < self.waypoints.Length; w++)
        {
            if (w > 0)
                Handles.DrawLine(self.waypoints[w - 1].position, self.waypoints[w].position);
        }
    }
}
