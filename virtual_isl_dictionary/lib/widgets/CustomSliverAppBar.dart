import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatefulWidget {
  Widget child;
  CustomSliverAppBar({this.child});
  @override
  State<StatefulWidget> createState() => new _CustomSliverAppBarState(this.child);
}

class _CustomSliverAppBarState extends State<CustomSliverAppBar> {
  Widget child;
  _CustomSliverAppBarState(this.child);
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.height*.3,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.lightBlue[200]),
      floating: false,
      pinned: false,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        collapseMode: CollapseMode.pin,
        background: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(padding: EdgeInsets.symmetric(vertical: 10),),
              Hero(
                tag: 'logo',
                child: child
              ),

            ],
          ),
        ),
      ),
    );
  }

}