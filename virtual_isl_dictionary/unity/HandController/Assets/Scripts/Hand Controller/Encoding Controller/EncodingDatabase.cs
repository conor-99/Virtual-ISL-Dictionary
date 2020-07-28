using System.Collections.Generic;
class EncodingDatabase {

    private static Dictionary<string, string> assetPaths = new Dictionary<string, string>(){
        { "Example", "Encodings/example.json" }
    };

    public static string GetAssetPath(string name) {
        string path = "";
        assetPaths.TryGetValue(name, out path);
        return path;
    }

}
