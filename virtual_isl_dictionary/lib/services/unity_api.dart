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

  // Replay the animation
  void replay() {
    _postMessage('ApiReplay');
  }

  // Turn looping on or off
  void setLooping(bool status) {
    _postMessage('ApiLoop', status.toString());
  }

  // Set the relative speed of the animation (0.25x to 2.0x)
  void setSpeed(double speed) {
    if (speed < 0.25 || speed > 2.0) return;

    _postMessage('ApiSpeed', speed.toString());
  }

  // Rotate the model
  void setRotation(double degrees) {
    if (degrees < 0 || degrees > 360) return;

    _postMessage('ApiRotate', degrees.toString());
  }

  // Check if the model is playing
  bool isPlaying() {
    return true;
  }

  void _postMessage(String method, [String parameter = '']) {
    _controller.postMessage(
      GAME_OBJECT,
      method,
      parameter,
    );
  }
}
