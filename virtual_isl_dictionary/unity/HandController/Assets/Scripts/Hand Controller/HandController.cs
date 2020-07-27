using System.Linq;
//using UnityEditor;
using UnityEngine;

public class HandController : MonoBehaviour {

    [Header("Positions: Model")]
    public Vector3 modelPosition;
    
    [Header("Positions: Hand/Arm")]
    public Overall.Position overallPosition = Overall.Position.Anterior;
    public Forearm.Position forearmPosition = Forearm.Position.Standard;
    public Hand.Position handPosition = Hand.Position.Standard;
    
    [Header("Positions: Finger")]
    public Thumb.Position thumbPosition = Thumb.Position.ExtensionAdduction;
    public Index.Position indexPosition = Index.Position.ExtensionAdduction;
    public Middle.Position middlePosition = Middle.Position.ExtensionAdduction;
    public Ring.Position ringPosition = Ring.Position.ExtensionAdduction;   
    public Pinky.Position pinkyPosition = Pinky.Position.ExtensionAdduction;
    
    [Header("Playback Controls")]
    [Range(0.2f, 0.5f)]
    public float keyframeTransitionTime = 0.35f;
    [Range(0.25f, 2.0f)]
    public float transitionSpeedMultiplier = 1.0f;

    private Gesture gesture = null;
    private int currentKeyframe = 0;

    public void Start() { }

    public void Update() {
        //UpdateModel();
    }

    public void ImportGesture(string filePath) {

        gesture = EncodingController.Decode(filePath);
        currentKeyframe = 0;

        SetPositionsFromCurrentKeyframe();
        UpdateModel();

    }

    private void SetPositionsFromCurrentKeyframe() {

        if (gesture == null)
            return;

        if ((currentKeyframe < 0) || (currentKeyframe >= gesture.keyframes.Length))
            return;

        Keyframe keyframe = gesture.keyframes[currentKeyframe];

        modelPosition = new Vector3(keyframe.modelPosition.x, keyframe.modelPosition.y, keyframe.modelPosition.z);
        overallPosition = (Overall.Position) keyframe.overall;
        thumbPosition = (Thumb.Position) keyframe.thumb;
        indexPosition = (Index.Position) keyframe.index;
        middlePosition = (Middle.Position) keyframe.middle;
        ringPosition = (Ring.Position) keyframe.ring;
        pinkyPosition = (Pinky.Position) keyframe.pinky;
        handPosition = (Hand.Position) keyframe.hand;
        forearmPosition = (Forearm.Position) keyframe.forearm;

    }

    public void ExportGesture(string filePath) {
        // To-do
    }

    public void NextKeyframe() {

        if (gesture == null)
            return;
        
        if (currentKeyframe >= gesture.keyframes.Length - 1)
            return;
        
        currentKeyframe++;
        SetPositionsFromCurrentKeyframe();
        UpdateModel();

    }

    public void PreviousKeyframe() {

        if (gesture == null)
            return;
        
        if (currentKeyframe <= 0)
            return;
        
        currentKeyframe--;
        SetPositionsFromCurrentKeyframe();
        UpdateModel();

    }

    public void UpdateModel() {
        UpdateOverall(overallPosition, modelPosition);
        UpdateThumb(thumbPosition);
        UpdateIndex(indexPosition);
        UpdateMiddle(middlePosition);
        UpdateRing(ringPosition);
        UpdatePinky(pinkyPosition);
        UpdateHand(handPosition);
        UpdateForearm(forearmPosition);
    }

    public void ResetModel() {
        UpdateOverall(Overall.GetResetPosition(), Overall.GetResetModelPosition());
        UpdateThumb(Thumb.GetResetPosition());
        UpdateIndex(Index.GetResetPosition());
        UpdateMiddle(Middle.GetResetPosition());
        UpdateRing(Ring.GetResetPosition());
        UpdatePinky(Pinky.GetResetPosition());
        UpdateHand(Hand.GetResetPosition());
        UpdateForearm(Forearm.GetResetPosition());
    }

