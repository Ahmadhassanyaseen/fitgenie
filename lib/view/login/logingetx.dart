import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_fitness/common_widget/commondialog.dart';
import 'package:workout_fitness/view/home/home_view.dart';
import 'package:workout_fitness/view/menu/menu_view.dart';

class Loginlogic extends GetxController {
  String? userId;
  GlobalKey<FormState> loginkey = GlobalKey<FormState>();
  final loginemailcontroller = TextEditingController();
  final loginpasswordController = TextEditingController();

  void signUserin() async {
    try {
      if (loginkey.currentState!.validate()) {
        CommonDialog.showLoading();
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: loginemailcontroller.text.trim(),
          password: loginpasswordController.text.trim(),
        );
        userId = userCredential.user!.uid;
        CommonDialog.hideLoading();

        // Navigate to HomeView after successful login
        Get.offAll(() => const MenuView());
        // Get.offAll(() => const HomeView());
      }
    } on FirebaseAuthException catch (e) {
      CommonDialog.hideLoading();
      CommonDialog.showErrorDialog(description: e.code);
    }
  }

  void onlogin() {
    if (loginkey.currentState!.validate()) {
      signUserin();
    }
  }
}
