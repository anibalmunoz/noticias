import 'package:flutter/material.dart';
import 'package:noticias/pages/pages.dart';
import 'package:noticias/providers/navigation_provider.dart';
import 'package:provider/provider.dart';

class Pages extends StatelessWidget {
  const Pages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NavigationProvider>(context);

    return PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: provider.pageController,
        children: const [Tab1Page(), Tab2Page()]);
  }
}
