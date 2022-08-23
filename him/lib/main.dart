import 'package:flutter/material.dart';
import 'package:him/pages/student_login.dart';
import 'package:him/pages/teacher_login.dart';
import 'package:him/utilities/routes.dart';

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
      initialRoute: '/student_login',
      routes: {
        '/': (context) => LoginPage(),
        MyRoutes.student_loginRoute: (context) => LoginPage(),
        MyRoutes.Teacher_loginRoute: (context) => Teacher_LoginPage(),
      },
    );
  }
}
