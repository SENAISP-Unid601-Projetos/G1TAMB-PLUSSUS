// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:aplicativomobile/routegenerator.dart';
import 'package:flutter/services.dart';
// ignore: unused_import
import 'fichamedica.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then(
    (_) => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      onGenerateRoute: RouteGenerator.generateRoute,
    )),
  );
  // runApp(const MaterialApp(
  //   debugShowCheckedModeBanner: false,
  //   initialRoute: "/",
  //   onGenerateRoute: RouteGenerator.generateRoute,
  // ));
}
