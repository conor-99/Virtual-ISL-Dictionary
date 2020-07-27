import 'package:flutter/material.dart';
import 'package:virtual_isl_dictionary/unity_page.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Virtual ISL Dictionary',
      theme: ThemeData.light(),
      home: DemoPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DemoPage extends StatefulWidget {
  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Show Hand Controller"),
              onPressed: () async {
                Navigator.of(context).push((MaterialPageRoute(
                    builder: (BuildContext context) => UnityTestingWrapper())));
              },
            ),
          ],
        ),
      ),
    );
  }
}
