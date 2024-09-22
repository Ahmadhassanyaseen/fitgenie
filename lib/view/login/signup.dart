// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_fitness/view/login/login.dart';
import 'package:workout_fitness/view/login/signupgetx.dart';

class Sign extends StatefulWidget {
  const Sign({super.key});

  @override
  State<Sign> createState() => _SignState();
}

class _SignState extends State<Sign> {
  @override
  Widget build(BuildContext context) {
    SignupLogic signupLogic = Get.put(SignupLogic());

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/on_board_bg.png"),
          ),
        ),
        child: Center(
          child: Form(
              key: signupLogic.signupkey,

            child: ListView(
              padding: const EdgeInsets.only(left: 30, right: 30),
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 100),
                  height: 80,
                  width: 80,
                  child: const Text(
                    'FitGenie',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xffFF9B70),
                        fontSize: 60,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(30),
                ),
                TextFormField(
                  controller:  signupLogic.signupemailcontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    labelText: "Email Address",
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                ),
                TextFormField(
                  controller: 
                                signupLogic.phonenumbercontroller,

                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    labelText: "Phone Number (Optional)",
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                ),
                TextFormField(
                  controller: 
                                signupLogic.signuppasswordController,

                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    labelText: "Password",
                    suffixIcon: Icon(Icons.visibility_off),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                ),
                TextFormField(
                   validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Error';
                              }
                              if (value.length < 6) {
                                return 'Use strong Password';
                              }
                              if (value !=
                                  signupLogic.signuppasswordController.text) {
                                return "Password does not match";
                              }
                              return null;
                            },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    labelText: "Confirm Password",
                    suffixIcon: Icon(Icons.visibility_off),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 40),
                  height: 70,
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => const Step1View()));
                                signupLogic.onsignup();

                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      backgroundColor: const Color(0xffFF9B70),
                      side: const BorderSide(
                        width: 1,
                        color: Colors.white,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: const Text(
                          "If you already have an account?",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: TextButton(
                          child: const Text(
                            'Login here',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 10,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LoginScreen()));
  }
}
