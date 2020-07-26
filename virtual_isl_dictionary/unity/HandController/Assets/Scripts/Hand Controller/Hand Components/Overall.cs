using System.Collections.Generic;
using UnityEngine;

public class Overall : MonoBehaviour {
    
    private static Position resetPosition = Position.Anterior;
    private static Vector3 resetModelPosition = new Vector3(0.0f, 0.7f, -5.7f);
    
    private static string modelName = "HandModelPivot";

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

    public static Vector3 GetResetModelPosition() {
        return resetModelPosition;
    }

    public static string GetModelName() {
        return modelName;
    }

    public enum Position {
        Anterior = 0,
        Posterior = 1,
        Left = 2,
        Right = 3

    }

    public enum Joint {
        OverallRotation
    }

}
