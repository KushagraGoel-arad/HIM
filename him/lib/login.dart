import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: w,
            height: h * 0.45,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('images/loginImage1.jpeg'),
              //fit: BoxFit.cover
            )),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            width: w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Student Login",
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Sign into your account",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[500],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          offset: Offset(1, 1),
                          color: Colors.grey.withOpacity(0.3),
                        )
                      ]),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'LoginID',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          offset: Offset(1, 1),
                          color: Colors.grey.withOpacity(0.3),
                        )
                      ]),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                    Text(
                      "Forget Password",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: w * 0.37,
            height: h * 0.07,
            child: ElevatedButton(
              child: Text(
                'Login',
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/second');
                print("Hi User");
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  padding: EdgeInsets.only(),
                  textStyle:
                      TextStyle(fontSize: 27, fontWeight: FontWeight.bold)),
            ),
            // child: Center(
            //   child: Text(
            //         "Sign into your account",
            //         style: TextStyle(
            //           fontSize: 15,
            //           color: Colors.grey[500],
            //         ),
            //       ),
            // ),
          ),
        ],
      ),
    ));
  }
}
