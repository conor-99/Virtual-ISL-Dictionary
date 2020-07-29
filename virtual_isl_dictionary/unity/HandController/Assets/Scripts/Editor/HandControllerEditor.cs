using UnityEditor;
using UnityEngine;

[CustomEditor(typeof(HandController))]
public class HandControllerEditor : Editor {

    public override void OnInspectorGUI() {

        DrawDefaultInspector();
        HandController handController = (HandController) target;
        
        if (GUILayout.Button("Play"))
            handController.Play();
        
        GUILayout.Space(5f);
        GUILayout.Label("Basic Model Control", EditorStyles.boldLabel);
        
        if (GUILayout.Button("Update Model"))
            handController.UpdateModel();

        if (GUILayout.Button("Reset Model"))
            handController.ResetModel();

        GUILayout.Space(5f);
        GUILayout.Label("Keyframe Control", EditorStyles.boldLabel);
        
        if (GUILayout.Button("Next Keyframe"))
            handController.NextKeyframe();
        
        if (GUILayout.Button("Previous Keyframe"))
            handController.PreviousKeyframe();

        GUILayout.Space(5f);
        GUILayout.Label("Import and Export Gestures", EditorStyles.boldLabel);

        if (GUILayout.Button("Import Gesture")) {

            string filePath = EditorUtility.OpenFilePanel("Select a JSON file", "", "json");

            if (filePath.Length != 0)
                handController.ImportGesture(filePath);

        }

        if (GUILayout.Button("Export Gesture")) {
            // To-do
        }

    }   

}
