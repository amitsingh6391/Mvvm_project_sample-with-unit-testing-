import 'package:flutter/material.dart';
import 'package:mvvm_project_sample/model/apis/api_response.dart';
import 'package:mvvm_project_sample/view/Theme/apptheme.dart';
import 'package:mvvm_project_sample/view/widgets/getfood_widget.dart';
import 'package:mvvm_project_sample/view/widgets/greet_user.dart';
import 'package:mvvm_project_sample/view_model/food_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApiResponse apiResponse = Provider.of<FoodViewModal>(context).response;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Food Manager",
          style: Apptheme(context).boldText,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const GreetUser(),
            getFoodWidget(
              context,
              apiResponse,
            ),
          ],
        ),
      ),
    );
  }
}
