import 'package:flutter/material.dart';
import 'package:mvvm_project_sample/model/apis/api_response.dart';
import 'package:mvvm_project_sample/model/food.dart';
import 'package:mvvm_project_sample/view/Theme/apptheme.dart';

Widget getFoodWidget(BuildContext context, ApiResponse apiResponse) {
  // ignore: unused_local_variable
  List<Food>? foodList = apiResponse.data as List<Food>?;

  switch (apiResponse.status) {
    case Status.LOADING:
      return const Center(child: CircularProgressIndicator());

    case Status.COMPLETED:
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 2,
          mainAxisSpacing: 5.0,
        ),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: foodList!.length,
        itemBuilder: (context, index) {
          Food foodData = foodList[index];
          return Center(
            child: Container(
                width: 300,
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Apptheme.backbuttonColor),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Text("ID : ${foodData.id}"),
                    Text("Type : ${foodData.type}"),
                    Text("Name : ${foodData.name}"),
                    Text("PPU : ${foodData.ppu}"),
                    const SizedBox(height: 20),
                    Text(
                      "BATTERS",
                      style: Apptheme(context)
                          .lightboldText
                          .copyWith(fontSize: 20),
                    ),
                    Wrap(
                      children: [
                        for (var value in foodData.batters.batter)
                          Text(
                            "${value.type} , ",
                          )
                        //  Text(foodData.batters.batter.first.type)
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "TAPPING",
                      style: Apptheme(context)
                          .lightboldText
                          .copyWith(fontSize: 20),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      children: [
                        for (var value in foodData.topping)
                          Text(
                            "${value.type} , ",
                          )
                      ],
                    )
                  ],
                )),
          );
        },
      );

    case Status.ERROR:
      return const Center(
        child: Text("Please Try Again"),
      );
    case Status.INITIAL:

    default:
      return const Center(
        child: Text("Search the Food by User"),
      );
  }
}
