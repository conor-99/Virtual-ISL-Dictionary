using System.Collections.Generic;
using System.Linq;
using UnityEngine;

public class HandController : MonoBehaviour
{
    
    public Pinky.Position pinkyPosition = Pinky.Position.ExtensionAdduction;
    
    public void Update() {
        UpdatePinky(pinkyPosition);
    }

    public void Reset() {
        UpdatePinky(Pinky.GetResetPosition());
    }

    private void UpdatePinky(Pinky.Position position) {

        var joints = Pinky.Joint.GetValues(typeof(Pinky.Joint)).Cast<Pinky.Joint>();

        foreach (var joint in joints) {
            string jointName = Pinky.GetJointName(joint);
            GameObject.Find(jointName).transform.localEulerAngles = Pinky.GetJointRotationInPosition(position, joint);
        }

    }

}
