import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';
import 'package:virtual_isl_dictionary/services/unity_api.dart';

class HandPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _HandPageState();
}

class _HandPageState extends State<HandPage> {
  UnityApi _apiController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          UnityWidget(
            onUnityViewCreated: (controller) =>
                {_apiController = new UnityApi(controller)},
            isARScene: true,
          )
        ],
      ),
    );
  }
}
