import 'dart:async';
import 'package:get/get.dart';
import 'package:timer/models/cirlce_indicator.dart';
import 'package:timer/elements/indicators/circle_minutes_indicator.dart';

class TimerController extends GetxController {
  int initValue = 1800;
  RxInt sliderValue = 1.obs;
  RxInt maxSeconds = 1800.obs;
  RxInt currentSeconds = 1800.obs;
  RxInt persents = 0.obs;
  RxInt mins = 0.obs;
  RxInt secs = 0.obs;
  late Timer timer;

  RxList<circleIndicator> circles = (List<circleIndicator>.of([])).obs;


  void setSeconds(int value) {
    switch (value) {
      case 1: {maxSeconds.value = initValue;}
        break;
      case 2: {maxSeconds.value = initValue * 2;}
        break;
      case 3: {maxSeconds.value = initValue * 3;}
        break;
      case 4: {maxSeconds.value = initValue * 4;}
        break;
      case 5: {maxSeconds.value = initValue * 5;}
        break;
      case 6: {maxSeconds.value = initValue * 6;}
        break;
    }


    void setCircles(int value) {
      if(circles.length < value) {
        circles.add(circleIndicator());
      } else {
        circles.remove(circles.last);
      }
      update();
    }

    currentSeconds.value = maxSeconds.value;
    setCircles(value);
    setTime();
    update();
  }

  void setTime() {
    mins.value = currentSeconds.value ~/ 60;
    secs.value = currentSeconds.value % 60;
    update();
  }

  void startTimer() {
    circles.first.startTimer();
    update();
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (currentSeconds.value > 0) {
        currentSeconds.value--;
        persents.value = 100 - ((currentSeconds.value / maxSeconds.value) * 100).toInt();
        setTime();
        update();
      } else {
        timer.cancel();
      }
    });
  }

  void pauseTimer() {
    timer.cancel();
  }
}
