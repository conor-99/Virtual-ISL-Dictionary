using System.Collections.Generic;
using UnityEngine;

public class Pinky : MonoBehaviour {
    
    private static Position resetPosition = Position.ExtensionAdduction;
    
    private static Dictionary<Joint, string> jointNames = new Dictionary<Joint, string>() {
        { Joint.Metacarpal, "Palm_04" },
        { Joint.Proximal, "Pinky_01" },
        { Joint.Intermediate, "Pinky_02" },
        { Joint.Distal, "Pinky_03" }
    };

    private static Dictionary<Position, Dictionary<Joint, Vector3>> rotations = new Dictionary<Position, Dictionary<Joint, Vector3>>() {
        {
            Position.ExtensionAdduction, new Dictionary<Joint, Vector3>() {
                { Joint.Metacarpal, new Vector3(5.3f, 88.5f, -12.6f) },
                { Joint.Proximal, new Vector3(10.8f, -3.3f, -1.0f) },
                { Joint.Intermediate, new Vector3(0.0f, 0.0f, 0.0f) },
                { Joint.Distal, new Vector3(0.0f, 0.0f, 0.0f) }
            }
        },
        {
            Position.ExtensionAbduction, new Dictionary<Joint, Vector3>() {
                { Joint.Metacarpal, new Vector3(5.3f, 96.2f, -14.52f) },
                { Joint.Proximal, new Vector3(10.8f, -3.3f, -3.3f) },
                { Joint.Intermediate, new Vector3(0.0f, 0.0f, 0.0f) },
                { Joint.Distal, new Vector3(0.0f, 0.0f, 0.0f) }
            }
        },
        {
            Position.FlexionFull, new Dictionary<Joint, Vector3>() {
                { Joint.Metacarpal, new Vector3(18.9f, 88.5f, -12.6f) },
                { Joint.Proximal, new Vector3(62.3f, -12.6f, -1.0f) },
                { Joint.Intermediate, new Vector3(107.5f, 0.0f, 0.0f) },
                { Joint.Distal, new Vector3(66.0f, 0.0f, 0.0f) }
            }
        },
        {
            Position.FlexionFullPartial, new Dictionary<Joint, Vector3>() {
                { Joint.Metacarpal, new Vector3(7.0f, 88.5f, -12.6f) },
                { Joint.Proximal, new Vector3(31.3f, -12.6f, -1.0f) },
                { Joint.Intermediate, new Vector3(92.3f, 0.0f, 0.0f) },
                { Joint.Distal, new Vector3(51.7f, 0.0f, 0.0f) }
            }
        },
        {
            Position.FlexionCarpals, new Dictionary<Joint, Vector3>() {
                { Joint.Metacarpal, new Vector3(5.3f, 88.5f, -12.6f) },
                { Joint.Proximal, new Vector3(39.1f, -3.3f, -1.0f) },
                { Joint.Intermediate, new Vector3(0.0f, 0.0f, 0.0f) },
                { Joint.Distal, new Vector3(0.0f, 0.0f, 0.0f) }
            }
        },
        {
            Position.FlexionPhalanges, new Dictionary<Joint, Vector3>() {
                { Joint.Metacarpal, new Vector3(7.0f, 88.5f, -12.6f) },
                { Joint.Proximal, new Vector3(24.6f, -9.6f, -1.0f) },
                { Joint.Intermediate, new Vector3(39.1f, 0.0f, 0.0f) },
                { Joint.Distal, new Vector3(20.5f, 0.0f, 0.0f) }
            }
        },
        {
            Position.Opposition, new Dictionary<Joint, Vector3>() {
                { Joint.Metacarpal, new Vector3(11.1f, 76.7f, -12.6f) },
                { Joint.Proximal, new Vector3(25.3f, -16.9f, -1.0f) },
                { Joint.Intermediate, new Vector3(43.2f, -4.9f, 0.0f) },
                { Joint.Distal, new Vector3(58.1f, 0.0f, 0.0f) }
            }
        },
        {
            Position.Fist, new Dictionary<Joint, Vector3>() {
                { Joint.Metacarpal, new Vector3(12.9f, 93.8f, -12.6f) },
                { Joint.Proximal, new Vector3(104.0f, -12.6f, -1.0f) },
                { Joint.Intermediate, new Vector3(105.1f, 0.0f, 0.0f) },
                { Joint.Distal, new Vector3(71.4f, 0.0f, 0.0f) }
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
        ExtensionAbduction = 1,
        FlexionFull = 2,
        FlexionFullPartial = 3,
        FlexionPhalanges = 4,
        FlexionCarpals = 5,
        Opposition = 6,
        Fist = 7
    }

    public enum Joint {
        Metacarpal,
        Proximal,
        Intermediate,
        Distal
    }

}
