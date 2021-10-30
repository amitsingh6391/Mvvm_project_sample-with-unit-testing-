import 'package:flutter/material.dart';
import 'package:mvvm_project_sample/view/Theme/apptheme.dart';
import 'package:mvvm_project_sample/view/screens/login_screen.dart';
import 'package:mvvm_project_sample/view/screens/splash_screen.dart';
import 'package:mvvm_project_sample/view_model/food_view_model.dart';
import 'package:provider/provider.dart';

import 'view/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(FoodApp());
}

class FoodApp extends StatelessWidget {
  const FoodApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: FoodViewModal(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Food App",
        theme: Apptheme.theme,
        home: SplashScreen(),
      ),
    );
  }
}
