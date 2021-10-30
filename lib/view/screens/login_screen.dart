import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvvm_project_sample/view/Theme/apptheme.dart';
import 'package:mvvm_project_sample/view/screens/home_screen.dart';
import 'package:mvvm_project_sample/view/widgets/custom_input_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _userName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Lottie.network(
                'https://assets10.lottiefiles.com/private_files/lf30_fNsrpZ.json',
                animate: true,
                height: 100.w * 2,
                width: 100.w * 2,
              ),
            ),
            SizedBox(height: 30.h),
            Container(
              // height: 40,
              padding: const EdgeInsets.only(
                left: 50,
                right: 50,
              ),
              child: InputField(
                hintText: 'E-mail',
                keyboardType: TextInputType.emailAddress,
                controller: _email,
                validator: (value) {
                  return RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value!)
                      ? null
                      : "Email is not valid";
                },
              ),
            ),
            SizedBox(height: 30.h),
            Container(
              padding: const EdgeInsets.only(
                left: 50,
                right: 50,
              ),
              child: InputField(
                hintText: 'User Name',
                controller: _userName,
                validator: (value) {
                  return value!.isEmpty
                      ? "User name should not be empty."
                      : null;
                },
              ),
            ),
            SizedBox(height: 50.h),
            SizedBox(
              width: 170,
              height: 50,
              child: OutlinedButton(
                onPressed: () async {
                  if (_formkey.currentState!.validate()) {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setString('userName', _userName.text);
                    await prefs.setString('email', _email.text);
                    await prefs.setBool('logedIn', true);

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  }
                },
                child:
                    const Text('Log In', style: TextStyle(color: Colors.white)),
                style: OutlinedButton.styleFrom(
                  shape: const StadiumBorder(),
                  backgroundColor: Apptheme.assentColor,
                  side: const BorderSide(color: Apptheme.lightbuttonColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _email.dispose();
    _userName.dispose();

    super.dispose();
  }
}
