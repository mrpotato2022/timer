import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timer/controllers/timer_controller.dart';
import 'package:timer/elements/buttons/timer_button.dart';
import 'package:timer/elements/indicators/circle_minutes_indicator.dart';
import 'package:timer/elements/indicators/percent_timer_bar.dart';
import 'package:timer/elements/time_slider.dart';
import 'package:get/get.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}
class _MainScreenState extends State<MainScreen> {
  bool isActive = false;
  String parseSeconds(String seconds) {
    if (seconds.length <= 1) return '0$seconds';
    return seconds;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF8EDCAF),
      body: Container(
        child: GetBuilder<TimerController>(
            init: TimerController(),
            builder: (_) => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 70),
                  child: Text('Completed ${_.persents}%', style: TextStyle(fontSize: 16.0,  fontWeight: FontWeight.bold, color: Colors.white),) ,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: LinearTimerBar(),
                ),
                 Padding(
                  padding: const EdgeInsets.only(top: 80.0, right: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                       TimeSlider()
                    ],
                  )
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: _.circles.length,
                        itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0),
                          child: CircleMinutesIndicator(
                          c: _.circles[index],
                          )

                      );
                    })
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Text(
                      '${_.mins.value} : ' + parseSeconds(_.secs.value.toString()),
                    style: const TextStyle(fontSize: 50.0, color: Colors.white),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 40.0),
                  child:  TimerButton(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60.0, bottom: 10.0),
                  child: Center(
                    child: Container(
                      height: 5.0,
                      width: 140,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20.0))
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
    );
  }
}
