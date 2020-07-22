using UnityEditor;
using UnityEngine;

[CustomEditor(typeof(HandController))]
public class HandControllerEditor : Editor
{

    public override void OnInspectorGUI() {

        DrawDefaultInspector();
        HandController hand = (HandController) target;

        if (GUILayout.Button("Update")) {
            hand.Update();
        }

        if (GUILayout.Button("Reset")) {
            hand.Reset();
        }

    }   

}
