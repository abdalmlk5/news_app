import 'package:dio/dio.dart';
import 'package:news_app/models/news_data_response.dart';
import 'package:news_app/models/source_response.dart';

class ApiManager {
  static Dio dio = Dio();

  static Future<SourceResponse?> getSources() async {
    try {
      Response response = await dio.get(
        "https://newsapi.org/v2/top-headlines/sources?apiKey=1b959486a81d4e48a70db1c3676fe6a1",
      );
      SourceResponse sourceResponse = SourceResponse.fromJson(response.data);
      return sourceResponse;
    } catch (e) {
      print("some thing went wrong");
    }
    return null;
  }

  static Future<NewsDataResponse?> getNewsData(String sourcesID) async {
    try {
      Response response = await dio.get(
        "https://newsapi.org/v2/everything?apiKey=1b959486a81d4e48a70db1c3676fe6a1&sources=$sourcesID",
      );
      NewsDataResponse newsDataResponse = NewsDataResponse.fromJson(
        response.data,
      );
      return newsDataResponse;
    } catch (e) {
      print("some thing went wrong");
      return null;
    }
  }
}
