import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';
import 'package:virtual_isl_dictionary/services/unity_api.dart';
import 'package:virtual_isl_dictionary/widgets/RotateWidget.dart';

class HandPage extends StatefulWidget {
  String searchParameter;
  HandPage({this.searchParameter});
  @override
  State<StatefulWidget> createState() =>
      new _HandPageState(this.searchParameter);
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
    double rotateWidgetWidth = MediaQuery.of(context).size.width * .66;

    return new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue[200],
          title: Text(
            this.searchParameter,
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  child: UnityWidget(
                    onUnityViewCreated: (controller) {
                      setState(() {
                        _apiController = new UnityApi(controller);
                      });
                    },
                    isARScene: false,
                  ),
                  height: MediaQuery.of(context).size.height * .7,
                ),
                Positioned(
                  left:
                      (MediaQuery.of(context).size.width - rotateWidgetWidth) /
                          2,
                  top: MediaQuery.of(context).size.height * .02,
                  child: _apiController != null
                      ? RotateWidgetSlider(
                          type: "rotation",
                          icon: Icons.threesixty,
                          initialSliderValue: -180,
                          min: -360,
                          max: 0,
                          width: rotateWidgetWidth,
                          apiController: _apiController,
                        )
                      : null,
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // DELETE THIS - JUST USED FOR TESTING
                    // -----------------------------------
                    IconButton(
                      icon: new Icon(Icons.play_arrow),
                      highlightColor: Colors.lightBlue[200],
                      onPressed: () => {
                        _apiController.show(
                            'example'), // this line should actually be called when this page is opened - it's only here for testing
                        _apiController.play()
                      },
                    ),
                    // -----------------------------------
                    Icon(
                      Icons.replay,
                      size: MediaQuery.of(context).size.width * .1,
                      color: Colors.lightBlue[200],
                    ),
                    Icon(
                      Icons.play_arrow,
                      size: MediaQuery.of(context).size.width * .1,
                      color: Colors.lightBlue[200],
                    ),
                  ],
                ),
                _apiController != null
                    ? RotateWidgetSlider(
                        type: "playback",
                        icon: Icons.fast_forward,
                        title: "Playback Speed",
                        valueUnit: "x",
                        initialSliderValue: 1,
                        width: MediaQuery.of(context).size.width * .9,
                        apiController: _apiController,
                        min: 0.25,
                        max: 2,
                      )
                    : Container(),
              ],
            )
          ],
        ));
  }

  play() {}

  fastForward() {}

  rewind() {}
}
