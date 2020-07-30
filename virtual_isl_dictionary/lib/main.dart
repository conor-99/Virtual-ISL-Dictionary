import 'package:flutter/material.dart';
import 'package:virtual_isl_dictionary/models/Challenge.dart';
import 'package:virtual_isl_dictionary/pages/hand_page.dart';
import 'package:virtual_isl_dictionary/pages/home_page.dart';

import 'package:virtual_isl_dictionary/models/User.dart';

void main() {
  runApp(new App());
}

class App extends StatelessWidget {
  Challenge letters = Challenge(
    words: [
      {"A":"complete"},
      {"B":"incomplete"}
    ],
    title: "Letters"
  );
  List<Challenge> challenges = new List();
  User user;
  @override
  Widget build(BuildContext context) {
    challenges.add(letters);
    user = new User(challenges: challenges, level: 1);
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: new HomePage(
        user: user,
      ),
    );
  }
}
