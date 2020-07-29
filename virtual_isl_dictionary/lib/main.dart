import 'package:flutter/material.dart';
import 'package:virtual_isl_dictionary/pages/hand_page.dart';
import 'package:virtual_isl_dictionary/pages/home_page.dart';

import 'User.dart';

void main() {
  runApp(new App());
}

class App extends StatelessWidget {
  User user = new User();
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: new HomePage(user: user,),
    );
  }
}
