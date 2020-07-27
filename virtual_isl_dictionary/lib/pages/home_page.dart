import 'package:flutter/material.dart';
import 'package:virtual_isl_dictionary/main.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              height: 93,
              color: Colors.blue,
              child: Center(
                child:Text("MENU")
              ),
            )
          ],
        ),
      ),
    );
  }
}
