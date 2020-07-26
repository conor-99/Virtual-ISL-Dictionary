using System.Collections.Generic;
using UnityEngine;

public class Middle : MonoBehaviour {
    
    private static Position resetPosition = Position.ExtensionAdduction;
    
    private static Dictionary<Joint, string> jointNames = new Dictionary<Joint, string>() {
        { Joint.Metacarpal, "Palm_02" },
        { Joint.Proximal, "Middle_01" },
        { Joint.Intermediate, "Middle_02" },
        { Joint.Distal, "Middle_03" }
    };

    private static Dictionary<Position, Dictionary<Joint, Vector3>> rotations = new Dictionary<Position, Dictionary<Joint, Vector3>>() {
        {
            Position.ExtensionAdduction, new Dictionary<Joint, Vector3>() {
                { Joint.Metacarpal, new Vector3(3.0f, 88.7f, -2.6f) },
                { Joint.Proximal, new Vector3(16.5f, 5.2f, 1.9f) },
                { Joint.Intermediate, new Vector3(-2.1f, -4.0f, 1.1f) },
                { Joint.Distal, new Vector3(3.5f, -2.6f, 2.6f) }
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
        ExtensionAdduction = 0
    }

    public enum Joint {
        Metacarpal,
        Proximal,
        Intermediate,
        Distal
    }

}
