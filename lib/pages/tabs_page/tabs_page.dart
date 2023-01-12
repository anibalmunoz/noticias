import 'package:flutter/material.dart';
import 'package:noticias/pages/tabs_page/custom_navigation_bar.dart';
import 'package:noticias/pages/tabs_page/pages.dart';
import 'package:noticias/providers/navigation_provider.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({Key? key}) : super(key: key);

  static const routeName = "tabs";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => NavigationProvider(),
      child: const Scaffold(
        body: Pages(),
        bottomNavigationBar: CustomNavigationBar(),
      ),
    );
  }
}
