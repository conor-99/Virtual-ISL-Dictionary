import 'package:flutter/material.dart';
import 'package:virtual_isl_dictionary/pages/hand_page.dart';
import 'package:weather/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:virtual_isl_dictionary/models/User.dart';

class DailySuggestion extends StatefulWidget {
  User user;
  DailySuggestion({this.user});
  @override
  State<StatefulWidget> createState() => new _DailySuggestionState(this.user);
}

class _DailySuggestionState extends State<DailySuggestion>
    with TickerProviderStateMixin {
  User user;
  String suggestedWord;
  _DailySuggestionState(this.user);

  @override
  void initState() {
    super.initState();
    asyncInitState();
  }

  void asyncInitState() async {
    String word = "sunny";
    setState(() {
      this.suggestedWord = word;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (suggestedWord != null) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HandPage(
                        searchParameter: suggestedWord,
                        user: this.user,
                      )));
        }
      },
      child: SizedBox(
          width: MediaQuery.of(context).size.width * .9,
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.grey[300],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 7.5),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .4,
                    height: MediaQuery.of(context).size.height * .035,
                    color: Colors.redAccent,
                    child: Center(
                      child: Text(
                        "Daily Suggestion",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  suggestedWord != null
                      ? Padding(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width * .04),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        0,
                                        0,
                                        MediaQuery.of(context).size.width *
                                            0.05,
                                        0),
                                    child: Icon(
                                      Icons.wb_sunny,
                                      color: Colors.white,
                                      size: MediaQuery.of(context).size.width *
                                          0.1,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        suggestedWord,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Looks like today's forecast is " +
                                            suggestedWord +
                                            "! \nLearn to sign this word",
                                        style: TextStyle(fontSize: 10),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Icon(Icons.navigate_next),
                            ],
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.all(50),
                          child: SpinKitThreeBounce(
                            color: Colors.white,
                            size: 20,
                            controller: AnimationController(
                                vsync: this,
                                duration: const Duration(milliseconds: 1200)),
                          ),
                        ),
                ],
              ))),
    );
  }

  getWeather() async {
    WeatherFactory wf = new WeatherFactory("190a2ef716e0d6ae3f5ab5d747ece459");
    Weather weather = await wf.currentWeatherByCityName("Dublin");
    return weather.weatherDescription;
  }
}
