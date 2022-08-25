import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:him/screens/homescreen.dart';
import 'package:him/screens/signUp.dart';
import 'package:him/screens/student_login.dart';
import 'package:him/screens/teacher_login.dart';
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
      //home: MyBottomNavigationBar(),
      home: signUp(),
      // Teacher_LoginPage(),
      // initialRoute: '/student_login',
      // routes: {
      //   '/': (context) => LoginPage(),
      //   MyRoutes.student_loginRoute: (context) => LoginPage(),
      //   MyRoutes.Teacher_loginRoute: (context) => Teacher_LoginPage(),
      // },
    );
  }
}

//Bottom Navigation Bar code
// class MyBottomNavigationBar extends StatefulWidget {
//   MyBottomNavigationBar({Key? key}) : super(key: key);

//   @override
//   State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
// }

// class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
//   int _currentIndex = 0;
//   final List<Widget> _children = [MyHomePage(),];

//   void onTappedBar(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       body: _children[_currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//           onTap: onTappedBar,
//           currentIndex: _currentIndex,
//           items: [
//             BottomNavigationBarItem(
//               icon: new Icon(CupertinoIcons.home),
//               label: "Home",
//             ),
//             BottomNavigationBarItem(
//               icon: new Icon(CupertinoIcons.bolt_fill),
//               label: "Self assesment",
//             ),
//             BottomNavigationBarItem(
//               icon: new Icon(Icons.contacts),
//               label: "Contact",
//             ),
//           ]),
//     );
//   }
// }
