import 'package:flutter/material.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.white,

      ),
    );
  }
}