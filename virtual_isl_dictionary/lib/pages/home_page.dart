import 'package:flutter/material.dart';
import 'package:virtual_isl_dictionary/pages/hand_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          _showExampleButton(),
        ],
      ),
    );
  }

  Widget _showExampleButton() {
    return Positioned(
      top: 300,
      left: 100,
      child: RaisedButton(
        child: new Text('Go to hand page'),
        onPressed: () => {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HandPage()),
          )
        },
      ),
    );
  }
}
