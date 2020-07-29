import 'package:flutter/material.dart';
import 'package:virtual_isl_dictionary/models/User.dart';

class CustomDrawer extends StatefulWidget {
  CustomDrawer();
  @override
  State<StatefulWidget> createState() => new _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  _CustomDrawerState();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * .2,
            color: Colors.lightBlueAccent,
            child: SafeArea(
              child: Center(
                  child: Text(
                "Menu",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.bookmark,
              color: Colors.blue,
            ),
            title: Text(
              "Bookmarks",
              style: TextStyle(color: Colors.blue),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.explore,
              color: Colors.blue,
            ),
            title: Text(
              "Explore",
              style: TextStyle(color: Colors.blue),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.school,
              color: Colors.blue,
            ),
            title: Text(
              "Learn",
              style: TextStyle(color: Colors.blue),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.blue,
            ),
            title: Text(
              "Settings",
              style: TextStyle(color: Colors.blue),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
