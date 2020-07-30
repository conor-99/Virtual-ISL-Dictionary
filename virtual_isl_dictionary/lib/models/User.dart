import 'package:flutter/material.dart';

import 'Challenge.dart';

class User {
  List<Challenge> challenges = new List();
  List<String> bookmarks = new List();
  int level = 2;
  User({this.challenges, this.level});

  levelUp() {
    this.level++;
  }
}
