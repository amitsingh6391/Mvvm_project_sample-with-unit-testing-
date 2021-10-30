import 'package:mvvm_project_sample/model/food.dart';
import 'package:mvvm_project_sample/model/services/base_service.dart';
import 'package:mvvm_project_sample/model/services/food_service.dart';

class FoodRepository {
  final BaseService _foodService = FoodService();

  Future<List<Food>> fetchFoodList(String value) async {
    dynamic response = await _foodService.getResponse(value);

    final jsonData = response as List;
    // ['result'] as List;

    List<Food> foodList = jsonData.map((e) => Food.fromJson(e)).toList();

    return foodList;
  }
}
