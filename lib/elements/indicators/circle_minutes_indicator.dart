import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timer/models/cirlce_indicator.dart';

class CircleMinutesIndicator extends StatefulWidget {
  circleIndicator c;
  CircleMinutesIndicator({required this.c});
  @override
  _CircleMinutesIndicatorState createState() => _CircleMinutesIndicatorState();
}

class _CircleMinutesIndicatorState extends State<CircleMinutesIndicator> {
  bool isActive = false;
  late circleIndicator circleModel;
  @override
  void initState() {
    super.initState();
    circleModel = widget.c;
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34,
      width: 34,
      child: Stack(
        children: [
          Center(
            child: CircularProgressIndicator(
              valueColor: const AlwaysStoppedAnimation(Colors.amber),
              backgroundColor: Colors.grey[350],
              value: circleModel.currentValue / circleModel.initValue,
            ),
          ),
          const Center(child: Text('30', style: TextStyle(fontSize: 15.0, color: Colors.white),),)
        ],
      ),
    );
  }
}
