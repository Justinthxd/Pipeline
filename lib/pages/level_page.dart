import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class LevelPage extends StatefulWidget {
  LevelPage({Key? key}) : super(key: key);

  @override
  _LevelPageState createState() => _LevelPageState();
}

class _LevelPageState extends State<LevelPage> {
  double shipPosition = 145;
  double rocketPosition = 550;

  bool rocketAux = false;

  final _random = Random();

  double b1 = 360;
  double b2 = 410;
  double b3 = 500;
  double b4 = 440;
  double b5 = 360;
  double b6 = 560;

  late Timer timer;
  late Timer timerRocket;

  int timeMinute = 2;
  int timeSeconds = 60;

  int record = 0;

  @override
  void initState() {
    // Reloj
    timer = Timer.periodic(Duration(seconds: 1), (time) {
      setState(() {
        timeSeconds -= 1;
        if (timeMinute == 0 && timeSeconds == 0) {
          time.cancel();
        } else {
          if (timeSeconds == 0) {
            timeMinute -= 1;
            timeSeconds = 60;
          }
        }
      });
    });
    // Balloon
    Timer.periodic(Duration(milliseconds: 6), (timer) {
      rocketAux ? rocketPosition -= 5 : rocketPosition = 550;

      if (rocketPosition == -20) {
        rocketAux = false;
        rocketPosition = 550;
      }

      if ((rocketPosition < 60 && rocketPosition > 20) &&
          (b1 < shipPosition + 20 && b1 > shipPosition - 20)) {
        b1 = 360;
        rocketAux = false;
        rocketPosition = 550;
        record += 5;
      }

      if ((rocketPosition < 170 && rocketPosition > 110) &&
          (b2 < shipPosition + 20 && b2 > shipPosition - 20)) {
        b2 = 410;
        rocketAux = false;
        rocketPosition = 550;
        record += 5;
      }

      if ((rocketPosition < 260 && rocketPosition > 220) &&
          (b3 < shipPosition + 20 && b3 > shipPosition - 20)) {
        b3 = 500;
        rocketAux = false;
        rocketPosition = 550;
        record += 5;
      }

      if ((rocketPosition < 320 && rocketPosition > 260) &&
          (b4 < shipPosition + 20 && b4 > shipPosition - 20)) {
        b4 = 440;
        rocketAux = false;
        rocketPosition = 550;
        record += 5;
      }

      if ((rocketPosition < 356 && rocketPosition > 296) &&
          (b5 < shipPosition + 20 && b5 > shipPosition - 20)) {
        b5 = 360;
        rocketAux = false;
        rocketPosition = 550;
        record += 5;
      }

      if ((rocketPosition < 476 && rocketPosition > 436) &&
          (b6 < shipPosition + 20 && b6 > shipPosition - 20)) {
        b6 = 560;
        rocketAux = false;
        rocketPosition = 550;
        record += 5;
      }

      if (b1 > -60) {
        b1 -= 0.9;
      } else {
        b1 = 360;
      }
      if (b2 > -60) {
        b2 -= 1.05;
      } else {
        b2 = 410;
      }
      if (b3 > -60) {
        b3 -= 1;
      } else {
        b3 = 500;
      }
      if (b4 > -60) {
        b4 -= 0.95;
      } else {
        b4 = 440;
      }
      if (b5 > -60) {
        b5 -= 1.3;
      } else {
        b5 = 360;
      }
      if (b6 > -60) {
        b6 -= 1;
      } else {
        b6 = 560;
      }
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: rocketPosition,
              top: shipPosition + 18,
              child: Container(
                height: 50,
                child: RotatedBox(
                  quarterTurns: -1,
                  child: Image.asset("assets/rockets.png"),
                ),
              ),
            ),
            Positioned(
              right: 20,
              top: shipPosition,
              child: Container(
                height: 80,
                child: Image.asset("assets/ufo.png"),
              ),
            ),
            Positioned(
              right: 35,
              top: 5,
              child: Container(
                height: MediaQuery.of(context).size.width / 1.85,
                child: RotatedBox(
                  quarterTurns: 1,
                  child: Slider(
                    activeColor: Colors.transparent,
                    inactiveColor: Colors.transparent,
                    thumbColor: Colors.transparent,
                    value: shipPosition,
                    min: 0,
                    max: 280,
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        shipPosition = value;
                      });
                    },
                  ),
                ),
              ),
            ),
            balloon(b1, 40, "b1"),
            balloon(b2, 140, "b2"),
            balloon(b3, 220, "b3"),
            balloon(b4, 290, "b4"),
            balloon(b5, 326, "b5"),
            balloon(b6, 456, "b6"),
            Positioned(
              top: 10,
              right: 30,
              child: GestureDetector(
                onTap: () {
                  rocketAux = true;
                },
                onDoubleTap: () {
                  rocketAux = false;
                },
                child: Container(
                  height: 60,
                  child: Text(
                    timeMinute.toString() + ":" + timeSeconds.toString(),
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 20,
              child: GestureDetector(
                child: Container(
                  height: 60,
                  child: Text(
                    record.toString(),
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget balloon(double x, double y, String b) {
    return Positioned(
      top: x,
      left: y,
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (b == "b1") {
              b1 = 360;
            }
            if (b == "b2") {
              b2 = 410;
            }
            if (b == "b3") {
              b3 = 500;
            }
            if (b == "b4") {
              b4 = 440;
            }
            if (b == "b5") {
              b5 = 360;
            }
            if (b == "b6") {
              b6 = 560;
            }
          });
        },
        child: Container(
          height: 60,
          child: Image.asset("assets/balloon.png"),
        ),
      ),
    );
  }

  Positioned cake(double x, double y) {
    return Positioned(
      bottom: x,
      left: y,
      child: Container(
        height: 60,
        child: Image.asset("assets/cake.png"),
      ),
    );
  }
}
