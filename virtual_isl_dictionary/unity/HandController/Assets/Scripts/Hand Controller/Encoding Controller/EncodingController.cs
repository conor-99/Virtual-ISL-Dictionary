using System.Collections.Generic;
using System.IO;
using System.Linq;
using UnityEngine;

public class EncodingController : MonoBehaviour
{

    public static void Encode(string filePath) {
        
    }

    public static Encoding Decode(string filePath) {

        Encoding encoding = null;

        using (StreamReader stream = new StreamReader(filePath)) {
            string json = stream.ReadToEnd();
            encoding = JsonUtility.FromJson<Encoding>(json);
        }

        return encoding;

    }

}
