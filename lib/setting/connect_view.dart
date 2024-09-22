import 'package:flutter/material.dart';
import 'package:workout_fitness/common_widget/connect_row.dart';

import '../../common/color_extension.dart';

class ConnectView extends StatefulWidget {
  final Function(Map) didSelect;
  const ConnectView({super.key, required this.didSelect});

  @override
  State<ConnectView> createState() => _WeightViewState();
}

class _WeightViewState extends State<ConnectView> {
  int selectIndex = 0;
  List connectArr = [
    {
      "name": "Connect to Facebook",
      "icon": "assets/img/fk.png",
      "color": const Color(0xff6F82FE),
    },
    {
      "name": "Connect to Twitter",
      "icon": "assets/img/twit.webp",
      "color": const Color(0xff70C0FC),
    },
    {
      "name": "Connect to Linkedln",
      "icon": "assets/img/in.png",
      "color": const Color(0xff68CCFF),
    },
    {
      "name": "Connect to Pintrest",
      "icon": "assets/img/pnt.png",
      "color": const Color(0xffFF6475),
    },
    // {
    //   "name": "Russian",
    //   "icon": "",
    //   "color": const Color(0x000000ff),
    // },
    // {
    //   "name": "Portuguese",
    //   "icon": "",
    //   "color": const Color(0x000000ff),
    // },
    // {
    //   "name": "Bengali",
    //   "icon": "",
    //   "color": const Color(0x000000ff),
    // },
    // {
    //   "name": "Vietnamese",
    //   "icon": "",
    //   "color": const Color(0x000000ff),
    // },
  ];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.primary,
        centerTitle: true,
        elevation: 0.1,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset(
              "assets/img/black_white.png",
              width: 25,
              height: 25,
            )),
        title: Text(
          "Connected",
          style: TextStyle(
              color: TColor.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Text(
              "Choose to Connect social network",
              style: TextStyle(
                color: TColor.secondaryText,
                fontSize: 16,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                itemBuilder: (context, index) {
                  var tObj = connectArr[index] as Map? ?? {};
                  return ConnectRow(
                    tObj: tObj,
                    isActive: selectIndex == index,
                    onPressed: () {
                      setState(() {
                        selectIndex = index;
                      });
                    },
                  );
                },
                itemCount: connectArr.length),
          ),
        ],
      ),
    );
  }
}
