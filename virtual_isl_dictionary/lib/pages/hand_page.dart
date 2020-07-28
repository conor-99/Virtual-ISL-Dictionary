import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';
import 'package:virtual_isl_dictionary/services/unity_api.dart';
import 'package:virtual_isl_dictionary/widgets/RotateWidget.dart';

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

  IconData playPauseIcon = Icons.play_arrow;


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
                  onUnityViewCreated: (controller)
                  {
                    setState(() {
                      _apiController = new UnityApi(controller);
                      _apiController.show(searchParameter);
                    });
                  },
                  isARScene: false,
                ),
                height: MediaQuery.of(context).size.height*.7,
              ),
              Positioned(
                left: (MediaQuery.of(context).size.width - rotateWidgetWidth) / 2,
                top: MediaQuery.of(context).size.height * .02,
                child: _apiController != null ? RotateWidgetSlider(
                  type: "rotation",
                  icon: Icons.threesixty,
                  initialSliderValue: -180,
                  min: -360,
                  max: 0,
                  width: rotateWidgetWidth,
                  apiController: _apiController,
                ): Container(),
              )
            ],
          ),
          _apiController != null ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.replay, size: MediaQuery
                      .of(context)
                      .size
                      .width * .08, color: Colors.lightBlue[200],),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 10),),
                  GestureDetector(
                      child: Icon(playPauseIcon,
                        color: Colors.lightBlue[200],
                        size: MediaQuery.of(context).size.width * .15,
                      ),
                    onTap: () {
                      setState(() {
                        if(playPauseIcon == Icons.play_arrow) {
                          playPauseIcon = Icons.pause;
                          _apiController.play();
                        } else {
                          playPauseIcon = Icons.play_arrow;
                          _apiController.pause();
                        }
                      });
                    },
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 10),),
                  Icon(Icons.repeat, size: MediaQuery
                      .of(context)
                      .size
                      .width * .08, color: Colors.lightBlue[200],),
                ],
              ),
              RotateWidgetSlider(
                type: "playback",
                icon: Icons.fast_forward,
                title: "Playback Speed",
                valueUnit: "x",
                initialSliderValue: 1,
                width: MediaQuery.of(context).size.width*.9,
                apiController: _apiController,
                min: 0.25,
                max: 2,
              ),
            ],
          ) : Container(),
        ],
      )
    );
  }

  playPause() {
    print("what");

  }

  repeat(BuildContext context) {

  }

  replay(BuildContext context) {

  }
}
