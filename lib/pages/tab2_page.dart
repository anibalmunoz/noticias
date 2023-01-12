import 'package:flutter/material.dart';
import 'package:noticias/models/category.model.dart';
import 'package:noticias/services/news_service.dart';
import 'package:noticias/utils/app_color.dart';
import 'package:noticias/widgets/news_list.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatefulWidget {
  const Tab2Page({Key? key}) : super(key: key);

  @override
  State<Tab2Page> createState() => _Tab2PageState();
}

class _Tab2PageState extends State<Tab2Page> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final service = Provider.of<NewsService>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            _ListaCategorias(),
            service.articulosSeleccionados.isNotEmpty
                ? Expanded(child: NewsList(news: service.articulosSeleccionados))
                : const Center(child: CircularProgressIndicator(color: AppColor.accentColor)),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class _ListaCategorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categorias = Provider.of<NewsService>(context).categorias;

    return SizedBox(
      height: 80,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: categorias.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final cat = categorias[index].name;
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Column(children: [
              CategoryButton(categoria: categorias[index]),
              const SizedBox(height: 5),
              Text(cat[0].toUpperCase() + cat.substring(1))
            ]),
          );
        },
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final Category categoria;

  const CategoryButton({super.key, required this.categoria});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NewsService>(context);

    return GestureDetector(
      onTap: () => provider.selectedCategory = categoria.name,
      child: Container(
        height: 40,
        width: 40,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Icon(categoria.icon, color: provider.selectedCategory == categoria.name ? Colors.red : Colors.black54),
      ),
    );
  }
}
