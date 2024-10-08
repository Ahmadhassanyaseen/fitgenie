// ignore_for_file: avoid_unnecessary_containers

import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workout_fitness/setting/setiing_view.dart';
import 'package:workout_fitness/tips/tips_view.dart';
import 'package:workout_fitness/view/home/home_view.dart';
import 'package:workout_fitness/view/menu/yoga_view.dart';
import 'package:workout_fitness/view/profile/profile_view.dart'; // Import profile view

import '../../common/color_extension.dart';
import '../../common_widget/menu_cell.dart';
import '../../common_widget/plan_row.dart';
import '../exercise/exercise_view_2.dart';
import '../meal_plan/meal_plan_view_2.dart';
import '../running/running_view.dart';
import '../schedule/schedule_view.dart';
import '../weight/weight_view.dart';

class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  String? userName = "FitGenie"; // Default name

  List planArr = [
    {
      "name": "Running",
      "icon": "assets/img/menu_running.png",
      "right_icon": "",
    },
    {
      "name": "Yoga",
      "icon": "assets/img/yoga.png",
      "right_icon": "assets/img/information.png",
    },
    {
      "name": "Workout",
      "icon": "assets/img/workout.png",
      "right_icon": "",
    },
    {
      "name": "Walking",
      "icon": "assets/img/walking.png",
      "right_icon": "",
    },
    {
      "name": "Fitness",
      "icon": "assets/img/fitness.png",
      "right_icon": "assets/img/information.png",
    },
    {
      "name": "Strength",
      "icon": "assets/img/strength.png",
      "right_icon": "",
    }
  ];

  List menuArr = [
    {"name": "Home", "image": "assets/img/menu_home.png", "tag": "1"},
    {"name": "Weight", "image": "assets/img/menu_weight.png", "tag": "2"},
    {
      "name": "Training plan",
      "image": "assets/img/menu_traning_plan.png",
      "tag": "3"
    },
    {
      "name": "Training Status",
      "image": "assets/img/menu_traning_status.png",
      "tag": "4"
    },
    {"name": "Meal Plan", "image": "assets/img/menu_meal_plan.png", "tag": "5"},
    {"name": "Schedule", "image": "assets/img/menu_schedule.png", "tag": "6"},
    {"name": "Running", "image": "assets/img/menu_running.png", "tag": "7"},
    {"name": "Exercises", "image": "assets/img/menu_exercises.png", "tag": "8"},
    {"name": "Online Gym", "image": "assets/img/strength.png", "tag": "9"},
    {"name": "Settings", "image": "assets/img/menu_settings.png", "tag": "10"},
    {"name": "Tips", "image": "assets/img/menu_tips.png", "tag": "11"},
  ];

  @override
  void initState() {
    super.initState();
    _fetchUserName();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }

  // Fetch user name from Firebase or another data source
 void _fetchUserName() async {
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    setState(() {
      userName = user.displayName  ?? "FitGenie"; // Display email, fallback to "FitGenie" if email is null
      // userName = user.email ?? "FitGenie"; // Display email, fallback to "FitGenie" if email is null
    });
  }
}


  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      drawer: _buildDrawer(media),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.black,
              expandedHeight: media.width * 0.6,
              collapsedHeight: kToolbarHeight + 20,
              flexibleSpace: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  _buildAppBarBackground(media),
                  _buildUserInfo(media),
                ],
              ),
            )
          ];
        },
        body: _buildMenuGrid(),
      ),
    );
  }

  // User profile app bar background
  Widget _buildAppBarBackground(Size media) {
    return Column(
      children: [
        Image.asset(
          "assets/img/menu.jpg",
          width: media.width,
          height: media.width * 0.8,
          fit: BoxFit.cover,
        ),
        Container(
          width: media.width,
          height: media.width * 0.8,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.7)
            ], begin: Alignment.bottomRight, end: Alignment.topLeft),
          ),
        ),
        Container(
          width: media.width,
          height: media.width * 0.8,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.8),
            ], begin: Alignment.bottomLeft, end: Alignment.topRight),
          ),
        ),
      ],
    );
  }

  // Display user info with option to view profile
  Widget _buildUserInfo(Size media) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 30),
      child: Row(
        children: [
          Container(
            width: 54,
            height: 60,
            decoration: BoxDecoration(
              color: TColor.white,
              borderRadius: BorderRadius.circular(27),
            ),
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset(
                "assets/img/u1.png", // Placeholder for user profile picture
                width: 54,
                height: 54,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  userName ?? "FitGenie", // Show user's name
                  style: TextStyle(
                    fontSize: 20,
                    color: TColor.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfileView(), // Navigate to ProfileView
                      ),
                    );
                  },
                  child: Text(
                    "View Profile",
                    style: TextStyle(
                      fontSize: 15,
                      color: TColor.white,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Menu grid with options
  Widget _buildMenuGrid() {
    return Stack(
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/img/on_board_bg.png"),
                fit: BoxFit.fill),
          ),
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 1),
            itemCount: menuArr.length,
            itemBuilder: ((context, index) {
              var mObj = menuArr[index] as Map? ?? {};
              return MenuCell(
                mObj: mObj,
                onPressed: () {
                  _navigateToPage(mObj["tag"].toString());
                },
              );
            }),
          ),
        ),
      ],
    );
  }

  // Function to handle navigation
  void _navigateToPage(String tag) {
    switch (tag) {
      case "1":
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const HomeView()));
        break;
      case "2":
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const WeightView()));
        break;
      case "5":
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const MealPlanView2()));
        break;
      case "6":
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ScheduleView()));
        break;
      case "7":
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const RunningView()));
        break;
      case "8":
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ExerciseView2()));
        break;
      case "10":
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const SettingView()));
        break;
      case "11":
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const TipsView()));
        break;
      default:
    }
  }

  // Drawer for side navigation (left unchanged)
  Widget _buildDrawer(Size media) {
    return Drawer(
        width: media.width,
        backgroundColor: Colors.transparent,
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5.0,
            sigmaY: 5,
          ),
          child: Stack(
            children: [
              Container(
                width: media.width * 0.78,
                decoration: BoxDecoration(
                  color: TColor.white,
                  image: const DecorationImage(
                    image: AssetImage("assets/img/on_board_bg.png"),
                  ),
                ),
                child: SafeArea(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: kTextTabBarHeight,
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(22.5),
                                child: Image.asset("assets/img/u1.png",
                                    width: 45,
                                    height: 45,
                                    fit: BoxFit.cover),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Text(
                                  "Training Plan",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: TColor.secondaryText,
                                      fontWeight: FontWeight.w700),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Divider(
                          color: Colors.black26,
                          height: 1,
                        ),
                        Expanded(
                          child: ListView.builder(
                              padding: const EdgeInsets.symmetric(vertical: 50),
                              itemCount: planArr.length,
                              itemBuilder: (context, index) {
                                var itemObj = planArr[index] as Map? ?? {};

                                return PlanRow(
                                  mObj: itemObj,
                                  onPressed: () {
                                    if (index == 1) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const YogaView()));
                                    }
                                  },
                                );
                              }),
                        ),
                        const Divider(
                          color: Colors.black26,
                          height: 1,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: kTextTabBarHeight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Switch Account",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: TColor.secondaryText,
                                    fontWeight: FontWeight.w700),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Image.asset("assets/img/next.png",
                                    width: 18, height: 18),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
              ),
              Column(
                children: [
                  const SizedBox(
                    height: kToolbarHeight - 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Container(
                          height: 50,
                          width: 80,
                          decoration: const BoxDecoration(),
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Image.asset(
                                "assets/img/meun_close.png",
                                width: 25,
                                height: 25,
                              )),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ));
  }
}
