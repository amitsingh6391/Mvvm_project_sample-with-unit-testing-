import 'package:flutter/material.dart';
import 'package:mvvm_project_sample/model/apis/api_response.dart';
import 'package:mvvm_project_sample/model/food.dart';
import 'package:mvvm_project_sample/model/food_repository.dart';

class FoodViewModal extends ChangeNotifier {
  //make apiresponse empty data in case of intial state;
  ApiResponse _apiResponse = ApiResponse.initial("Empty Data");
  List<Food>? _food;

//define getter for to fetch apiResponse
  ApiResponse get response {
    return _apiResponse;
  }

  //getter for fetching food details from json;

  List<Food>? get food {
    return _food;
  }

//call the food service and gets the data or required foood data

  Future<void> fetchFoodData(String value) async {
    _apiResponse = ApiResponse.loading("Fetching food data");

    notifyListeners();

    try {
      List<Food> foodList = await FoodRepository().fetchFoodList(value);

      _apiResponse = ApiResponse.completed(foodList);
      _food = foodList;
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());

      debugPrint("this is error :$e");
    }

    notifyListeners();
  }
}
