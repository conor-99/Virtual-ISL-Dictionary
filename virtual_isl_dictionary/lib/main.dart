
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
      {
        "word":"A",
        "status":"incomplete"
      },
      {
        "word":"B",
        "status":"incomplete"
      },
      {
        "word":"C",
        "status":"incomplete"
      }
    ],
    title: "Letters"
  );
  Challenge numbers = Challenge(
      words: [
        {
          "word":"0",
          "status":"complete"
        },
        {
          "word":"1",
          "status":"complete"
        },
        {
          "word":"2",
          "status":"complete"
        },
        {
          "word":"3",
          "status":"complete"
        },
        {
          "word":"4",
          "status":"complete"
        },
        {
          "word":"5",
          "status":"complete"
        },
        {
          "word":"6",
          "status":"complete"
        },
        {
          "word":"7",
          "status":"complete"
        },
        {
          "word":"8",
          "status":"complete"
        },
        {
          "word":"9",
          "status":"complete"
        }
      ],
      title: "Numbers"
  );
  Challenge vehicle = new Challenge(
    words: [
        {
          "word":"Car",
          "status":"incomplete",
        },
        {
          "word":"Boat",
          "status":"incomplete",
        },
        {
          "word":"Truck",
          "status":"incomplete",
        }
    ],
      title: "Vehicles"
  );
  Challenge animal = new Challenge(
      words: [
        {
          "word":"Pig",
          "status":"incomplete",
        },
        {
          "word":"Dog",
          "status":"incomplete",
        },
        {
          "word":"Cat",
          "status":"incomplete",
        }
      ],
      title: "Animals"
  );
  Challenge food = new Challenge(
      words: [
        {
          "word":"Burger",
          "status":"incomplete",
        },
        {
          "word":"Water",
          "status":"incomplete",
        },
        {
          "word":"Food",
          "status":"incomplete",
        }
      ],
      title: "Food & Drink"
  );
  Challenge sports = new Challenge(
      words: [
        {
          "word":"Football",
          "status":"incomplete",
        },
        {
          "word":"Swimming",
          "status":"incomplete",
        },
        {
          "word":"Rugby",
          "status":"incomplete",
        }
      ],
      title: "Sports"
  );
  List<Challenge> challenges = new List();
  User user;
  @override
  Widget build(BuildContext context) {
    challenges.add(numbers);
    challenges.add(letters);
    challenges.add(vehicle);
    challenges.add(animal);
    challenges.add(food);
    challenges.add(sports);
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
