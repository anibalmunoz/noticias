import 'package:flutter/material.dart';
import 'package:noticias/services/news_service.dart';
import 'package:noticias/widgets/news_list.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatelessWidget {
  const Tab1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final service = Provider.of<NewsService>(context);

    return Scaffold(
      body: NewsList(news: service.headlines),
    );
  }
}
