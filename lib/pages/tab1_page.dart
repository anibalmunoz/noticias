import 'package:flutter/material.dart';
import 'package:noticias/services/news_service.dart';
import 'package:noticias/utils/app_color.dart';
import 'package:noticias/widgets/news_list.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatefulWidget {
  const Tab1Page({Key? key}) : super(key: key);

  @override
  State<Tab1Page> createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final service = Provider.of<NewsService>(context);

    return Scaffold(
      body: service.headlines.isEmpty
          ? const Center(child: CircularProgressIndicator(color: AppColor.accentColor))
          : NewsList(news: service.headlines),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
