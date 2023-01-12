import 'package:flutter/material.dart';
import 'package:noticias/pages/pages.dart';
import 'package:noticias/routes/app_routes.dart';
import 'package:noticias/services/news_service.dart';
import 'package:noticias/themes/dark_theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [ChangeNotifierProvider(create: (context) => NewsService())],
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: darkTheme,
      initialRoute: TabsPage.routeName,
      routes: appRoutes,
    );
  }
}
