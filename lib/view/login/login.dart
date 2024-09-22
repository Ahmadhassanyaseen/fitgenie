import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_fitness/view/login/logingetx.dart';
import 'package:workout_fitness/view/login/signup.dart';
import 'package:workout_fitness/view/login/step1_view.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    Loginlogic loginlogic = Get.put(Loginlogic());

    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/img/on_board_bg.png"),
              fit: BoxFit.fill),
        ),
        child: Center(
          child: Form(
              key: loginlogic.loginkey,

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
                  padding: EdgeInsets.only(top: 60),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller:    loginlogic.loginemailcontroller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      labelText: "Email Address or Phone Number",
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 18, left: 180),
                  child: TextButton(
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                TextFormField(
                  controller: loginlogic.loginpasswordController,
              
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    labelText: "Password",
                    suffixIcon: Icon(Icons.visibility),
                  ),
                ),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // const Text('text line'),
                        Row(
                          children: [
                            Checkbox(value: false, onChanged: (bool? value) {}),
                            const Expanded(
                              child: Text('Remember Me'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 0),
                  height: 70,
                  width: 280,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => const Step1View()));
                         loginlogic.onlogin();
                                loginlogic.loginemailcontroller.clear();
                                loginlogic.loginpasswordController.clear();
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
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20, left: 10),
                      child: const Text(
                        "If you don't have an account",
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
                          'Signup here',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 12,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Sign()));
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _navigateToNextScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const Step1View()));
}
