using System.Collections.Generic;
using UnityEngine;

public class Forearm : MonoBehaviour
{
    
    private static Position resetPosition = Position.Standard;
    
    private static Dictionary<Joint, string> jointNames = new Dictionary<Joint, string>() {
        { Joint.Elbow, "Forearm" }
    };

    private static Dictionary<Position, Dictionary<Joint, Vector3>> rotations = new Dictionary<Position, Dictionary<Joint, Vector3>>() {
        {
            Position.Standard, new Dictionary<Joint, Vector3>() {
                { Joint.Elbow, new Vector3(96.2f, 123.2f, -1.46f) }
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
        Standard = 0
    }

    public enum Joint {
        Elbow
    }

}
