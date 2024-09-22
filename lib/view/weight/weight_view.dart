import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../common_widget/border_button.dart';

class WeightView extends StatefulWidget {
  const WeightView({super.key});

  @override
  State<WeightView> createState() => _WeightViewState();
}

class _WeightViewState extends State<WeightView> {
  List myWeightArr = [
    {"name": "Sunday, AUG 19", "image": "assets/img/w_1.png"},
    {"name": "Sunday, AUG 26", "image": "assets/img/w_2.png"},
    {
      "name": "Sunday, AUG 26",
      "image": "assets/img/w_3.png",
    }
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
          "Check your process",
          style: TextStyle(
              color: TColor.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: BorderButton(
                        title: "Check Process",
                        type: BorderButtonType.inactive,
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: BorderButton(
                        title: "My Weight",
                        onPressed: () {},
                      ),
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: Text(
                "Add more photo to control your process",
                textAlign: TextAlign.center,
                style: TextStyle(color: TColor.secondaryText, fontSize: 14),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 8),
            //   child: SizedBox(
            //     width: media.width,
            //     height: media.width * 0.9,
            //     child: CarouselSlider.builder(
            //       options: CarouselOptions(
            //           autoPlay: false,
            //           aspectRatio: 0.5,
            //           enlargeCenterPage: true,
            //           enableInfiniteScroll: false,
            //           viewportFraction: 0.65,
            //           enlargeFactor: 0.4,
            //           enlargeStrategy: CenterPageEnlargeStrategy.zoom),
            //       itemCount: myWeightArr.length,
            //       itemBuilder:
            //           (BuildContext context, int itemIndex, int index) {
            //         var dObj = myWeightArr[index] as Map? ?? {};
            //         return Container(
            //           margin: const EdgeInsets.symmetric(
            //               vertical: 10, horizontal: 10),
            //           decoration: BoxDecoration(
            //               color: TColor.white,
            //               borderRadius: BorderRadius.circular(10),
            //               boxShadow: const [
            //                 BoxShadow(
            //                     color: Colors.black12,
            //                     blurRadius: 4,
            //                     offset: Offset(0, 2)),
            //               ]),
            //           child: ClipRRect(
            //             borderRadius: BorderRadius.circular(10),
            //             child: Image.asset(dObj["image"].toString(),
            //                 width: double.maxFinite,
            //                 height: double.maxFinite,
            //                 fit: BoxFit.cover),
            //           ),
            //         );
            //       },
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            //   child: Row(
            //     children: [
            //       IconButton(
            //         onPressed: () {},
            //         icon: Image.asset(
            //           "assets/img/black_fo.png",
            //           width: 20,
            //           height: 20,
            //         ),
            //       ),
            //       Expanded(
            //         child: Text(
            //           "Sunday, AUG 26",
            //           textAlign: TextAlign.center,
            //           style: TextStyle(
            //               color: TColor.secondaryText,
            //               fontSize: 20,
            //               fontWeight: FontWeight.w700),
            //         ),
            //       ),
            //       IconButton(
            //         onPressed: () {},
            //         icon: Image.asset(
            //           "assets/img/next_go.png",
            //           width: 20,
            //           height: 20,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              width: 160,
              decoration: BoxDecoration(
                  border:
                      Border.all(color: TColor.gray.withOpacity(0.5), width: 1),
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                "74 kg",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: TColor.primary,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: Text(
                "Maintaining a healthy weight through regular gym workouts is a holistic approach that encompasses physical fitness, mental well-being, and overall lifestyle balance.\n Engaging in a consistent gym routine not only aids in weight management but also contributes to muscle development, improved cardiovascular health, and enhanced metabolism.\n The combination of cardiovascular exercises, strength training, and flexibility workouts creates a comprehensive fitness regimen, helping individuals achieve their weight maintenance goals. Beyond the physical benefits, the gym environment often fosters a sense of community and motivation, making it easier for individuals to stay committed to their health journey.\n Moreover, regular exercise at the gym has been linked to reduced stress levels and improved mood, further supporting a balanced and sustainable approach to weight maintenance. Ultimately, the gym becomes a hub for positive lifestyle changes, promoting long-term health and well-being.",
                style: TextStyle(color: TColor.secondaryText, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {},
                child: Image.asset("assets/img/menu_running.png",
                    width: 25, height: 25),
              ),
              InkWell(
                onTap: () {},
                child: Image.asset("assets/img/menu_meal_plan.png",
                    width: 25, height: 25),
              ),
              InkWell(
                onTap: () {},
                child: Image.asset("assets/img/menu_home.png",
                    width: 25, height: 25),
              ),
              InkWell(
                onTap: () {},
                child: Image.asset("assets/img/menu_weight.png",
                    width: 25, height: 25),
              ),
              InkWell(
                onTap: () {},
                child:
                    Image.asset("assets/img/more.png", width: 25, height: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
