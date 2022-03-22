import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timer/controllers/timer_controller.dart';

class TimerButton extends StatefulWidget {
  const TimerButton({Key? key}) : super(key: key);

  @override
  _TimerButtonState createState() => _TimerButtonState();
}

class _TimerButtonState extends State<TimerButton> {
  bool isActive = false;
  String label = 'FOCUS';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TimerController>(
      init: TimerController(),
      builder: (_) => GestureDetector(
        onTap: () {
          isActive ? _.pauseTimer() : _.startTimer();
            setState(() {
               isActive ? isActive = false : isActive = true;
               isActive ? label = 'STOP' : label = 'FOCUS';
             });
        },
        child: Container(
          height: 52,
          width: 180,
          decoration: const BoxDecoration(
              color: Color(0xFFFFFA85),
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          child: Center(
              child: Text(
            label,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: const Color(0xFF09B269)),
          )),
        ),
      ),
    );
  }
}
