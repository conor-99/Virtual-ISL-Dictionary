import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  var state;
  @override
  State<StatefulWidget> createState() => new _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  var state = ["Irish Sign Language", "English"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.lightBlue[200]),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Settings",
            style: TextStyle(color: Colors.lightBlue[200]),
          ),
        ),
        body: ListView(children: <Widget>[
          Card(
              child: ExpansionTile(
            title: Text("Sign Language",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                )),
            subtitle: Text(state[0],
                style: TextStyle(
                  fontSize: 13,
                )),
            trailing: Icon(Icons.navigate_next),
            children: <Widget>[
              Column(
                children: <Widget>[
                  ListTile(
                    title: Text("Irish Sign Language"),
                    onTap: () {
                      setState(() {
                        state[0] = "Irish Sign Language";
                      });
                    },
                  ),
                  ListTile(
                    title: Text("English Sign Language"),
                    onTap: () {
                      setState(() {
                        state[0] = "English Sign Language";
                      });
                    },
                  ),
                  ListTile(
                    title: Text("Spanish Sign Language"),
                    onTap: () {
                      setState(() {
                        state[0] = "Spanish Sign Language";
                      });
                    },
                  )
                ],
              )
            ],
          )),
          Card(
              child: ExpansionTile(
            title: Text("Text Language",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                )),
            subtitle: Text(
              state[1],
              style: TextStyle(fontSize: 13),
            ),
            trailing: Icon(Icons.navigate_next),
            children: <Widget>[
              Column(
                children: <Widget>[
                  ListTile(
                    title: Text("Irish"),
                    onTap: () {
                      setState(() {
                        state[1] = "Irish";
                      });
                    },
                  ),
                  ListTile(
                    title: Text("English"),
                    onTap: () {
                      setState(() {
                        state[1] = "English";
                      });
                    },
                  ),
                  ListTile(
                    title: Text("Spanish"),
                    onTap: () {
                      setState(() {
                        state[1] = "Spanish";
                      });
                    },
                  )
                ],
              )
            ],
          )),
          Card(
              child: ListTile(
            title: Text("Review Terms of Service",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                )),
            trailing: Icon(Icons.navigate_next),
          )),
          Card(
              child: ListTile(
            title: Text("Review Privacy Notice",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                )),
            trailing: Icon(Icons.navigate_next),
          )),
          Card(
              child: ListTile(
            title: Text("Sign In",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                )),
            trailing: Icon(Icons.navigate_next),
          )),
          Card(
              child: ListTile(
            title: Text("Create Account",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                )),
            trailing: Icon(Icons.navigate_next),
          )),
          Card(
              child: ListTile(
            title: Text("Delete All Data",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                )),
            trailing: Icon(Icons.navigate_next),
          )),
          Card(
              child: ListTile(
            title: Text("Request All Data",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                )),
            trailing: Icon(Icons.navigate_next),
          )),
        ]));
  }
}
