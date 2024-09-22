import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../common/color_extension.dart';

class RunningTimerView extends StatefulWidget {
  final double height;
  const RunningTimerView({super.key, required this.height});

  @override
  State<RunningTimerView> createState() => _RunningTimerViewState();
}

class _RunningTimerViewState extends State<RunningTimerView> {
  late Stopwatch stopwatch;
  late Timer t;

  void handleStartStop() {
    if (stopwatch.isRunning) {
      stopwatch.stop();
    } else {
      stopwatch.start();
    }
  }

  String returnFormattedText() {
    var milli = stopwatch.elapsed.inMilliseconds;

    String milliseconds = (milli % 1000).toString().padLeft(3, "0");
    String seconds = ((milli ~/ 1000) % 60).toString().padLeft(2, "0");
    String minutes = ((milli ~/ 1000) ~/ 60).toString().padLeft(2, "0");

    return "$minutes:$seconds:$milliseconds";
  }

  @override
  void initState() {
    super.initState();
    stopwatch = Stopwatch();

    t = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: SizedBox(
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
                      "Stop-Watch",
                      style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CupertinoButton(
                              onPressed: () {
                                handleStartStop();
                              },
                              padding: const EdgeInsets.all(0),
                              child: Container(
                                height: 250,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: TColor.primary,
                                    width: 15,
                                  ),
                                ),
                                child: Text(
                                  returnFormattedText(),
                                  style: TextStyle(
                                    color: TColor.secondaryText,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CupertinoButton(
                              onPressed: () {
                                stopwatch.reset();
                              },
                              padding: const EdgeInsets.all(0),
                              child: Text(
                                "Reset",
                                style: TextStyle(
                                  color: TColor.secondaryText,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
