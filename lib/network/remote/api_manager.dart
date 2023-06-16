import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news_app/components/constants.dart';
import 'package:news_app/models/NewsResponse.dart';
import 'package:news_app/models/SourcesResponse.dart';

class ApiManager {
  static Future<SourcesResponse> getSources(String category) async {
    Uri URl =
    Uri.https(BASE_URL, "/v2/top-headlines/sources",
        {"apiKey": ApiKey, "category": category});
    Response response = await http.get(URl);
    var jsonBody = jsonDecode(response.body);
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(jsonBody);
    return sourcesResponse;
  }

  static Future<NewsResponse> getNewsData(String sourceId,
      String article) async {
    Uri Url = Uri.https(
        BASE_URL, "/v2/everything",
        {"apiKey": ApiKey, "sources": sourceId, "q":article});
    http.Response response = await http.get(Url);
    var jsonBody = jsonDecode(response.body);
    NewsResponse newsResponse = NewsResponse.fromJson(jsonBody);
    return newsResponse;
  }
}
