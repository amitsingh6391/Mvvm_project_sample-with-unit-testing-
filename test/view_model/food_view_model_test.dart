import 'package:flutter_test/flutter_test.dart';
import 'package:mvvm_project_sample/model/apis/api_response.dart';
import 'package:mvvm_project_sample/view_model/food_view_model.dart';

void main() {
  group(
    "Testing our app serivces in Groups",
    () {
      FoodViewModal foodViewModel = FoodViewModal();

      //** TEST 1  */
      // HERE ARE TESTING OUR API STATUS IS IT COMPLETED OR NOT AFTER CALLING OUR METHOD.
      test(
        "testing we food response is getting or not",
        () async {
          await foodViewModel.fetchFoodData("");

          expect(foodViewModel.response.status, Status.COMPLETED);
        },
      );

      //**   TEST 2 **/

//testing after apiCall we are getting excat number of Food object or not;

      test(
        "Testing that given response have excat number of  Food object ",
        () async {
          await foodViewModel.fetchFoodData("");

          // AS we know that we have 6 object from our json

          expect(foodViewModel.food!.length, 6);
        },
      );
    },
  );

  // **  TEST 3 **//

  FoodViewModal foodViewModel = FoodViewModal();
  test(
    " If we are not calling our method then our status should be intial",
    () async {
      expect(foodViewModel.response.status, Status.INITIAL);
    },
  );
}
