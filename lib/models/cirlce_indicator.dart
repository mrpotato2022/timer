import 'dart:async';

class circleIndicator {
  int initValue = 1800;
  int currentValue = 1800;
  bool isActive = false;
  late Timer timer;

  void startTimer() {
    isActive = true;
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (currentValue > 0) {
        currentValue--;
      } else {
        timer.cancel();
        isActive = false;
      }
    });
  }
  void pauseTimer() {
    timer.cancel();
  }
}