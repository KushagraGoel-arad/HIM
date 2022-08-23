import 'package:flutter/material.dart';
import 'package:him/utilities/routes.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });

      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.Teacher_loginRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

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
                  height: 10,
                ),
                Text(
                  "Welcome $name",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 35,
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
                    decoration: InputDecoration(
                      hintText: 'Username',
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Username cannot be empty";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      name = value;
                      setState(() {
                        //it will change UI
                        //it will call build method again only in case of stateful widget.
                      });
                    },
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
                      hintText: 'Password',
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password cannot be empty";
                      }
                      if (value.length < 6) {
                        return "Password length should be atleast 6";
                      }
                      return null;
                    },
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
                Navigator.pushNamed(context, MyRoutes.Teacher_loginRoute);
                print("Hi User");
              },
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 123, 201, 125),
                  padding:
                      EdgeInsets.symmetric(vertical: 0.0, horizontal: 32.0),
                  textStyle:
                      TextStyle(fontSize: 27, fontWeight: FontWeight.bold)),
            ),
          ),
          SizedBox(
            height: w * 0.08,
          ),
          RichText(
              text: TextSpan(
                  text: "Don\'t have an account?",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 20,
                  ))),
        ],
      ),
    ));
  }
}
