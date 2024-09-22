import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';

import '../common/color_extension.dart';

String formatDate(DateTime d) {
  return d.toString().substring(0, 19);
}

class RunningLengthView extends StatefulWidget {
  final double height;
  const RunningLengthView({super.key, required this.height});

  @override
  State<RunningLengthView> createState() => _RunningLengthViewState();
}

class _RunningLengthViewState extends State<RunningLengthView> {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?', _steps = '?';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initPlatformState();
  }

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      _steps = event.steps.toString();
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    print(_status);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = 'Step Count not available';
    });
  }

  Future<void> initPlatformState() async {
    var status = await Permission.activityRecognition.status;
    if (status.isDenied) {
      // You can request permission here
      status = await Permission.activityRecognition.request();
    }

    if (status.isGranted) {
      _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
      _pedestrianStatusStream
          .listen(onPedestrianStatusChanged)
          .onError(onPedestrianStatusError);

      _stepCountStream = Pedometer.stepCountStream;
      _stepCountStream.listen(onStepCount).onError(onStepCountError);

      if (!mounted) return;
    } else {
      // Handle the case where the user denies permission
      print("Permission denied");
    }
  }

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
                    "Steps",
                    style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 30,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Stack(alignment: Alignment.center, children: [
                  Column(
                    children: [
                      Text(
                        _steps,
                        style: const TextStyle(fontSize: 60),
                      ),
                      Icon(
                        _status == 'walking'
                            ? Icons.directions_walk
                            : _status == 'stopped'
                                ? Icons.accessibility_new
                                : Icons.error,
                        size: 50,
                      ),
                      Center(
                        child: Text(
                          _status,
                          style: _status == 'walking' || _status == 'stopped'
                              ? const TextStyle(fontSize: 30)
                              : const TextStyle(
                                  fontSize: 20, color: Colors.red),
                        ),
                      )
                    ],
                  ),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
