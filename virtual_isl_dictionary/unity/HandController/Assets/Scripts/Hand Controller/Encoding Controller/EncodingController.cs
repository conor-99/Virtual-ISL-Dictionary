using System.Collections.Generic;
using System.IO;
using System.Linq;
using UnityEngine;

public class EncodingController : MonoBehaviour {

    public static void Encode(string filePath) {
        
    }

    public static Gesture Decode(string filePath) {

        Gesture gesture = null;

        using (StreamReader stream = new StreamReader(filePath)) {
            string json = stream.ReadToEnd();
            gesture = JsonUtility.FromJson<Gesture>(json);
        }

        return gesture;

    }

}
