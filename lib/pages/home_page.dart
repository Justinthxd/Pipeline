import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            colorFilter: ColorFilter.mode(
              Colors.grey,
              BlendMode.lighten,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Space Balloons",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 60,
                shadows: [
                  BoxShadow(
                    blurRadius: 30,
                    color: Colors.white,
                    offset: Offset(0.0, 0.0),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.5),
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              width: 180,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  elevation: 0.0,
                ),
                child: FaIcon(
                  FontAwesomeIcons.play,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/Levelpage');
                },
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.5),
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              width: 180,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  elevation: 0.0,
                ),
                child: FaIcon(
                  FontAwesomeIcons.award,
                  size: 35,
                ),
                onPressed: () {},
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.5),
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              width: 180,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  elevation: 0.0,
                ),
                child: FaIcon(
                  Icons.settings,
                  size: 35,
                ),
                onPressed: () {},
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
