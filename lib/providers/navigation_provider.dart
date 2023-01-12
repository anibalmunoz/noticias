import 'package:flutter/cupertino.dart';

class NavigationProvider with ChangeNotifier {
  int _paginaActual = 0;
  final PageController _pageController = PageController(initialPage: 0);

  int get paginaActual => _paginaActual;
  PageController get pageController => _pageController;

  set paginaActual(int val) {
    _paginaActual = val;
    _pageController.animateToPage(val, duration: const Duration(milliseconds: 200), curve: Curves.easeOut);
    notifyListeners();
  }
}
