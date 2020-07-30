import 'package:flutter/material.dart';
import 'package:virtual_isl_dictionary/models/Challenge.dart';
import 'package:virtual_isl_dictionary/widgets/CustomDrawer.dart';
import 'package:virtual_isl_dictionary/models/User.dart';
import 'hand_page.dart';

class ChallengeListPage extends StatefulWidget {
  User user;
  Challenge challenge;
  ChallengeListPage({this.user, this.challenge});
  @override
  State<StatefulWidget> createState() => new _ChallengeListPageState(this.user, this.challenge);
}

class _ChallengeListPageState extends State<ChallengeListPage> {
  User user;
  Challenge challenge;
  _ChallengeListPageState(this.user, this.challenge);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.lightBlue[200]),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          challenge.title,
          style: TextStyle(color: Colors.lightBlue[200]),
        ),
        actions: <Widget>[
          !challenge.isComplete() ? Padding(
            padding: const EdgeInsets.all(15),
            child: FlatButton(
              child: challenge.percentageComplete() == 0 ? Text("Start test"): Text("Continue test"),
              color: Color(0xff64dd17),
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HandPage(
                          isLearning: true,
                          user: this.user,
                          searchParameter: this.challenge.nextWord(),
                          challenge: this.challenge,
                        )));
              },
            ),
          ) : Container()
        ],
      ),
      body: ListView(children: showList()),
    );
  }

  showList() {
    List<ListTile> bookmarks = new List();
    for (int i = 0; i < challenge.words.length; i++) {
      bookmarks.add(ListTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HandPage(
                    searchParameter: challenge.words[i]["word"],
                    user: this.user,
                  )));
        },
        title: Text(challenge.words[i]["word"]),
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
