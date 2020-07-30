class Challenge {
  List<Map<String, String>> words = new List();
  String title;
  Challenge({this.words, this.title});

  isComplete() {
    for(int i = 0; i < words.length; i++) {
      if(words[i].containsValue("incomplete")) {
        return false;
      }
    }
    return true;
  }

  percentageComplete() {
    int completeCount = 0;
    for(int i = 0; i < words.length; i++) {
      if(words[i].containsValue("complete")) {
        completeCount++;
      }
    }
    return (completeCount / words.length) * 100;
  }

  nextWord() {
    for(int i = 0; i < words.length; i++) {
      if(words[i]["status"] == "incomplete") {
        return words[i]["word"];
      }
    }
    return "";
  }

  completeWord(String word) {
    for(int i = 0; i < words.length; i++) {
      if(words[i]["word"] == word) {
        words[i]["status"] = "complete";
      }
    }
  }
}