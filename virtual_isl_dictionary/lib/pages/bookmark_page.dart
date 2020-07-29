import 'package:flutter/material.dart';
import 'package:virtual_isl_dictionary/widgets/CustomDrawer.dart';

import '../User.dart';

class BookmarkPage extends StatefulWidget {
  User user;
  BookmarkPage({this.user});
  @override
  State<StatefulWidget> createState() => new _BookmarkPageState(this.user);
}

class _BookmarkPageState extends State<BookmarkPage> {
  User user;
  _BookmarkPageState(this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.lightBlue[200]),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Bookmarks", style: TextStyle(color: Colors.lightBlue[200]),),
      ),
    );
  }
}