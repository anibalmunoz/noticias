import 'package:flutter/cupertino.dart';
import 'package:noticias/models/news_models.dart';
import 'package:noticias/services/api_manager.dart';

class NewsService with ChangeNotifier {
  List<Article?> headlines = [];

  NewsService() {
    getTopHeadlines();
  }

  getTopHeadlines() async {
    const String url = "/v2/top-headlines";
    final response = await ApiManager.shared.get(url: url);
    final newsResponse = NewsResponse.fromJson(response.body);
    if (newsResponse.articles != null) headlines.addAll(newsResponse.articles!);
    notifyListeners();
  }
}
