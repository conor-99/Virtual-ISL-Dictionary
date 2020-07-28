import 'package:flutter_unity_widget/flutter_unity_widget.dart';

class UnityApi {
  static const String GAME_OBJECT = 'HandModelPivot';
  UnityWidgetController _controller;

  UnityApi(UnityWidgetController controller) {
    _controller = controller;
  }

  // Show the word/letter/etc. with the given name
  void show(String name) {
    _postMessage('ApiShow', name);
  }

  // Play the animation
  void play() {
    _postMessage('ApiPlay');
  }

  // Pause the animation
  void pause() {
    _postMessage('ApiPause');
  }

  // Go to the start of the animation
  void start() {
    _postMessage('ApiStart');
  }

  // Go to the end of the animation
  void end() {
    _postMessage('ApiEnd');
  }

  // Go to the next keyframe
  void next() {
    _postMessage('ApiNext');
  }

  // Go to the previous keyframe
  void previous() {
    _postMessage('ApiPrevious');
  }

  // Set the relative speed of the animation (0.25x to 2.0x)
  void setSpeed(double speed) {
    if (speed < 0.25 || speed > 2.0) return;

    _postMessage('ApiSpeed', speed.toString());
  }

  void setRotationSpeed(String speed) {
    /*_controller.postMessage(
      'HandModel',
      'Rotate',
      speed,
    );*/
  }

  void _postMessage(String method, [String parameter = '']) {
    _controller.postMessage(
      GAME_OBJECT,
      method,
      parameter,
    );
  }
}
