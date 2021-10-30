abstract class BaseService {
  final String mediaBaseUrl =
      "https://run.mocky.io/v3/7724cee3-eed1-4f99-8828-86dd8f1bd6c9";

  Future<dynamic> getResponse(
      String
          url); //we define our first method in abstract class getResponse to get data
}
