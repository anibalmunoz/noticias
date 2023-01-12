import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:noticias/models/models.dart';
import 'package:noticias/services/api_manager.dart';

class NewsService with ChangeNotifier {
  List<Article?> headlines = [];
  String _selectedCategory = "business";
  List<Category> categorias = [
    Category(icon: FontAwesomeIcons.building, name: "business"),
    Category(icon: FontAwesomeIcons.tv, name: "entertainment"),
    Category(icon: FontAwesomeIcons.addressCard, name: "general"),
    Category(icon: FontAwesomeIcons.headSideVirus, name: "health"),
    Category(icon: FontAwesomeIcons.vials, name: "science"),
    Category(icon: FontAwesomeIcons.volleyball, name: "sports"),
    Category(icon: FontAwesomeIcons.memory, name: "technology"),
  ];

  Map<String, List<Article?>> categoryArticles = {};

  String get selectedCategory => _selectedCategory;

  set selectedCategory(String val) {
    _selectedCategory = val;
    getArticlesByCategory(val);
  }

  NewsService() {
    getTopHeadlines();
    categorias.forEach((cat) => categoryArticles[cat.name] = []);
    getArticlesByCategory(_selectedCategory);
  }

  List<Article?> get articulosSeleccionados => categoryArticles[_selectedCategory]!;

  getTopHeadlines() async {
    final response = await ApiManager.shared.get();
    final newsResponse = NewsResponse.fromJson(response.body);
    if (newsResponse.articles != null) headlines.addAll(newsResponse.articles!);
    notifyListeners();
  }

  getArticlesByCategory(String cat) async {
    if (categoryArticles[cat]!.isNotEmpty) {
      notifyListeners();
      return categoryArticles[cat];
    }
    final response = await ApiManager.shared.get(categoryParam: cat);
    final newsResponse = NewsResponse.fromJson(response.body);
    categoryArticles[cat]?.addAll(newsResponse.articles!);
    notifyListeners();
  }
}
