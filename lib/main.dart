import 'package:flutter/material.dart';
import 'package:noticias/pages/pages.dart';
import 'package:noticias/routes/app_routes.dart';
import 'package:noticias/themes/dark_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: darkTheme,
      initialRoute: TabsPage.routeName,
      routes: appRoutes,
    );
  }
}
