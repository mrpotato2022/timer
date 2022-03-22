import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timer/controllers/timer_controller.dart';

class LinearTimerBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TimerController>(
      init: TimerController(),
      builder: (_) => RotatedBox(
          quarterTurns: 2,
          child: Container(
            width: 260,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(10.0))
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              child: LinearProgressIndicator(
                minHeight: 20.0,
                valueColor: const AlwaysStoppedAnimation(const Color(0xFF8EDCAF)),
                backgroundColor: const Color(0xFF09B269),
                value: _.currentSeconds.value / _.maxSeconds.value
              ),
            ),
          ),
        ),
    );
  }
}
