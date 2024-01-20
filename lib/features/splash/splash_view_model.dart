import 'package:flutter/material.dart';

class SplashViewModel extends ChangeNotifier {
  bool _isAnimated = true;

  bool get isAnimated => _isAnimated;

  void changeAnimation() {
    _isAnimated = !_isAnimated;
    notifyListeners();
  }
}
