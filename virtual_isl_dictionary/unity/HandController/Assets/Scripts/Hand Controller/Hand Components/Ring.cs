using System.Collections.Generic;
using UnityEngine;

public class Ring : MonoBehaviour {
    
    private static Position resetPosition = Position.ExtensionAdduction;
    
    private static Dictionary<Joint, string> jointNames = new Dictionary<Joint, string>() {
        { Joint.Metacarpal, "Palm_03" },
        { Joint.Proximal, "Ring_01" },
        { Joint.Intermediate, "Ring_02" },
        { Joint.Distal, "Ring_03" }
    };

    private static Dictionary<Position, Dictionary<Joint, Vector3>> rotations = new Dictionary<Position, Dictionary<Joint, Vector3>>() {
        {
            Position.ExtensionAdduction, new Dictionary<Joint, Vector3>() {
                { Joint.Metacarpal, new Vector3(4.0f, 87.0f, -6.4f) },
                { Joint.Proximal, new Vector3(13.1f, 1.4f, -0.8f) },
                { Joint.Intermediate, new Vector3(2.5f, -2.5f, 2.4f) },
                { Joint.Distal, new Vector3(2.3f, -9.9f, 3.4f) }
            }
        },
        {
            Position.FlexionFull, new Dictionary<Joint, Vector3>() {
                { Joint.Metacarpal, new Vector3(20.3f, 87.0f, -6.4f) },
                { Joint.Proximal, new Vector3(64.8f, 1.4f, -0.8f) },
                { Joint.Intermediate, new Vector3(82.6f, -2.5f, 2.4f) },
                { Joint.Distal, new Vector3(92.0f, 0.3f, 3.4f) }
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
