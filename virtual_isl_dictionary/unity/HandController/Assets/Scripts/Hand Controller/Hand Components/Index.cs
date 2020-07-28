using System.Collections.Generic;
using UnityEngine;

public class Index : MonoBehaviour {
    
    private static Position resetPosition = Position.ExtensionAdduction;
    
    /*
        In this 3D model both the index finger and thumb share the same metacarpal joint.
        The thumb's metacarpal positioning will override that of the index finger.
    */
    private static Dictionary<Joint, string> jointNames = new Dictionary<Joint, string>() {
        { Joint.Metacarpal, "Palm_01" },
        { Joint.Proximal, "Index_01" },
        { Joint.Intermediate, "Index_02" },
        { Joint.Distal, "Index_03" }
    };

    private static Dictionary<Position, Dictionary<Joint, Vector3>> rotations = new Dictionary<Position, Dictionary<Joint, Vector3>>() {
        {
            Position.ExtensionAdduction, new Dictionary<Joint, Vector3>() {
                { Joint.Metacarpal, new Vector3(3.1f, 90.2f, 6.2f) },
                { Joint.Proximal, new Vector3(17.6f, 4.0f, 0.6f) },
                { Joint.Intermediate, new Vector3(-1.7f, -1.6f, -0.8f) },
                { Joint.Distal, new Vector3(3.3f, -2.2f, -2.7f) }
            }
        },
        {
            Position.FlexionFull, new Dictionary<Joint, Vector3>() {
                { Joint.Metacarpal, new Vector3(16.6f, 97.3f, 4.9f) },
                { Joint.Proximal, new Vector3(69.4f, 1.5f, 0.6f) },
                { Joint.Intermediate, new Vector3(111.4f, -1.6f, -0.8f) },
                { Joint.Distal, new Vector3(53.2f, -2.2f, -2.7f) }
            }
        }
    };

    public static string GetJointName(Joint joint) {
        return jointNames[joint];
    }

    public static Vector3 GetJointRotationInPosition(Position position, Joint joint) {
        return rotations[position][joint];
    }

    public static Position GetResetPosition() {
        return resetPosition;
    }

    public enum Position {
        ExtensionAdduction = 0,
        FlexionFull = 1
    }

    public enum Joint {
        Metacarpal,
        Proximal,
        Intermediate,
        Distal
    }

}
