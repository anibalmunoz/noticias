import 'package:flutter/material.dart';
import 'package:noticias/pages/pages.dart';

Map<String, WidgetBuilder> get appRoutes {
  return {"tabs": (context) => const TabsPage()};
}
