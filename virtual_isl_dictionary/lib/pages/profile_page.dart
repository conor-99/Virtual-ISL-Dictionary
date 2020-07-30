import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:virtual_isl_dictionary/models/User.dart';

class ProfilePage extends StatefulWidget {
  User user;
  ProfilePage({this.user});
  @override
  State<StatefulWidget> createState() => new _ProfilePageState(this.user);
}

class _ProfilePageState extends State<ProfilePage> {
  User user;
  _ProfilePageState(this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.lightBlue[200]),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Profile",
            style: TextStyle(color: Colors.lightBlue[200]),
          ),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Image(
                  fit: BoxFit.scaleDown,
                  height: 150,
                  width: 150,
                  image: AssetImage('assets/images/profile.png')),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: new LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width - 50,
                  animation: true,
                  lineHeight: 20.0,
                  animationDuration: 1800,
                  percent: 0.8,
                  center: Text("Level " + user.level.toString()),
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: Colors.yellow[300],
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Text("Log in to Save Progress",
                      style: TextStyle(
                        color: Colors.blue[400],
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                      ))),
              Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Text(
                    "Achievements",
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              Padding(
                padding: EdgeInsets.all(6.0),
                child: Container(
                    width: 400,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.lightBlue[300],
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Center(
                        child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Text("Baby's First Step",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              )),
                        ),
                        Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Text(
                              "Learnt a Letter",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                              ),
                            ))
                      ],
                    ))),
              ),
              Padding(
                padding: EdgeInsets.all(6.0),
                child: Container(
                    width: 400,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.lightBlue[300],
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Center(
                        child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Text("Mom Get The Camera",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              )),
                        ),
                        Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Text(
                              "Finished an Exercise",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                              ),
                            ))
                      ],
                    ))),
              ),
              Padding(
                padding: EdgeInsets.all(6.0),
                child: Container(
                    width: 400,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.lightBlue[300],
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Center(
                        child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Text("Zoo Keeper",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              )),
                        ),
                        Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Text(
                              "Finished Animals Module",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                              ),
                            ))
                      ],
                    ))),
              ),
              Padding(
                padding: EdgeInsets.all(6.0),
                child: Container(
                    width: 400,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.lightBlue[300],
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Center(
                        child: Column(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Text(
                              "Food Specialist",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            )),
                        Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Text(
                              "Finished Foods Module",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                              ),
                            ))
                      ],
                    ))),
              )
            ],
          ),
        ));
  }
}
