using UnityEditor;
using UnityEngine;

[CustomEditor(typeof(HandController))]
public class HandControllerEditor : Editor
{

    public override void OnInspectorGUI() {

        DrawDefaultInspector();
        HandController handController = (HandController) target;

        GUILayout.Space(5f);
        GUILayout.Label("Basic Control", EditorStyles.boldLabel);
        
        if (GUILayout.Button("Update"))
            handController.Update();

        if (GUILayout.Button("Reset"))
            handController.Reset();

        GUILayout.Label("Import and Export", EditorStyles.boldLabel);

        if (GUILayout.Button("Import Position")) {

            string filePath = EditorUtility.OpenFilePanel("Select a JSON file", "", "json");

            if (filePath.Length != 0)
                handController.ImportPosition(filePath);

        }

        if (GUILayout.Button("Export Position")) {
            // To-do
        }

    }   

}
