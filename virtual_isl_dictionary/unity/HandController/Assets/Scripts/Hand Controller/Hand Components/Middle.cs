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
        },
        {
            Position.FlexionFull, new Dictionary<Joint, Vector3>() {
                { Joint.Metacarpal, new Vector3(21.4f, 91.1f, -2.6f) },
                { Joint.Proximal, new Vector3(64.7f, 5.2f, 1.9f) },
                { Joint.Intermediate, new Vector3(104.0f, -4.0f, 1.1f) },
                { Joint.Distal, new Vector3(69.7f, -2.6f, 2.6f) }
            }
        },
        {
            Position.Fist, new Dictionary<Joint, Vector3>() {
                { Joint.Metacarpal, new Vector3(14.9f, 91.1f, -2.6f) },
                { Joint.Proximal, new Vector3(98.2f, 5.2f, 3.2f) },
                { Joint.Intermediate, new Vector3(111.0f, -4.0f, -3.38f) },
                { Joint.Distal, new Vector3(79.6f, -2.6f, 2.6f) }
            }
        },
        {
            Position.TempB, new Dictionary<Joint, Vector3>() {
                { Joint.Metacarpal, new Vector3(3.0f, 88.7f, -2.6f) },
                { Joint.Proximal, new Vector3(16.5f, 5.2f, 10.2f) },
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
        ExtensionAdduction = 0,
        FlexionFull = 1,
        Fist = 2,
        TempB = 3
    }

    public enum Joint {
        Metacarpal,
        Proximal,
        Intermediate,
        Distal
    }

}
