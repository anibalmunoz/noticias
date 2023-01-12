import 'package:flutter/material.dart';
import 'package:noticias/models/news_models.dart';
import 'package:noticias/themes/dark_theme.dart';

class NewsList extends StatelessWidget {
  final List<Article?> news;
  const NewsList({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (context, index) {
        final noticia = news[index];
        return news.isNotEmpty ? _Noticia(noticia: noticia!, index: index) : const _NoData();
      },
    );
  }
}

class _Noticia extends StatelessWidget {
  final Article noticia;
  final int index;
  const _Noticia({Key? key, required this.noticia, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Header(sourceName: noticia.source!.name!, index: index),
        _TarjetaTitulo(title: noticia.title!),
        TarjetaImagen(urlImage: noticia.url)
      ],
    );
  }
}

class _Header extends StatelessWidget {
  final String sourceName;
  final int index;
  const _Header({Key? key, required this.sourceName, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(children: [
        Text("${index + 1}", style: TextStyle(color: darkTheme.colorScheme.secondary)),
        const SizedBox(width: 25),
        Text(sourceName)
      ]),
    );
  }
}

class _TarjetaTitulo extends StatelessWidget {
  final String title;
  const _TarjetaTitulo({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.only(bottom: 10),
        child: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)));
  }
}

class TarjetaImagen extends StatelessWidget {
  final String? urlImage;
  const TarjetaImagen({Key? key, this.urlImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _NoData extends StatelessWidget {
  const _NoData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text("NO DATA");
  }
}
