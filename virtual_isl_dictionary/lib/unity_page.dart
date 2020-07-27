import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';

class UnityTestingWrapper extends StatefulWidget {
  UnityTestingState createState() => UnityTestingState();
}

class UnityTestingState extends State<UnityTestingWrapper> {
  UnityWidgetController _unityWidgetController;
  double _sliderValue = 0.0;

  get onUnityMessage => null;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Virtual ISL Dictionary'),
        ),
        body: Card(
          margin: const EdgeInsets.all(8),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: -10,
                left: 0,
                right: 0,
                height: 250,
                child: UnityWidget(
                  onUnityViewCreated: onUnityCreated,
                  isARScene: true,
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Card(
                  elevation: 10,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text("Hand Rotation"),
                      ),
                      Slider(
                        onChanged: (value) {
                          setState(() {
                            _sliderValue = value;
                          });
                          setRotationSpeed(value.toString());
                        },
                        value: _sliderValue,
                        min: 0,
                        max: 360,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onUnityCreated(controller) {
    this._unityWidgetController = controller;
  }

  void setRotationSpeed(String speed) {
    _unityWidgetController.postMessage(
      'HandModel',
      'Rotate',
      speed,
    );
  }
}
