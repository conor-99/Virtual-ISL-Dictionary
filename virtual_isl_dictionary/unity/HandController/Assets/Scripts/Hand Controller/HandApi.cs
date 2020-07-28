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
        // ignore for now
    }

    public void ApiStart() {
        // ignore for now
    }

    public void ApiEnd() {
        // ignore for now
    }
    
    public void ApiNext() {
        // ignore for now
    }

    public void ApiPrevious() {
        // ignore for now
    }

    public void ApiSpeed(String speedStr) {
        gameObject.GetComponent<HandController>().SetSpeed(float.Parse(speedStr));
    }

}
