﻿using System.Collections.Generic;
using System.Linq;
using UnityEngine;

public class HandController : MonoBehaviour {

    #region Configuration

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
    [Range(0.5f, 2.0f)]
    public float keyframeTransitionTime = 1.0f;
    [Range(0.25f, 2.0f)]
    public float transitionSpeedMultiplier = 1.0f;

    #endregion

    private Gesture gesture;
    private int currentKeyframe;
    private List<AnimationClipTuple> animations;

    public void Start() {

        gesture = null;
        currentKeyframe = 0;
        animations = new List<AnimationClipTuple>();
        
        SetSpeed(transitionSpeedMultiplier);

    }

    public void Update() {
        //UpdateModel();
    }

    public void ImportGesture(string path, bool isAsset = false) {

        if (isAsset)
            gesture = EncodingController.DecodeAsset(path);
        else
            gesture = EncodingController.DecodeFile(path);
        
        currentKeyframe = 0;
        
        GenerateAnimations();
        SetPositionsFromCurrentKeyframe();
        UpdateModel();

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

        if (animations == null)
            return;
        
        foreach (AnimationClipTuple animation in animations) {
            animation.animation[animation.clipName].speed = transitionSpeedMultiplier;
            animation.animation.Play(animation.clipName);
        }

        if (gesture != null)
            currentKeyframe = gesture.keyframes.Length - 1;

    }

    public void Pause() {

        if (animations == null)
            return;
        
        foreach (AnimationClipTuple animation in animations) {
            animation.animation[animation.clipName].speed = 0f;
        }

    }

    public void Replay() {

        if (animations == null)
            return;
        
        foreach (AnimationClipTuple animation in animations) {
            animation.animation.Stop(animation.clipName);
        }

        Play();

    }

    public void SetLooping(bool status) {

        if (animations == null)
            return;
        
        foreach (AnimationClipTuple animation in animations) {
            animation.animation[animation.clipName].wrapMode = status ? WrapMode.Loop : WrapMode.Once;
        }

    }
    
    public void SetSpeed(float speed) {

        transitionSpeedMultiplier = speed;

        if (animations == null)
            return;
        
        foreach (AnimationClipTuple animation in animations) {
            animation.animation[animation.clipName].speed = transitionSpeedMultiplier;
        }

    }

    public void SetRotation(float degrees) {

        string modelName = Overall.GetModelName();
        
        Vector3 curRotation = Overall.GetJointRotationInPosition(overallPosition, Overall.Joint.OverallRotation);
        Vector3 newRotation = new Vector3(
            curRotation.x,
            curRotation.y + degrees,
            curRotation.z
        );

        GameObject.Find(modelName).transform.localEulerAngles = newRotation;

    }

