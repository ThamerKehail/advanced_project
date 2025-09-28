import 'package:advanced_project/presentation/resources/routes_manager.dart';
import 'package:advanced_project/presentation/resources/theme_manager.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  // named constructor
  const MyApp._internal();
  // singleton instance
  static const MyApp _instance = MyApp._internal();
  // factory constructor
  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: getAppTheme(),
      onGenerateRoute: RouteGenerator.getRoute,
    );
  }
}
