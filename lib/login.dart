import 'dart:js_util';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool? _passwordVisible = true;

  void _toggle() {
    setState(() {
      if (_passwordVisible == false) {
        _passwordVisible = true;
      } else {
        _passwordVisible = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 30),
            child: Row(
              children: [
                Text(
                  "Linked",
                  style: TextStyle(
                    color: Color.fromARGB(255, 23, 106, 175),
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                Image.asset(
                  "assets/img/download.png",
                  height: 30,
                  width: 30,
                )
              ],
            ),
          ),

          //
          SizedBox(
              child: Padding(
            padding: const EdgeInsets.only(left: 85, top: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 320),
                  child: Text(
                    "Sign in",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w500),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 160),
                  child: Text("Stay updated on your professional world",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.normal)),
                ),

                //
                SizedBox(
                  height: 30,
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 60),
                  child: SizedBox(
                    width: 350,
                    child: TextFormField(
                      autofocus: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Email or Phone",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 60),
                  child: SizedBox(
                    width: 350,
                    child: TextFormField(
                      obscureText: _passwordVisible!,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Password",
                        suffixIcon: IconButton(
                          icon: Icon(_passwordVisible!
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            _toggle();
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 285),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(color: Colors.blue[600]),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 60),
                  child: SizedBox(
                    width: 350,
                    height: 50,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28.0),
                            side: BorderSide(color: Colors.lightBlue.shade900),
                          )),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.lightBlue.shade900),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                              color: Color.fromARGB(255, 246, 246, 246)),
                        )),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                Padding(
                  
                  padding: const EdgeInsets.only(right: 60),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(child: Divider()),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Or"),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(child: Divider()),
                      ]),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 60),
                  child: SizedBox(
                    width: 350,
                    height: 50,
                    child: SignInButton(
                      Buttons.Google,
                      onPressed: () {
                        _showButtonPressDialog(context, 'Google');
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 60),
                  child: SizedBox(
                    width: 350,
                    height: 50,
                    child: SignInButton(
                      Buttons.Apple,
                      onPressed: () {
                        _showButtonPressDialog(context, 'Apple');
                      },
                      shape: ShapeBorder.lerp(Border(), Border(), 10),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 70),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("New to LinkedIn?"),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Join now",
                            style: TextStyle(color: Colors.blue[600]),
                          ))
                    ],
                  ),
                )
              ],
            ),

            //
          )),
        ],
      ),
    ));
  }

  void _showButtonPressDialog(BuildContext context, String provider) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('$provider Button Pressed!'),
      backgroundColor: Colors.black26,
      duration: Duration(milliseconds: 400),
    ));
  }
}
