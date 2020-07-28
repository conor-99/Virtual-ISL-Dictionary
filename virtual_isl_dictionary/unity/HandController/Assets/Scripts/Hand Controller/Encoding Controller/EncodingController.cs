using System.Collections.Generic;
using System.IO;
using System.Linq;
using UnityEngine;

public class EncodingController : MonoBehaviour {

    public static void EncodeFile(string filePath) {
        
    }

    public static Gesture DecodeFile(string filePath) {

        Gesture gesture = null;

        using (StreamReader stream = new StreamReader(filePath)) {
            string json = stream.ReadToEnd();
            gesture = JsonUtility.FromJson<Gesture>(json);
        }

        return gesture;

    }

    public static Gesture DecodeAsset(string assetPath) {

        TextAsset textAsset = Resources.Load<TextAsset>(assetPath);
        Gesture gesture = JsonUtility.FromJson<Gesture>(textAsset.text);

        return gesture;

    }

}
