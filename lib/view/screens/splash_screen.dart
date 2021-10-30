import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:mvvm_project_sample/view/screens/home_screen.dart';
import 'package:mvvm_project_sample/view/screens/login_screen.dart';
import 'package:mvvm_project_sample/view_model/food_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Provider.of<FoodViewModal>(
      context,
      listen: false,
    ).fetchFoodData("");

    getLoggedInStatus();

    super.initState();
  }

  void getLoggedInStatus() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    bool? logedInStatus = pref.getBool("logedIn");

    Timer(const Duration(seconds: 1), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              logedInStatus != true ? LoginScreen() : HomeScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
    );
    return Scaffold(
      body: Center(
          child: Lottie.network(
        'https://assets10.lottiefiles.com/private_files/lf30_5vz6nzl3.json',
        animate: true,
        height: 100.w * 2,
        width: 100.w * 2,
      )),
    );
  }
}
