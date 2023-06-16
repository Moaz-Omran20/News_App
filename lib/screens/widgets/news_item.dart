import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/NewsResponse.dart';

class NewsItem extends StatelessWidget {
  Articles article;

  NewsItem(this.article);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 15,
        shape: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  child: CachedNetworkImage(
                    imageUrl: article.urlToImage ?? "",
                      height: MediaQuery.of(context).size.height * .3,
                      fit: BoxFit.fill,
                    placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
                Text(
                  article.author ?? "",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  article.title ?? "",
                  style: const TextStyle(fontSize: 15),
                ),
                Text(
                  article.description ?? "",
                  style: const TextStyle(fontSize: 18),
                ),
                Container(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      article.publishedAt ?? "",
                      style: const TextStyle(fontSize: 13),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
