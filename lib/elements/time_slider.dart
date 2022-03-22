import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:timer/controllers/timer_controller.dart';

class TimeSlider extends StatefulWidget {
  const TimeSlider({Key? key}) : super(key: key);
  @override
  _TimeSliderState createState() => _TimeSliderState();
}

class _TimeSliderState extends State<TimeSlider> {
  double _sliderValue = 1;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TimerController>(
      init: TimerController(),
      builder: (controller) =>  RotatedBox(
        quarterTurns: 3,
        child: SliderTheme(
          data: const SliderThemeData(
            trackHeight: 6.0
          ),
          child: Slider(
            value: _sliderValue,
            max: 6,
            min: 1,
            activeColor: const Color(0xFFFFFA85),
            inactiveColor: const Color(0xFFAFE5C9),
            onChanged: (double value) {
              setState(() {
                _sliderValue = value;
                controller.setSeconds(_sliderValue.toInt());
              });
            },
          ),
        ),
      ),
    );
  }
}

