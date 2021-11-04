import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../pages/home_page.dart';
import 'pages/level_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom],
    );
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/Homepage',
      routes: {
        '/Homepage': (context) => HomePage(),
        '/Levelpage': (context) => LevelPage(),
      },
    );
  }
}
