import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:virtual_isl_dictionary/main.dart';
import 'package:virtual_isl_dictionary/pages/hand_page.dart';
import 'package:virtual_isl_dictionary/widgets/CustomDrawer.dart';
import 'package:virtual_isl_dictionary/widgets/CustomSliverAppBar.dart';
import 'package:virtual_isl_dictionary/widgets/SearchHeader.dart';
import 'package:virtual_isl_dictionary/widgets/ActionButton.dart';
import 'package:virtual_isl_dictionary/widgets/DailySuggestion.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

import '../User.dart';
import 'bookmark_page.dart';

class HomePage extends StatefulWidget {
  User user;
  HomePage({@required this.user});
  @override
  State<StatefulWidget> createState() => new _HomePageState(this.user);
}

class _HomePageState extends State<HomePage> {
  User user;
  TextEditingController _textEditingController = new TextEditingController();

  _HomePageState(this.user);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _textEditingController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    // change the status bar color to material color [green-400]
    FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    if (useWhiteForeground(Colors.white)) {
      FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    } else {
      FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    }
    WidgetsBinding.instance.renderView.automaticSystemUiAdjustment=false;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
    ));
    return SafeArea(
      child: new Scaffold(
        drawer: CustomDrawer(),
        body: CustomScrollView(
          slivers: <Widget>[
            CustomSliverAppBar(
              child: Column(
                children: <Widget>[
                  Image.asset("assets/images/logo.png",scale:5,),
                  Text(
                    "GoSign",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.lightBlue[200], fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ],
              )
            ),
            SearchHeader(
              child: Padding(
                padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*.1, 10, MediaQuery.of(context).size.width*.1, 10),
                child:  Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.all(Radius.circular(100))
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(8.0,0,0,0),
                    child: TextField(
                      onSubmitted: (String value) async {
                        if(value != "") {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HandPage(searchParameter: value, user: this.user,)));
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "Search",
                        border: InputBorder.none,
                        icon: Icon(Icons.search)
                      ),
                    ),
                  )
                ),
              )
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.symmetric(vertical: 15),),
                    DailySuggestion(user: user),
                    Padding(padding: EdgeInsets.symmetric(vertical: 10),),
                    ActionButton(
                      topColor: Color(0xff64dd17),
                      bottomColor: Color(0xff64dd17),
                      extended: true,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.school, color: Colors.white,size: 35,),
                          Padding(padding: EdgeInsets.all(5),),
                          Text("Learn", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),)
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 10),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ActionButton(
                          topColor: Colors.amberAccent[700],
                          bottomColor: Colors.amberAccent[700],
                          extended: false,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.explore, color: Colors.white,size: 35,),
                              Padding(padding: EdgeInsets.symmetric(vertical: 5),),
                              Text("Explore", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),)
                            ],
                          ),
                        ),
                        ActionButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => BookmarkPage(user: this.user,)));
                          },
                          topColor: Colors.lightBlueAccent,
                          bottomColor: Colors.lightBlueAccent,
                          extended: false,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.bookmark, color: Colors.white,size: 35,),
                              Padding(padding: EdgeInsets.all(5),),
                              Text("Bookmarks", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),)
                            ],
                          ),)
                      ],
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 10),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ActionButton(
                          topColor: Colors.redAccent,
                          bottomColor: Colors.redAccent,
                          extended: false,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.person, color: Colors.white,size: 35,),
                              Padding(padding: EdgeInsets.symmetric(vertical: 5),),
                              Text("Profile", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),)
                            ],
                          ),
                        ),
                        ActionButton(
                          topColor: Colors.yellow,
                          bottomColor: Colors.yellow,
                          extended: false,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.settings, color: Colors.white,size: 35,),
                              Padding(padding: EdgeInsets.all(5),),
                              Text("Settings", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),)
                            ],
                          ),)
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*.45,
                    )
                  ],
                )
              ])
            ),
          ],
        ),
      ),
    );
  }
}
