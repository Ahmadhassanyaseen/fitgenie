// ignore_for_file: sized_box_for_whitespace

import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CommonDialog {
  static showLoading({String title = 'loading'}) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: 40,
            child: Row(
              children: [
                const SizedBox(width: 20),
                const Center(
                  child: CircularProgressIndicator.adaptive(
                  
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  title,
                ),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  static hideLoading() {
    Get.back();
  }

  static showErrorDialog(
      {String title = 'oops',
      String description = 'Somthing went wron'}) {
    Get.dialog(
      Dialog(
   
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: Get.textTheme.titleLarge,
              ),
              const SizedBox(height: 10),
              Text(
                description,
                style: const TextStyle(
                    fontSize: 16, ),
              ),
              const SizedBox(height: 10),
              Container(
                width: 100,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        // Corrected the shape property
                        borderRadius: BorderRadius.circular(4),
                      ),
                     ),
                  onPressed: () {
                    if (Get.isDialogOpen!) Get.back();
                  },
                  child: const Text('Ok')
                  
                     
                ),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }
}
