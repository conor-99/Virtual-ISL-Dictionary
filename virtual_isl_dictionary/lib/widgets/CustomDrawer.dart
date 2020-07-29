import 'package:flutter/material.dart';
import 'package:virtual_isl_dictionary/models/User.dart';
import 'package:virtual_isl_dictionary/pages/hand_page.dart';
import 'package:virtual_isl_dictionary/pages/learn_page.dart';
import 'package:virtual_isl_dictionary/pages/bookmark_page.dart';

class CustomDrawer extends StatefulWidget {
  User user;
  CustomDrawer({this.user});
  @override
  State<StatefulWidget> createState() => new _CustomDrawerState(this.user);
}

class _CustomDrawerState extends State<CustomDrawer> {
  User user;
  _CustomDrawerState(this.user);
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
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BookmarkPage(
                        user: this.user,
                      )));
            },
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
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LearningPage(
                        user: this.user,
                      )));
            },
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
