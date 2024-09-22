import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../common/color_extension.dart';
import 'clock_tick.dart';

class RunningSpeedView extends StatefulWidget {
  final double height;
  const RunningSpeedView({super.key, required this.height});

  @override
  State<RunningSpeedView> createState() => _RunningSpeedViewState();
}

class _RunningSpeedViewState extends State<RunningSpeedView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return SizedBox(
      height: widget.height,
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Speed",
                    style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Container(
          child: SfRadialGauge(
            animationDuration: 20000,
            enableLoadingAnimation: true,
          axes: <RadialAxis>[
            RadialAxis(minimum: 0, maximum: 150,
            ranges: <GaugeRange>[
              GaugeRange(startValue: 0, endValue: 50, color:Colors.green),
              GaugeRange(startValue: 50,endValue: 100,color: Colors.orange),
              GaugeRange(startValue: 100,endValue: 150,color: Colors.red)],
            pointers: <GaugePointer>[
              NeedlePointer(value: 90)],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(widget: Container(child: 
                 Text('90.0',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold))),
                 angle: 90, positionFactor: 0.5
              )]
          )])
      )
             
                
              ],
            ),
          ),
          Container(
            height: 80,
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      1,
                      2,
                      3,
                      4,
                      5,
                      6,
                      7,
                      8,
                      9,
                      10,
                      11,
                      12,
                      13,
                      14,
                      15,
                      16,
                      17,
                      18,
                      19,
                      20,
                      21,
                      22,
                      23,
                      24
                    ].map((valObj) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        width: 5
                        ,
                        height: 40,
                        decoration: BoxDecoration(
                          color: valObj == 10
                              ? TColor.primary
                              : const Color(0xffE6E6E6),
                        ),
                      );
                    }).toList()),
              ],
            ),
          )
        ],
      ),
    );
  }
}
