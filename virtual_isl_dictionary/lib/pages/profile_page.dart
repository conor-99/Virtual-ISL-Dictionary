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
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ClipOval(
                child: Image(
                    fit: BoxFit.scaleDown,
                    height: 150,
                    width: 150,
                    image: AssetImage('assets/images/profile.png')
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*.1, vertical: MediaQuery.of(context).size.height*.02),
                child: LinearPercentIndicator(
                  animation: true,
                  lineHeight: 30,
                  animationDuration: 1800,
                  percent: 0.8,
                  center: Text("Level " + user.level.toString(), style: TextStyle(fontWeight: FontWeight.bold),),
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: Colors.yellow[300],
                  backgroundColor: Colors.grey[300],
                ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(0,0,0,20),
                  child: Text("Log in to Save Progress",
                      style: TextStyle(
                        color: Colors.blue[300],
                        fontSize: 16,
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
                    decoration: BoxDecoration(
                        color: Colors.lightBlue[300],
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
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
                      )),
                    )),
              ),
              Padding(
                padding: EdgeInsets.all(6.0),
                child: Container(
                    width: 400,
                    decoration: BoxDecoration(
                        color: Colors.lightBlue[300],
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
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
                      )),
                    )),
              ),
              Padding(
                padding: EdgeInsets.all(6.0),
                child: Container(
                    width: 400,
                    decoration: BoxDecoration(
                        color: Colors.lightBlue[300],
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
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
                      )),
                    )),
              ),
              Padding(
                padding: EdgeInsets.all(6.0),
                child: Container(
                    width: 400,
                    decoration: BoxDecoration(
                        color: Colors.lightBlue[300],
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
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
                      )),
                    )),
              )
            ],
          ),
        ));
  }
}
