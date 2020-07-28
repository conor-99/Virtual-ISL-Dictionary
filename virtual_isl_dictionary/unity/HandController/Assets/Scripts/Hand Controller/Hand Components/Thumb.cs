using System.Collections.Generic;
using UnityEngine;

public class Thumb : MonoBehaviour {
    
    private static Position resetPosition = Position.ExtensionAdduction;
    
    /*
        In this 3D model both the index finger and thumb share the same metacarpal joint.
        The thumb's metacarpal positioning will override that of the index finger.
    */
    private static Dictionary<Joint, string> jointNames = new Dictionary<Joint, string>() {
        { Joint.Metacarpal, "Palm_01" },
        { Joint.Proximal, "Thumb_01" },
        { Joint.Intermediate, "Thumb_02" },
        { Joint.Distal, "Thumb_03" }
    };

    private static Dictionary<Position, Dictionary<Joint, Vector3>> rotations = new Dictionary<Position, Dictionary<Joint, Vector3>>() {
        {
            Position.ExtensionAdduction, new Dictionary<Joint, Vector3>() {
                { Joint.Metacarpal, new Vector3(3.1f, 90.2f, 6.2f) },
                { Joint.Proximal, new Vector3(-32.6f, 73.2f, 2.5f) },
                { Joint.Intermediate, new Vector3(18.7f, 5.6f, 11.7f) },
                { Joint.Distal, new Vector3(22.0f, 13.8f, 16.7f) }
            }
        },
        {
            Position.ThumbUp, new Dictionary<Joint, Vector3>() {
                { Joint.Metacarpal, new Vector3(16.6f, 97.3f, 4.9f) },
                { Joint.Proximal, new Vector3(-38.0f, 108.3f, 4.9f) },
                { Joint.Intermediate, new Vector3(-3.5f, 5.9f, 1.8f) },
                { Joint.Distal, new Vector3(-7.3f, -3.9f, 12.3f) }
            }
        },
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
        ThumbUp = 1
    }

    public enum Joint {
        Metacarpal,
        Proximal,
        Intermediate,
        Distal
    }

}
