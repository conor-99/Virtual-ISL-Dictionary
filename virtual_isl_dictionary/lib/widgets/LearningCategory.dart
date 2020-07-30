import 'dart:math';

import 'package:flutter/material.dart';
import 'package:virtual_isl_dictionary/widgets/CustomDrawer.dart';
import 'package:virtual_isl_dictionary/models/User.dart';

class LearningCategory extends StatefulWidget {
  GestureTapCallback onPressed;
  String icon;
  String title;
  bool isComplete;
  double percentComplete;
  LearningCategory({this.onPressed, this.icon, this.title, this.isComplete, this.percentComplete});
  @override
  State<StatefulWidget> createState() => new _LearningCategoryState(
      this.onPressed, this.icon, this.title, this.isComplete, this.percentComplete);
}

class _LearningCategoryState extends State<LearningCategory> {
  GestureTapCallback onPressed;
  String icon;
  String title;
  bool isComplete = false;
  double percentComplete;
  Random random = new Random();
  _LearningCategoryState(
      this.onPressed, this.icon, this.title, this.isComplete, this.percentComplete);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * .05),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: onPressed,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .25,
              height: MediaQuery.of(context).size.width * .25,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: isComplete ? Color(0xff64dd17) : Colors.grey[300]),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width * .05),
                    child: Image.asset(
                      icon,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      title,
                    ),
                    isComplete
                        ? Icon(
                            Icons.check_circle,
                            color: Color(0xff64dd17),
                          )
                        : Container()
                  ],
                ),
                isComplete
                    ? Container()
                    : Text(
                        (percentComplete == null ? random.nextInt(100).toString() : percentComplete.toStringAsFixed(0)) + "%",
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
