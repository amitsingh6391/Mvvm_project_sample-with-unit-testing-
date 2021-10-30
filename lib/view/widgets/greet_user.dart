import 'dart:math';

import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:mvvm_project_sample/view/Theme/apptheme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GreetUser extends StatefulWidget {
  const GreetUser({Key? key}) : super(key: key);

  @override
  State<GreetUser> createState() => _GreetUserState();
}

class _GreetUserState extends State<GreetUser> {
  ConfettiController? controllerTopCenter;

  String? name;
  String? email;

  @override
  void initState() {
    super.initState();
    getUserDetails();
    setState(() {
      initController();
    });
  }

  void initController() {
    controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 4));
    controllerTopCenter!.play();
  }

  getUserDetails() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    setState(() {
      email = pref.getString("email");
      name = pref.getString("userName");
    });
  }

  String greetMessage() {
    int? time = int.tryParse(DateTime.now().toString().substring(11, 13));

    if (time! < 12 && time > 4) {
      return "Good Morning";
    } else if (time < 20 && time > 12) {
      return "Good Evening";
    } else {
      return "Good Night";
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        buildConfettiWidget(controllerTopCenter, pi / 1),
        buildConfettiWidget(controllerTopCenter, pi / 4),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: Theme.of(context).cardColor,
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: ' ${greetMessage()} ',
                          style: Apptheme(context).boldText.copyWith(
                                fontSize: 30,
                              ),
                        ),
                        TextSpan(
                          text: "${name} ",
                          style: Apptheme(context).normalText.copyWith(
                                fontSize: 20,
                              ),
                        ),
                        TextSpan(
                          text: " ( ${email} )",
                          style: Apptheme(context).thinText.copyWith(
                                fontSize: 15,
                                color: Apptheme.assentColor,
                              ),
                        ),
                      ],
                    ),
                  )
                  // Text("Hi ✋, ${name}"),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Align buildConfettiWidget(controller, double blastDirection) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConfettiWidget(
        maximumSize: Size(30, 30),
        shouldLoop: false,
        confettiController: controller,
        blastDirection: blastDirection,
        blastDirectionality: BlastDirectionality.directional,
        maxBlastForce: 20, // set a lower max blast force
        minBlastForce: 8, // set a lower min blast force
        emissionFrequency: 1,
        numberOfParticles: 8, // a lot of particles at once
        gravity: 1,
      ),
    );
  }
}
