import 'package:flutter/material.dart';
import 'package:virtual_isl_dictionary/widgets/CustomDrawer.dart';

import '../User.dart';
import 'hand_page.dart';

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
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.lightBlue[200]),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Bookmarks", style: TextStyle(color: Colors.lightBlue[200]),),
      ),
      body: ListView(
        children: showBookmarks()
      ),
    );
  }

  showBookmarks() {
    List<ListTile> bookmarks = new List();
    for(int i = 0; i < user.bookmarks.length; i++) {
      bookmarks.add(ListTile(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => HandPage(searchParameter: user.bookmarks[i], user: this.user,)));
        },
        leading: IconButton(
          onPressed: () {
            deleteBookmark(user.bookmarks[i]);
          },
          icon: Icon(
            Icons.delete,
          ),
        ),
        title: Text(
          user.bookmarks[i]
        ),
        trailing: Icon(Icons.navigate_next),
      ));
    }
    return bookmarks;
  }

  deleteBookmark(String value) {
    setState(() {
      this.user.bookmarks.remove(value);
    });
  }
}