import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class SettingSliderView extends StatelessWidget {
  final Map tObj;
  final Function(double)? onChanged;

  const SettingSliderView(
      {super.key, required this.tObj, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                tObj['name'],
                style: TextStyle(
                  color: TColor.secondaryText,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "1",
                style: TextStyle(
                  color: TColor.secondaryText,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Slider(
                  max: 100,
                  min: 1.0,
                  value: double.tryParse(tObj["value"]) ?? 1,
                  onChanged: onChanged),
              Text(
                "100",
                style: TextStyle(
                  color: TColor.secondaryText,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
