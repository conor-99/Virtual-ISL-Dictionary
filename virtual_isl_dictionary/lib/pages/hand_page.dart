import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';
import 'package:virtual_isl_dictionary/services/unity_api.dart';

class HandPage extends StatefulWidget {
  String searchParameter;
  HandPage({this.searchParameter});
  @override
  State<StatefulWidget> createState() => new _HandPageState(this.searchParameter);
}

class _HandPageState extends State<HandPage> {
  UnityWidgetController _unityWidgetController;
  double sliderValue = -180;
  String searchParameter;
  UnityApi _apiController;


  _HandPageState(this.searchParameter);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double rotateWidgetWidth = MediaQuery.of(context).size.width*.66;

    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[200],
        title: Text(
          this.searchParameter, style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                child: UnityWidget(
                  onUnityViewCreated: (controller) =>
                      {_apiController = new UnityApi(controller)},
                  isARScene: false,
                ),
                height: MediaQuery.of(context).size.height*.7,
              ),
              Positioned(
                left: (MediaQuery.of(context).size.width - rotateWidgetWidth) / 2,
                top: MediaQuery.of(context).size.height * .02,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  width: rotateWidgetWidth,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.symmetric(horizontal: 5),),
                      Icon(Icons.threesixty, color: Colors.grey,),
                      Expanded(
                        child: Slider(
                          min: -360,
                          max: 0,
                          value: sliderValue,
                          onChanged: (value) {
                            setState(() {
                              sliderValue = value;
                            });
                            _apiController.setRotationSpeed((sliderValue*-1).toString());
                          }
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Slider(
                min: -360,
                max: 0,
                value: sliderValue,
                onChanged: (value) {
                  setState(() {
                    sliderValue = value;
                  });
                  _apiController.setRotationSpeed((sliderValue*-1).toString());
                }
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.fast_rewind, size: MediaQuery
                      .of(context)
                      .size
                      .width * .1, color: Colors.lightBlue[200],),
                  Icon(Icons.play_arrow, size: MediaQuery
                      .of(context)
                      .size
                      .width * .1, color: Colors.lightBlue[200],),
                  Icon(Icons.fast_forward, size: MediaQuery
                      .of(context)
                      .size
                      .width * .1, color: Colors.lightBlue[200],),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  play() {

  }

  fastForward() {

  }

  rewind() {

  }
}
