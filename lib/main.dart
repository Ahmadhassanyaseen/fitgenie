import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workout_fitness/firebase_options.dart';
import 'package:workout_fitness/view/login/on_boarding_view.dart';

import 'common/color_extension.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString("email");
  // print(email);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    // options: const FirebaseOptions(
    //   apiKey: "AIzaSyDGICMBuEk1T6liQjEGTa4PNoAtDJ8mMzs",
    //   appId: "1:315388194587:android:e45113e6006cd3390e2dbe",
    //   messagingSenderId: "849467206769",
    //   projectId: "fitgenie-528f7",
    // ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fit Genie',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Quicksand",
        colorScheme: ColorScheme.fromSeed(seedColor: TColor.primary),
        useMaterial3: false,
      ),
      home: const OnBoardingView(),
    );
  }
}
