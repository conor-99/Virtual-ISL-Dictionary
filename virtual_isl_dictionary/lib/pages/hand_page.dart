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
                  }),
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
}
