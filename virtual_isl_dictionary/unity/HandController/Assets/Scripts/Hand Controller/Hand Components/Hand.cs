using System.Collections.Generic;
using UnityEngine;

public class Hand : MonoBehaviour {
    
    private static Position resetPosition = Position.Standard;
    
    private static Dictionary<Joint, string> jointNames = new Dictionary<Joint, string>() {
        { Joint.Radiocarpal, "Hand" }
    };

    private static Dictionary<Position, Dictionary<Joint, Vector3>> rotations = new Dictionary<Position, Dictionary<Joint, Vector3>>() {
        {
            Position.Standard, new Dictionary<Joint, Vector3>() {
                { Joint.Radiocarpal, new Vector3(-0.8f, -0.6f, 0.0f) }
            }
        },
        {
            Position.TiltBack, new Dictionary<Joint, Vector3>() {
                { Joint.Radiocarpal, new Vector3(-0.8f, -0.6f, 25.9f) }
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
        Standard = 0,
        TiltBack = 1
    }

    public enum Joint {
        Radiocarpal
    }

}
