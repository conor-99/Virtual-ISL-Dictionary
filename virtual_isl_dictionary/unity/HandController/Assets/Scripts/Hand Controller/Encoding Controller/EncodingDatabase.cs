using System.Collections.Generic;
class EncodingDatabase {

    private static Dictionary<string, string> assetPaths = new Dictionary<string, string>(){
        { "example", "Text/example" },
        { "hello", "Text/hello" }
    };

    public static string GetAssetPath(string name) {
        string path = "";
        assetPaths.TryGetValue(name.ToLower(), out path);
        return path;
    }

}
