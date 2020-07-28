import 'package:flutter/material.dart';
import 'package:virtual_isl_dictionary/services/unity_api.dart';

class RotateWidgetSlider extends StatefulWidget {
  String title;
  double min;
  double max;
  double width;
  UnityApi apiController;
  String valueUnit;
  IconData icon;
  double initialSliderValue;
  String type;
  RotateWidgetSlider({@required this.initialSliderValue, @required this.width, @required this.apiController, this.title, @required this.max, @required this.min, this.valueUnit, @required this.icon, @required this.type});
  @override
  State<StatefulWidget> createState() => new _RotateWidgetSliderState(this.width, this.apiController, this.title, this.max, this.min, this.valueUnit, this.icon, this.initialSliderValue, this.type);
}

class _RotateWidgetSliderState extends State<RotateWidgetSlider> {
  double width;
  UnityApi apiController;
  double sliderValue;
  String title;
  double min;
  double max;
  String valueUnit;
  IconData icon;
  String type;
  _RotateWidgetSliderState(this.width, this.apiController, this.title, this.max, this.min, this.valueUnit, this.icon, this.sliderValue, this.type);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      width: width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
        child: Column(
          children: <Widget>[
            title != null ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(title, style: TextStyle(color: Colors.grey),),
                Text(sliderValue.toStringAsFixed(2) + valueUnit, style: TextStyle(color: Colors.grey),),
              ],
            ) : Container(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(icon, color: Colors.grey,),
                Expanded(
                  child: Slider(
                    activeColor: Colors.lightBlue[200],
                    min: min,
                    max: max,
                    value: sliderValue,
                    onChanged: (value) {
                      setState(() {
                        sliderValue = value;
                      });
                      switch (type) {
                        case "rotation":
                          apiController.setRotationSpeed((sliderValue*-1).toString());
                          break;

                        case "playback":
                          apiController.setSpeed(sliderValue);
                          break;

                        default:
                          break;
                      }
                    }
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}