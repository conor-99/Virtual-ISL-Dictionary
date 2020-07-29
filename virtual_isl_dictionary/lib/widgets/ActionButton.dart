import 'package:flutter/material.dart';

class ActionButton extends StatefulWidget {
  GestureTapCallback onPressed;
  bool extended;
  Widget child;
  Color topColor;
  Color bottomColor;
  ActionButton({this.child, this.extended, this.topColor, this.bottomColor, this.onPressed});
  @override
  State<StatefulWidget> createState() => new _ActionButtonState(this.child, this.extended, this.topColor, this.bottomColor, this.onPressed);
}

class _ActionButtonState extends State<ActionButton> {
  GestureTapCallback onPressed;
  bool extended = false;
  Color topColor;
  Color bottomColor;
  Widget child;
  _ActionButtonState(this.child, this.extended, this.topColor, this.bottomColor, this.onPressed);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        height: MediaQuery.of(context).size.height*.20,
        width: extended ? MediaQuery.of(context).size.width*.9 : MediaQuery.of(context).size.width*.425,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            gradient: LinearGradient(colors: [this.topColor, this.bottomColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(child: child),
        ),
      ),
    );
  }

}