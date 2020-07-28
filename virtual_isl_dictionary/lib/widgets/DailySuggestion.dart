import 'package:flutter/material.dart';

class DailySuggestion extends StatefulWidget {
  DailySuggestion();
  @override
  State<StatefulWidget> createState() => new _DailySuggestionState();
}

class _DailySuggestionState extends State<DailySuggestion> {
  _DailySuggestionState();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*.9,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.grey[300],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(padding: EdgeInsets.symmetric(vertical: 7.5),),
            Container(
              width: MediaQuery.of(context).size.width*.4,
              height: MediaQuery.of(context).size.height*.035,
              color: Colors.redAccent,
              child: Center(
                child: Text(
                  "Daily Suggestion",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width*.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0,0,MediaQuery.of(context).size.width*0.05,0),
                        child: Icon(Icons.wb_sunny, color: Colors.white, size: MediaQuery.of(context).size.width * 0.1,),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("sunny", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
                          Text("Looks like today's forecast is sunny! \nLearn to sign this word", style: TextStyle(fontSize: 10),),
                        ],
                      ),
                    ],
                  ),
                  Icon(Icons.navigate_next),
                ],
              ),
            )
          ],
        )
      )
    );
  }

}