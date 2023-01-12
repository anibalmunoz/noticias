import 'package:http/http.dart';
import 'package:http/http.dart' as http;

const _urlDomain = "newsapi.org";
const _apiKey = "f1cbf1e9364d47319a747edd4f63ee61";

class ApiManager {
  ApiManager._();
  static final ApiManager shared = ApiManager._();

  Future<Response> get({required String url}) async {
    return await http.get(Uri.https(_urlDomain, url, {"apikey": _apiKey, "country": "us"}));
  }
}
