import 'package:flutter/material.dart';
import 'package:virtual_isl_dictionary/secondpage.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: DemoPage(),
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
            MaterialButton(
              child: Text("Test Unity"),
              minWidth: double.infinity,
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
