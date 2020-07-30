import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:virtual_isl_dictionary/models/Challenge.dart';
import 'package:virtual_isl_dictionary/models/User.dart';
import 'package:virtual_isl_dictionary/pages/learn_page.dart';

class CompletedPage extends StatefulWidget {
  User user;
  Challenge challenge;
  CompletedPage({this.challenge, this.user});
  @override
  State<StatefulWidget> createState() => _CompletedPageState(this.challenge, this.user);
}

class _CompletedPageState extends State<CompletedPage> {
  User user;
  Challenge challenge;
  double percentComplete;
  _CompletedPageState(this.challenge, this.user);

  @override
  void initState() {
    percentComplete = challenge.percentageComplete();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Center(
          child: LinearPercentIndicator(
            width: MediaQuery.of(context).size.width*.65,
            lineHeight: 14,
            percent: this.percentComplete/100,
            backgroundColor: Colors.grey[200],
            progressColor: Color(0xff64dd17),
            animation: true,
            animationDuration: 200,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.lightBlue[200])
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(40),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
                ),
                child: Padding(
                  padding: const EdgeInsets.all(60),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "assets/images/complete.png",
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text("Well done!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),textAlign: TextAlign.center,),
                      ),
                      Text("You completed this category. You have unlocked the next level", textAlign: TextAlign.center,),
                    ],
                  ),
                ),
              ),
            ),
            RaisedButton(
              child: Text("Finish"),
              textColor: Colors.white,
              color: Color(0xff64dd17),
              onPressed: () {
                user.levelUp();
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LearningPage(
                          user: user,
                        )));
              },
            )
          ],
        ),
      ),
    );
  }

}