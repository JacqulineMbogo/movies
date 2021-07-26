import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:movies/models/app_config.dart';
import 'package:movies/services/http_service.dart';
import 'package:movies/services/movies_service.dart';

class splashPage extends StatefulWidget {
  final VoidCallback onInitializationCompete;

  const splashPage({Key? key, required this.onInitializationCompete})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _splashPageState();
  }
}

class _splashPageState extends State<splashPage> {
  @override
  void initState() {
    super.initState();
   /* Future.delayed(Duration(seconds: 5))
        .then((_) =>
        _setUp(context).then((_) => widget.onInitializationCompete()));
*/
    _setUp(context).then((_) => widget.onInitializationCompete());
  }

  Future <void> _setUp(BuildContext _context) async {
    final getIt = GetIt.instance;
    final configFile = await rootBundle.loadString('assets/config/main.json');
    final configData = jsonDecode(configFile);

    getIt.registerSingleton<AppConfig>(AppConfig(
      configData['API_KEY'],
      configData['API_BASE_URL'],
      configData['BASE_IMAGE_URL'],
    ));

    getIt.registerSingleton<HttpService>(HttpService());

    getIt.registerSingleton<MoviesService>(MoviesService());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'movies',
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage(
                    'assets/images/logo.png',
                  ))),
        ),
      ),
    );
  }
}
