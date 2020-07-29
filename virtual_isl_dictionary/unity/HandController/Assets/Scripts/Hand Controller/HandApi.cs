using System;
using UnityEngine;

public class HandApi : MonoBehaviour
{

    public void ApiShow(String name) {
        
        string assetPath = EncodingDatabase.GetAssetPath(name);

        if (assetPath == null)
            return;

        gameObject.GetComponent<HandController>().ImportGesture(assetPath, true);

    }
    
    public void ApiPlay() {
        gameObject.GetComponent<HandController>().Play();
    }

    public void ApiPause() {
        gameObject.GetComponent<HandController>().Pause();
    }

    public void ApiReplay() {
        gameObject.GetComponent<HandController>().Replay();
    }

    public void ApiLoop(String statusStr) {
        gameObject.GetComponent<HandController>().SetLooping(bool.Parse(statusStr));
    }

    public void ApiSpeed(String speedStr) {
        gameObject.GetComponent<HandController>().SetSpeed(float.Parse(speedStr));
    }

    public void ApiRotate(String degreesStr) {
        gameObject.GetComponent<HandController>().SetRotation(float.Parse(degreesStr));
    }

    public void ApiIsPlaying() {

    }

}
