using UnityEditor;
using UnityEngine;

[CustomEditor(typeof(SchemaParser))]
public class SchemaParserEditor : Editor
{

    public override void OnInspectorGUI() {

        DrawDefaultInspector();
        SchemaParser parser = (SchemaParser) target;

        if (GUILayout.Button("Update")) {
            parser.ReadFile();
        }

    }   

}
