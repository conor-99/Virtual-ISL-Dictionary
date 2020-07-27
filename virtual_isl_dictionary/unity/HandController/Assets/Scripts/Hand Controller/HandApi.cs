using System;
using UnityEngine;

public class HandApi : MonoBehaviour
{

    public void Rotate(String message)
    {

        float yRotation = float.Parse(message);

        gameObject.transform.eulerAngles = new Vector3(
            gameObject.transform.eulerAngles.x,
            yRotation,
            gameObject.transform.eulerAngles.z
        );

    }

    public void ApiShow(String name) {

    }
    
    public void ApiPlay() {

    }

    public void ApiPause() {

    }

    public void ApiStart() {

    }

    public void ApiEnd() {

    }
    
    public void ApiNext() {

    }

    public void ApiPrevious() {

    }

    public void ApiSpeed(String speed) {
        
    }

}
