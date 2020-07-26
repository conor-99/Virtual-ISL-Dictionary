using System;
using UnityEngine;
//using UnityEngine.EventSystems;

public class Rotate : MonoBehaviour//, IEventSystemHandler
{
    [SerializeField]
    Vector3 rotateAmount;

    void Start()
    {
        rotateAmount = new Vector3(0, 0, 0);
    }
        
    void Update()
    {
        gameObject.transform.Rotate(rotateAmount * Time.deltaTime * 10);
    }

    public void SetRotationSpeed(String message)
    {
        float value = float.Parse(message);
        rotateAmount = new Vector3(value, value, value);
    }

}
