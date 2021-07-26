import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies/pages/main_page.dart';
import 'package:movies/pages/splash_page.dart';

void main() {
  runApp(
    splashPage(
        key: UniqueKey(), onInitializationCompete: () => runApp( ProviderScope(child: MyApp()))),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies',
      initialRoute: 'home',
      routes: {'home': (BuildContext _contect) => mainPage()},
      theme: ThemeData(
          primarySwatch: Colors.cyan,
          visualDensity: VisualDensity.adaptivePlatformDensity),
    );
  }
}
