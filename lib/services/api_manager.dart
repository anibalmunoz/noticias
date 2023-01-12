import 'package:http/http.dart';
import 'package:http/http.dart' as http;

const _urlDomain = "newsapi.org";
const String url = "/v2/top-headlines";
const _apiKey = "f1cbf1e9364d47319a747edd4f63ee61";

class ApiManager {
  ApiManager._();
  static final ApiManager shared = ApiManager._();

  Future<Response> get({String? categoryParam}) async {
    Map<String, dynamic> params = {"apikey": _apiKey, "country": "us"};
    if (categoryParam != null) params.addAll({"category": categoryParam});
    return await http.get(Uri.https(_urlDomain, url, params));
  }
}
