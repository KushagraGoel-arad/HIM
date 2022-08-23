import 'package:flutter/material.dart';
import 'package:him/login.dart';
import 'package:him/teacher_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Happiness Index Meter',
      theme: ThemeData(primarySwatch: Colors.blue),
      // home: LoginPage(),
      // Teacher_LoginPage(),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/second': (context) => Teacher_LoginPage(),
      },
    );
  }
}
