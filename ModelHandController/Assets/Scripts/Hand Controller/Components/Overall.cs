using System.Collections.Generic;
using UnityEngine;

public class Overall : MonoBehaviour
{
    
    private static Position resetPosition = Position.Anterior;
    
    private static Dictionary<Joint, string> jointNames = new Dictionary<Joint, string>() {
        { Joint.OverallRotation, "HandModelPivot" }
    };

    private static Dictionary<Position, Dictionary<Joint, Vector3>> rotations = new Dictionary<Position, Dictionary<Joint, Vector3>>() {
        {
            Position.Anterior, new Dictionary<Joint, Vector3>() {
                { Joint.OverallRotation, new Vector3(0.0f, 0.0f, 0.0f) }
            }
        },
        {
            Position.Posterior, new Dictionary<Joint, Vector3>() {
                { Joint.OverallRotation, new Vector3(0.0f, 180.0f, 0.0f) }
            }
        },
        {
            Position.Left, new Dictionary<Joint, Vector3>() {
                { Joint.OverallRotation, new Vector3(0.0f, 270.0f, 0.0f) }
            }
        },
        {
            Position.Right, new Dictionary<Joint, Vector3>() {
                { Joint.OverallRotation, new Vector3(0.0f, 90.0f, 0.0f) }
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
        Anterior,
        Posterior,
        Left,
        Right

    }

    public enum Joint {
        OverallRotation
    }

}
