import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../screens/webview.dart';

class BookCard extends StatelessWidget {
  const BookCard(
      {super.key,
      required this.id,
      required this.title,
      required this.author,
      required this.image});

  final String id, title, author, image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (e) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AppWebview(
                  title: title,
                  url: "https://openlibrary.org$id",
                )));
      },
      child: SizedBox(
        width: (MediaQuery.of(context).size.width - 60) / 2,
        child: Column(
          children: [
            Container(
                clipBehavior: Clip.hardEdge,
                margin: const EdgeInsets.all(5),
                height: 200.0,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: CachedNetworkImage(
                    errorWidget: (context, _, __) {
                      return Text('failed to load image');
                    },
                    height: double.maxFinite,
                    width: double.maxFinite,
                    fit: BoxFit.cover,
                    imageUrl:
                        'https://covers.openlibrary.org/b/isbn/$image-M.jpg')),
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                author,
                style: TextStyle(
                  color: Colors.grey.withOpacity(0.8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
