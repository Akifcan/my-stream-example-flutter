import 'package:flutter/material.dart';
import 'package:stream/home.dart';
import 'package:stream/splash.dart';
import 'package:stream/themeinheritedwidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isDark = true;
  @override
  Widget build(BuildContext context) {
    return ThemeInheritedWiget(
      onThemeUpdated: (bool value) {
        setState(() {
          _isDark = value;
        });
      },
      isThemeDark: _isDark,
      child: Theme(
        data: _isDark ? ThemeData.dark() : ThemeData.light(),
        child: const Splassh(),
      ),
    );
  }
}
