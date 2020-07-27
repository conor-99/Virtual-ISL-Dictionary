import 'package:flutter/material.dart';
import 'package:virtual_isl_dictionary/main.dart';
import 'package:virtual_isl_dictionary/pages/hand_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _textEditingController = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              height: 93,
              color: Colors.blue,
              child: SafeArea(
                child: Center(
                  child:Text(
                    "Menu",
                    style: TextStyle(color: Colors.white, fontSize: 20),)
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.bookmark, color: Colors.blue,),
              title: Text("Bookmarks", style: TextStyle(color: Colors.blue),),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.explore, color: Colors.blue,),
              title: Text("Explore", style: TextStyle(color: Colors.blue),),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.school, color: Colors.blue,),
              title: Text("Learn", style: TextStyle(color: Colors.blue),),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.blue,),
              title: Text("Settings", style: TextStyle(color: Colors.blue),),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * .20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.pan_tool, color: Colors.blue, size:80,),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "Virtual ISL",
                    style: TextStyle(color: Colors.blue, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .1),
                  child: TextFormField(
                    autocorrect: true,
                    decoration: InputDecoration(
                      focusColor: Colors.indigo,
                      border: OutlineInputBorder(),
                      labelText: 'Search',
                    ),
                    controller: _textEditingController,
                  ),
                ),
              ],
            ),
          ),
        ]
      ),
    );
  }
}