    public bool IsPlaying() {
        
        if (animations == null)
            return false;
        
        foreach (AnimationClipTuple animation in animations) {
            if (animation.animation.isPlaying)
                return true;
        }

        return false;

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

    private void GenerateAnimations() {

        if (gesture == null || gesture.keyframes.Length == 1)
            return;

        animations.Clear();

        GenerateOverall();
        GenerateForearm();
        GenerateHand();
        GenerateThumb();
        GenerateIndex();
        GenerateMiddle();
        GenerateRing();
        GeneratePinky();

    }

    #region Generate Animations

    private void GenerateOverall() {

        string model = Overall.GetModelName();
        string clipName = $"Overall-{model}";

        GameObject _gameObject = GameObject.Find(model);
        Animation animation = _gameObject.GetComponent<Animation>();
        AnimationClip clip = new AnimationClip();
        clip.legacy = true;

        AnimationCurve curvePosX = null;
        AnimationCurve curvePosY = null;
        AnimationCurve curvePosZ = null;
        AnimationCurve curveRotX = null;
        AnimationCurve curveRotY = null;
        AnimationCurve curveRotZ = null;

        for (int i = 0; i < gesture.keyframes.Length - 1; i++) {

            Keyframe thisFrame = gesture.keyframes[i];
            Keyframe nextFrame = gesture.keyframes[i + 1];

            Vector3 thisRot = Overall.GetJointRotationInPosition((Overall.Position) thisFrame.overall, Overall.Joint.OverallRotation);
            Vector3 nextRot = Overall.GetJointRotationInPosition((Overall.Position) nextFrame.overall, Overall.Joint.OverallRotation);

            float timeStart = i * keyframeTransitionTime;
            float timeEnd = timeStart + keyframeTransitionTime;

            if (i == 0) {
                curvePosX = AnimationCurve.EaseInOut(timeStart, thisFrame.modelPosition.x, timeEnd, nextFrame.modelPosition.x);
                curvePosY = AnimationCurve.EaseInOut(timeStart, thisFrame.modelPosition.y, timeEnd, nextFrame.modelPosition.y);
                curvePosZ = AnimationCurve.EaseInOut(timeStart, thisFrame.modelPosition.z, timeEnd, nextFrame.modelPosition.z);
                curveRotX = AnimationCurve.EaseInOut(timeStart, thisRot.x, timeEnd, nextRot.x);
                curveRotY = AnimationCurve.EaseInOut(timeStart, thisRot.y, timeEnd, nextRot.y);
                curveRotZ = AnimationCurve.EaseInOut(timeStart, thisRot.z, timeEnd, nextRot.z);
            } else {
                curvePosX.AddKey(timeEnd, nextFrame.modelPosition.x);
                curvePosY.AddKey(timeEnd, nextFrame.modelPosition.y);
                curvePosZ.AddKey(timeEnd, nextFrame.modelPosition.z);
                curveRotX.AddKey(timeEnd, nextRot.x);
                curveRotY.AddKey(timeEnd, nextRot.y);
                curveRotZ.AddKey(timeEnd, nextRot.z);
            }

        }

        clip.SetCurve("", typeof(Transform), "localPosition.x", curvePosX);
        clip.SetCurve("", typeof(Transform), "localPosition.y", curvePosY);
        clip.SetCurve("", typeof(Transform), "localPosition.z", curvePosZ);
        clip.SetCurve("", typeof(Transform), "localEulerAngles.x", curveRotX);
        clip.SetCurve("", typeof(Transform), "localEulerAngles.y", curveRotY);
        clip.SetCurve("", typeof(Transform), "localEulerAngles.z", curveRotZ);
        
        animation.AddClip(clip, clipName);
        animations.Add(new AnimationClipTuple(animation, clipName));

    }

    private void GenerateForearm() {

        var joints = Forearm.Joint.GetValues(typeof(Forearm.Joint)).Cast<Forearm.Joint>();

        foreach (var joint in joints) {

            string jointName = Forearm.GetJointName(joint);
            string clipName = $"Forearm-{jointName}";

            GameObject _gameObject = GameObject.Find(jointName);
            Animation animation = _gameObject.GetComponent<Animation>();
            AnimationClip clip = new AnimationClip();
            clip.legacy = true;

            AnimationCurve curveRotX = null;
            AnimationCurve curveRotY = null;
            AnimationCurve curveRotZ = null;
            
            for (int i = 0; i < gesture.keyframes.Length - 1; i++) {

                Keyframe thisFrame = gesture.keyframes[i];
                Keyframe nextFrame = gesture.keyframes[i + 1];

                Vector3 thisRot = Forearm.GetJointRotationInPosition((Forearm.Position) thisFrame.forearm, joint);
                Vector3 nextRot = Forearm.GetJointRotationInPosition((Forearm.Position) nextFrame.forearm, joint);

                float timeStart = i * keyframeTransitionTime;
                float timeEnd = timeStart + keyframeTransitionTime;

                if (i == 0) {
                    curveRotX = AnimationCurve.EaseInOut(timeStart, thisRot.x, timeEnd, nextRot.x);
                    curveRotY = AnimationCurve.EaseInOut(timeStart, thisRot.y, timeEnd, nextRot.y);
                    curveRotZ = AnimationCurve.EaseInOut(timeStart, thisRot.z, timeEnd, nextRot.z);
                } else {
                    curveRotX.AddKey(timeEnd, nextRot.x);
                    curveRotY.AddKey(timeEnd, nextRot.y);
                    curveRotZ.AddKey(timeEnd, nextRot.z);
                }
                
            }

            clip.SetCurve("", typeof(Transform), "localEulerAngles.x", curveRotX);
            clip.SetCurve("", typeof(Transform), "localEulerAngles.y", curveRotY);
            clip.SetCurve("", typeof(Transform), "localEulerAngles.z", curveRotZ);

            animation.AddClip(clip, clipName);
            animations.Add(new AnimationClipTuple(animation, clipName));

        }

    }

    private void GenerateHand() {

        var joints = Hand.Joint.GetValues(typeof(Hand.Joint)).Cast<Hand.Joint>();

        foreach (var joint in joints) {

            string jointName = Hand.GetJointName(joint);
            string clipName = $"Hand-{jointName}";

            GameObject _gameObject = GameObject.Find(jointName);
            Animation animation = _gameObject.GetComponent<Animation>();
            AnimationClip clip = new AnimationClip();
            clip.legacy = true;

            AnimationCurve curveRotX = null;
            AnimationCurve curveRotY = null;
            AnimationCurve curveRotZ = null;
            
            for (int i = 0; i < gesture.keyframes.Length - 1; i++) {

                Keyframe thisFrame = gesture.keyframes[i];
                Keyframe nextFrame = gesture.keyframes[i + 1];

                Vector3 thisRot = Hand.GetJointRotationInPosition((Hand.Position) thisFrame.hand, joint);
                Vector3 nextRot = Hand.GetJointRotationInPosition((Hand.Position) nextFrame.hand, joint);

                float timeStart = i * keyframeTransitionTime;
                float timeEnd = timeStart + keyframeTransitionTime;

                if (i == 0) {
                    curveRotX = AnimationCurve.EaseInOut(timeStart, thisRot.x, timeEnd, nextRot.x);
                    curveRotY = AnimationCurve.EaseInOut(timeStart, thisRot.y, timeEnd, nextRot.y);
                    curveRotZ = AnimationCurve.EaseInOut(timeStart, thisRot.z, timeEnd, nextRot.z);
                } else {
                    curveRotX.AddKey(timeEnd, nextRot.x);
                    curveRotY.AddKey(timeEnd, nextRot.y);
                    curveRotZ.AddKey(timeEnd, nextRot.z);
                }
                
            }

            clip.SetCurve("", typeof(Transform), "localEulerAngles.x", curveRotX);
            clip.SetCurve("", typeof(Transform), "localEulerAngles.y", curveRotY);
            clip.SetCurve("", typeof(Transform), "localEulerAngles.z", curveRotZ);

            animation.AddClip(clip, clipName);
            animations.Add(new AnimationClipTuple(animation, clipName));

        }

    }

    private void GenerateThumb() {

        var joints = Thumb.Joint.GetValues(typeof(Thumb.Joint)).Cast<Thumb.Joint>();

        foreach (var joint in joints) {

            string jointName = Thumb.GetJointName(joint);
            string clipName = $"Thumb-{jointName}";

            GameObject _gameObject = GameObject.Find(jointName);
            Animation animation = _gameObject.GetComponent<Animation>();
            AnimationClip clip = new AnimationClip();
            clip.legacy = true;

            AnimationCurve curveRotX = null;
            AnimationCurve curveRotY = null;
            AnimationCurve curveRotZ = null;
            
            for (int i = 0; i < gesture.keyframes.Length - 1; i++) {

                Keyframe thisFrame = gesture.keyframes[i];
                Keyframe nextFrame = gesture.keyframes[i + 1];

                Vector3 thisRot = Thumb.GetJointRotationInPosition((Thumb.Position) thisFrame.thumb, joint);
                Vector3 nextRot = Thumb.GetJointRotationInPosition((Thumb.Position) nextFrame.thumb, joint);

                float timeStart = i * keyframeTransitionTime;
                float timeEnd = timeStart + keyframeTransitionTime;

                if (i == 0) {
                    curveRotX = AnimationCurve.EaseInOut(timeStart, thisRot.x, timeEnd, nextRot.x);
                    curveRotY = AnimationCurve.EaseInOut(timeStart, thisRot.y, timeEnd, nextRot.y);
                    curveRotZ = AnimationCurve.EaseInOut(timeStart, thisRot.z, timeEnd, nextRot.z);
                } else {
                    curveRotX.AddKey(timeEnd, nextRot.x);
                    curveRotY.AddKey(timeEnd, nextRot.y);
                    curveRotZ.AddKey(timeEnd, nextRot.z);
                }
                
            }

            clip.SetCurve("", typeof(Transform), "localEulerAngles.x", curveRotX);
            clip.SetCurve("", typeof(Transform), "localEulerAngles.y", curveRotY);
            clip.SetCurve("", typeof(Transform), "localEulerAngles.z", curveRotZ);

            animation.AddClip(clip, clipName);
            animations.Add(new AnimationClipTuple(animation, clipName));

        }

    }

    private void GenerateIndex() {

        var joints = Index.Joint.GetValues(typeof(Index.Joint)).Cast<Index.Joint>();

        foreach (var joint in joints) {

            string jointName = Index.GetJointName(joint);
            string clipName = $"Index-{jointName}";

            GameObject _gameObject = GameObject.Find(jointName);
            Animation animation = _gameObject.GetComponent<Animation>();
            AnimationClip clip = new AnimationClip();
            clip.legacy = true;

            AnimationCurve curveRotX = null;
            AnimationCurve curveRotY = null;
            AnimationCurve curveRotZ = null;
            
            for (int i = 0; i < gesture.keyframes.Length - 1; i++) {

                Keyframe thisFrame = gesture.keyframes[i];
                Keyframe nextFrame = gesture.keyframes[i + 1];

                Vector3 thisRot = Index.GetJointRotationInPosition((Index.Position) thisFrame.index, joint);
                Vector3 nextRot = Index.GetJointRotationInPosition((Index.Position) nextFrame.index, joint);

                float timeStart = i * keyframeTransitionTime;
                float timeEnd = timeStart + keyframeTransitionTime;

                if (i == 0) {
                    curveRotX = AnimationCurve.EaseInOut(timeStart, thisRot.x, timeEnd, nextRot.x);
                    curveRotY = AnimationCurve.EaseInOut(timeStart, thisRot.y, timeEnd, nextRot.y);
                    curveRotZ = AnimationCurve.EaseInOut(timeStart, thisRot.z, timeEnd, nextRot.z);
                } else {
                    curveRotX.AddKey(timeEnd, nextRot.x);
                    curveRotY.AddKey(timeEnd, nextRot.y);
                    curveRotZ.AddKey(timeEnd, nextRot.z);
                }
                
            }

            clip.SetCurve("", typeof(Transform), "localEulerAngles.x", curveRotX);
            clip.SetCurve("", typeof(Transform), "localEulerAngles.y", curveRotY);
            clip.SetCurve("", typeof(Transform), "localEulerAngles.z", curveRotZ);

            animation.AddClip(clip, clipName);
            animations.Add(new AnimationClipTuple(animation, clipName));

        }

    }

    private void GenerateMiddle() {

        var joints = Middle.Joint.GetValues(typeof(Middle.Joint)).Cast<Middle.Joint>();

        foreach (var joint in joints) {

            string jointName = Middle.GetJointName(joint);
            string clipName = $"Middle-{jointName}";

            GameObject _gameObject = GameObject.Find(jointName);
            Animation animation = _gameObject.GetComponent<Animation>();
            AnimationClip clip = new AnimationClip();
            clip.legacy = true;

            AnimationCurve curveRotX = null;
            AnimationCurve curveRotY = null;
            AnimationCurve curveRotZ = null;
            
            for (int i = 0; i < gesture.keyframes.Length - 1; i++) {

                Keyframe thisFrame = gesture.keyframes[i];
                Keyframe nextFrame = gesture.keyframes[i + 1];

                Vector3 thisRot = Middle.GetJointRotationInPosition((Middle.Position) thisFrame.middle, joint);
                Vector3 nextRot = Middle.GetJointRotationInPosition((Middle.Position) nextFrame.middle, joint);

                float timeStart = i * keyframeTransitionTime;
                float timeEnd = timeStart + keyframeTransitionTime;

                if (i == 0) {
                    curveRotX = AnimationCurve.EaseInOut(timeStart, thisRot.x, timeEnd, nextRot.x);
                    curveRotY = AnimationCurve.EaseInOut(timeStart, thisRot.y, timeEnd, nextRot.y);
                    curveRotZ = AnimationCurve.EaseInOut(timeStart, thisRot.z, timeEnd, nextRot.z);
                } else {
                    curveRotX.AddKey(timeEnd, nextRot.x);
                    curveRotY.AddKey(timeEnd, nextRot.y);
                    curveRotZ.AddKey(timeEnd, nextRot.z);
                }
                
            }

            clip.SetCurve("", typeof(Transform), "localEulerAngles.x", curveRotX);
            clip.SetCurve("", typeof(Transform), "localEulerAngles.y", curveRotY);
            clip.SetCurve("", typeof(Transform), "localEulerAngles.z", curveRotZ);

            animation.AddClip(clip, clipName);
            animations.Add(new AnimationClipTuple(animation, clipName));

        }

    }

    private void GenerateRing() {

        var joints = Ring.Joint.GetValues(typeof(Ring.Joint)).Cast<Ring.Joint>();

        foreach (var joint in joints) {

            string jointName = Ring.GetJointName(joint);
            string clipName = $"Ring-{jointName}";

            GameObject _gameObject = GameObject.Find(jointName);
            Animation animation = _gameObject.GetComponent<Animation>();
            AnimationClip clip = new AnimationClip();
            clip.legacy = true;

            AnimationCurve curveRotX = null;
            AnimationCurve curveRotY = null;
            AnimationCurve curveRotZ = null;
            
            for (int i = 0; i < gesture.keyframes.Length - 1; i++) {

                Keyframe thisFrame = gesture.keyframes[i];
                Keyframe nextFrame = gesture.keyframes[i + 1];

                Vector3 thisRot = Ring.GetJointRotationInPosition((Ring.Position) thisFrame.ring, joint);
                Vector3 nextRot = Ring.GetJointRotationInPosition((Ring.Position) nextFrame.ring, joint);

                float timeStart = i * keyframeTransitionTime;
                float timeEnd = timeStart + keyframeTransitionTime;

                if (i == 0) {
                    curveRotX = AnimationCurve.EaseInOut(timeStart, thisRot.x, timeEnd, nextRot.x);
                    curveRotY = AnimationCurve.EaseInOut(timeStart, thisRot.y, timeEnd, nextRot.y);
                    curveRotZ = AnimationCurve.EaseInOut(timeStart, thisRot.z, timeEnd, nextRot.z);
                } else {
                    curveRotX.AddKey(timeEnd, nextRot.x);
                    curveRotY.AddKey(timeEnd, nextRot.y);
                    curveRotZ.AddKey(timeEnd, nextRot.z);
                }
                
            }

            clip.SetCurve("", typeof(Transform), "localEulerAngles.x", curveRotX);
            clip.SetCurve("", typeof(Transform), "localEulerAngles.y", curveRotY);
            clip.SetCurve("", typeof(Transform), "localEulerAngles.z", curveRotZ);

            animation.AddClip(clip, clipName);
            animations.Add(new AnimationClipTuple(animation, clipName));

        }

    }

    private void GeneratePinky() {

        var joints = Pinky.Joint.GetValues(typeof(Pinky.Joint)).Cast<Pinky.Joint>();

        foreach (var joint in joints) {

            string jointName = Pinky.GetJointName(joint);
            string clipName = $"Pinky-{jointName}";

            GameObject _gameObject = GameObject.Find(jointName);
            Animation animation = _gameObject.GetComponent<Animation>();
            AnimationClip clip = new AnimationClip();
            clip.legacy = true;

            AnimationCurve curveRotX = null;
            AnimationCurve curveRotY = null;
            AnimationCurve curveRotZ = null;
            
            for (int i = 0; i < gesture.keyframes.Length - 1; i++) {

                Keyframe thisFrame = gesture.keyframes[i];
                Keyframe nextFrame = gesture.keyframes[i + 1];

                Vector3 thisRot = Pinky.GetJointRotationInPosition((Pinky.Position) thisFrame.pinky, joint);
                Vector3 nextRot = Pinky.GetJointRotationInPosition((Pinky.Position) nextFrame.pinky, joint);

                float timeStart = i * keyframeTransitionTime;
                float timeEnd = timeStart + keyframeTransitionTime;

                if (i == 0) {
                    curveRotX = AnimationCurve.EaseInOut(timeStart, thisRot.x, timeEnd, nextRot.x);
                    curveRotY = AnimationCurve.EaseInOut(timeStart, thisRot.y, timeEnd, nextRot.y);
                    curveRotZ = AnimationCurve.EaseInOut(timeStart, thisRot.z, timeEnd, nextRot.z);
                } else {
                    curveRotX.AddKey(timeEnd, nextRot.x);
                    curveRotY.AddKey(timeEnd, nextRot.y);
                    curveRotZ.AddKey(timeEnd, nextRot.z);
                }
                
            }

            clip.SetCurve("", typeof(Transform), "localEulerAngles.x", curveRotX);
            clip.SetCurve("", typeof(Transform), "localEulerAngles.y", curveRotY);
            clip.SetCurve("", typeof(Transform), "localEulerAngles.z", curveRotZ);

            animation.AddClip(clip, clipName);
            animations.Add(new AnimationClipTuple(animation, clipName));

        }

    }

    #endregion

    #region Update Components

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

    #endregion

}
