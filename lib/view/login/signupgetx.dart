import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_fitness/common_widget/commondialog.dart';
import 'package:workout_fitness/view/home/home_view.dart';

class SignupLogic extends GetxController {
  GlobalKey<FormState> signupkey = GlobalKey<FormState>();
  final signupemailcontroller = TextEditingController();
  final signuppasswordController = TextEditingController();
  final signupconfirmPasswordController = TextEditingController();
  final namecontroller = TextEditingController();
  final phonenumbercontroller = TextEditingController();
  final addresscontroller = TextEditingController();
  //  String username = '';

  void onsignup() async {
    try {
      if (signupkey.currentState!.validate()) {
        CommonDialog.showLoading();
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: signupemailcontroller.text,
          password: signuppasswordController.text.toString(),
        );
        // createUserDocuments(userCredential);
        // print(userCredential);

        try {
          var response = await FirebaseFirestore.instance
              .collection("users")
              .doc(userCredential.user!.email)
              .set({
            'uid': userCredential.user!.uid,
            'password': signuppasswordController.text,
            'email': signupemailcontroller.text.trim(),
            'phone': phonenumbercontroller.text.trim(),
          });
          // print("Firebase response 1111 ${response.uid}");
          CommonDialog.hideLoading();
          // Navigate to Login screen
          Get.offAll(() => const HomeView());
        } catch (exception) {
          CommonDialog.hideLoading();
          CommonDialog.showErrorDialog(
              description: "Account Created successfully");
          // print("Error Saving Data at firestore $exception");
        }
      }
    } on FirebaseAuthException catch (e) {
      CommonDialog.hideLoading();
      // if (e.code == 'weak-password') {
      //   CommonDialog.showErrorDialog(
      //       description: "The password provided is too weak.");
      // } else
      if (e.code == 'email is already in use') {
        CommonDialog.showErrorDialog(description: 'Email already exists');
      }
    } catch (e) {
      CommonDialog.hideLoading();
      CommonDialog.showErrorDialog(description: 'Something went Wrong');

      Get.snackbar('error', e.toString());
    }
  }

  Future<Map<String, dynamic>?> fetchUserData(String userId) async {
    try {
      var snapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('uid', isEqualTo: userId)
          .get();

      if (snapshot.docs.isNotEmpty) {
        return snapshot.docs.first.data();
      } else {
        return null;
      }
    } catch (e) {
      // print('Error fetching user data: $e');
      return null;
    }
  }

  // Future<void> createUserDocuments(UserCredential? userCredential) async {
  //   if (userCredential != null && userCredential.user != null) {
  //     await FirebaseFirestore.instance
  //         .collection("users")
  //         .doc(userCredential.user!.email)
  //         .set({
  //       AppStrings.userid: userCredential.user!.uid,
  //       AppStrings.firebaseusername: namecontroller.text.trim(),
  //       AppStrings.userpass: signuppasswordController.text,
  //       AppStrings.useremail: signupemailcontroller.text.trim(),
  //       AppStrings.userphone: phonenumbercontroller.text.trim(),
  //       AppStrings.useraddress: addresscontroller.text.trim()
  //     });
  //   }
  // }
}

// bool signupcontainsSpecialCharacter(String password) {
//   return password.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'));
// }

bool signupcontainsUppercaseLetter(String password) {
  return password.contains(RegExp(r'[A-Z]'));
}
