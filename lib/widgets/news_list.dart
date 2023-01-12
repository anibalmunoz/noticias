import 'package:flutter/material.dart';
import 'package:noticias/models/news_models.dart';
import 'package:noticias/utils/app_color.dart';

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
        TarjetaImagen(urlImage: noticia.urlToImage),
        TarjetaBody(description: noticia.description),
        const SizedBox(height: 10),
        TarjetaBotones(),
        const Divider()
      ],
    );
  }
}

class TarjetaBotones extends StatelessWidget {
  const TarjetaBotones({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MaterialButton(
          onPressed: () {},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: AppColor.accentColor,
          child: const Icon(Icons.star_border),
        ),
        const SizedBox(width: 10),
        MaterialButton(
          onPressed: () {},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Colors.blue,
          child: const Icon(Icons.more_horiz),
        )
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
        Text("${index + 1}", style: const TextStyle(color: AppColor.accentColor)),
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
    return urlImage != null
        ? Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ClipRRect(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
                child:
                    FadeInImage(placeholder: const AssetImage("assets/img/giphy.gif"), image: NetworkImage(urlImage!))),
          )
        : const Image(image: AssetImage("assets/img/no-image.png"));
  }
}

class TarjetaBody extends StatelessWidget {
  final String? description;

  const TarjetaBody({Key? key, this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(description ?? ""),
    );
  }
}

class _NoData extends StatelessWidget {
  const _NoData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text("NO DATA");
  }
}
