import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:virtual_isl_dictionary/widgets/CustomDrawer.dart';
import 'package:virtual_isl_dictionary/widgets/LearningCategory.dart';

import 'package:virtual_isl_dictionary/models/User.dart';
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
          title: Text(
            "Learn",
            style: TextStyle(color: Colors.lightBlue[200]),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Column(
                    children: <Widget>[
                        ClipPath(
                          clipper: DiagonalClipper(),
                          child: Container(
                            width: MediaQuery.of(context).size.width * .4,
                            height: MediaQuery.of(context).size.height * .06,
                            color: Colors.redAccent,
                              child: Center(
                                  child: Image.asset(
                                    "assets/images/trophy.png",
                                    color: Colors.amberAccent,
                                  )
                              ),
                          ),
                        ),
                        Text(
                          "Level " + user.level.toString(),
                          style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                    ]
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(MediaQuery.of(context).size.width*.1),
                  child: Column(
                    children: <Widget>[
                      LearningCategory(
                        icon: "assets/images/ABC.png",
                        title: "Letters",
                        isComplete: true,
                      ),
                      Divider(height: 5, thickness: 2,),
                      LearningCategory(
                        icon: "assets/images/numbers.png",
                        title: "Numbers",
                        isComplete: true,
                      ),
                      Divider(height: 5, thickness: 2,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          LearningCategory(
                            icon: "assets/images/vehicles.png",
                            title: "Vehicles",
                            isComplete: false,
                          ),
                          LearningCategory(
                            icon: "assets/images/pig.png",
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
                            icon: "assets/images/FoodAndDrink.png",
                            title: "Food & Drink",
                            isComplete: false,
                          ),
                          LearningCategory(
                            icon: "assets/images/sports.png",
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
          ]
        ),
    );
  }
}

class DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(size.width * .20, size.height / 2);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(DiagonalClipper oldClipper) => false;
}
