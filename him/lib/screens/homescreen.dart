import 'package:flutter/material.dart';

import '../utilities/routes.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text(
            'Take Survey',
          ),
          onPressed: () {
            Navigator.pushNamed(context, MyRoutes.surveyRoute);
            print("Redirected to survey.dart");
          },
          style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 123, 201, 125),
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 32.0),
              textStyle: TextStyle(fontSize: 27, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
