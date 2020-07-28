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
        title: Text(this.searchParameter, style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          UnityWidget(
            onUnityViewCreated: (controller) =>
                {_apiController = new UnityApi(controller)},
            isARScene: false,
          )
        ],
      ),
    );
  }
}
