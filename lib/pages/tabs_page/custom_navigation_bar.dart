import 'package:flutter/material.dart';
import 'package:noticias/providers/navigation_provider.dart';
import 'package:provider/provider.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NavigationProvider>(context);

    return BottomNavigationBar(
      currentIndex: provider.paginaActual,
      elevation: 0,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Para ti"),
        BottomNavigationBarItem(icon: Icon(Icons.public), label: "Encabezados")
      ],
      onTap: (value) => provider.paginaActual = value,
    );
  }
}
