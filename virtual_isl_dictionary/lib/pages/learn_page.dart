import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:virtual_isl_dictionary/widgets/CustomDrawer.dart';
import 'package:virtual_isl_dictionary/widgets/LearningCategory.dart';

import '../User.dart';
import 'hand_page.dart';

class LearningPage extends StatefulWidget {
  User user;
  LearningPage({this.user});
  @override
  State<StatefulWidget> createState() => new _LearningPageState(this.user);
}

class _LearningPageState extends State<LearningPage> {
  User user;
  _LearningPageState(this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.lightBlue[200]),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Learn", style: TextStyle(color: Colors.lightBlue[200]),),
      ),
      body: ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0,15,0,0),
                child: Container(
                  width: MediaQuery.of(context).size.width*.4,
                  height: MediaQuery.of(context).size.height*.075,
                  color: Colors.redAccent,
                  child: Center(
                    child: Text(
                      "Daily Suggestion",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width*.1),
            child: Column(
              children: <Widget>[
                LearningCategory(
                  icon: Icons.nature,
                  title: "Letters",
                  isComplete: true,
                ),
                Divider(height: 5, thickness: 2,),
                LearningCategory(
                  icon: Icons.nature,
                  title: "Numbers",
                  isComplete: true,
                ),
                Divider(height: 5, thickness: 2,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    LearningCategory(
                      icon: Icons.nature,
                      title: "Vehicles",
                      isComplete: false,
                    ),
                    LearningCategory(
                      icon: Icons.nature,
                      title: "Animals",
                      isComplete: false,
                    ),
                  ],
                ),
                Divider(height: 5, thickness: 2,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    LearningCategory(
                      icon: Icons.nature,
                      title: "Food & Drink",
                      isComplete: false,
                    ),
                    LearningCategory(
                      icon: Icons.nature,
                      title: "Sports",
                      isComplete: false,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      )
    );
  }
}