    public void Play() {

        /*if (gesture == null)
            return;
        
        currentKeyframe = 0;
        SetPositionsFromCurrentKeyframe();
        UpdateModel();

        AnimationClip clip = new AnimationClip();
        clip.SetCurve("", typeof(Transform), "localRotation.y", AnimationCurve.EaseInOut(0.0f, 0.7f, keyframeTransitionTime, 180.0f));
        clip.legacy = true;
        AssetDatabase.CreateAsset(clip, "Assets/Animations/Test.anim");

        Animation animation = gameObject.GetComponent<Animation>();
        animation.AddClip(clip, "Assets/Animations/Test.anim");
        animation.Play("Assets/Animations/Test.anim");*/
    
    }

    private void UpdateOverall(Overall.Position position, Vector3 _modelPosition) {

        if (overallPosition != position)
            overallPosition = position;
        
        if (modelPosition != _modelPosition)
            modelPosition = _modelPosition;

        var joints = Overall.Joint.GetValues(typeof(Overall.Joint)).Cast<Overall.Joint>();

        foreach (var joint in joints) {
            string jointName = Overall.GetJointName(joint);
            GameObject.Find(jointName).transform.localEulerAngles = Overall.GetJointRotationInPosition(position, joint);
        }

        GameObject.Find(Overall.GetModelName()).transform.position = _modelPosition;

    }

    private void UpdateForearm(Forearm.Position position) {

        if (forearmPosition != position)
            forearmPosition = position;

        var joints = Forearm.Joint.GetValues(typeof(Forearm.Joint)).Cast<Forearm.Joint>();

        foreach (var joint in joints) {
            string jointName = Forearm.GetJointName(joint);
            GameObject.Find(jointName).transform.localEulerAngles = Forearm.GetJointRotationInPosition(position, joint);
        }

    }

    private void UpdateHand(Hand.Position position) {

        if (handPosition != position)
            handPosition = position;

        var joints = Hand.Joint.GetValues(typeof(Hand.Joint)).Cast<Hand.Joint>();

        foreach (var joint in joints) {
            string jointName = Hand.GetJointName(joint);
            GameObject.Find(jointName).transform.localEulerAngles = Hand.GetJointRotationInPosition(position, joint);
        }

    }

    private void UpdateThumb(Thumb.Position position) {

        if (thumbPosition != position)
            thumbPosition = position;

        var joints = Thumb.Joint.GetValues(typeof(Thumb.Joint)).Cast<Thumb.Joint>();

        foreach (var joint in joints) {
            string jointName = Thumb.GetJointName(joint);
            GameObject.Find(jointName).transform.localEulerAngles = Thumb.GetJointRotationInPosition(position, joint);
        }

    }

    private void UpdateIndex(Index.Position position) {

        if (indexPosition != position)
            indexPosition = position;

        var joints = Index.Joint.GetValues(typeof(Index.Joint)).Cast<Index.Joint>();

        foreach (var joint in joints) {
            string jointName = Index.GetJointName(joint);
            GameObject.Find(jointName).transform.localEulerAngles = Index.GetJointRotationInPosition(position, joint);
        }

    }

    private void UpdateMiddle(Middle.Position position) {

        if (middlePosition != position)
            middlePosition = position;

        var joints = Middle.Joint.GetValues(typeof(Middle.Joint)).Cast<Middle.Joint>();

        foreach (var joint in joints) {
            string jointName = Middle.GetJointName(joint);
            GameObject.Find(jointName).transform.localEulerAngles = Middle.GetJointRotationInPosition(position, joint);
        }

    }

    private void UpdateRing(Ring.Position position) {

        if (ringPosition != position)
            ringPosition = position;

        var joints = Ring.Joint.GetValues(typeof(Ring.Joint)).Cast<Ring.Joint>();

        foreach (var joint in joints) {
            string jointName = Ring.GetJointName(joint);
            GameObject.Find(jointName).transform.localEulerAngles = Ring.GetJointRotationInPosition(position, joint);
        }

    }

    private void UpdatePinky(Pinky.Position position) {

        if (pinkyPosition != position)
            pinkyPosition = position;

        var joints = Pinky.Joint.GetValues(typeof(Pinky.Joint)).Cast<Pinky.Joint>();

        foreach (var joint in joints) {
            string jointName = Pinky.GetJointName(joint);
            GameObject.Find(jointName).transform.localEulerAngles = Pinky.GetJointRotationInPosition(position, joint);
        }

    }

}
