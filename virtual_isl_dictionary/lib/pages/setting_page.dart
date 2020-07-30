import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
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
            subtitle: Text("Irish Sign Language",
                style: TextStyle(
                  fontSize: 13,
                )),
            trailing: Icon(Icons.navigate_next),
            children: <Widget>[
              Column(
                children: <Widget>[
                  ListTile(title: Text("Irish Sign Language")),
                  ListTile(title: Text("English Sign Language")),
                  ListTile(title: Text("Spanish Sign Language"))
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
              "English",
              style: TextStyle(fontSize: 13),
            ),
            trailing: Icon(Icons.navigate_next),
            children: <Widget>[
              Column(
                children: <Widget>[
                  ListTile(title: Text("Irish")),
                  ListTile(title: Text("English")),
                  ListTile(title: Text("Spanish"))
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
