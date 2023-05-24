import 'package:flutter/material.dart';

import '../widgets/book_card.dart';
import '../widgets/website_card.dart';

class Websites extends StatelessWidget {
  Websites({super.key});

  List<Map<String, String>> _bookWebsites = [
    {
      'name': 'Project Gutenberg',
      'url': 'https://www.gutenberg.org/',
      'imageUrl':
          'https://www.gutenberg.org/cache/epub/41/pg41.cover.medium.jpg',
    },
    {
      'name': 'Open Library',
      'url': 'https://openlibrary.org/',
      'imageUrl': 'https://covers.openlibrary.org/b/id/10452079-L.jpg',
    },
    {
      'name': 'ManyBooks',
      'url': 'https://manybooks.net/',
      'imageUrl': 'https://www.manybooks.net/images/manybooks-logo.png',
    },
    {
      'name': 'Librivox',
      'url': 'https://librivox.org/',
      'imageUrl': 'https://librivox.org/images/librivox-logo.png',
    },
    {
      'name': 'BookBub',
      'url': 'https://www.bookbub.com/',
      'imageUrl': 'https://www.bookbub.com/img/logo-no-margin.svg',
    },
    {
      'name': 'Free-eBooks',
      'url': 'https://www.free-ebooks.net/',
      'imageUrl': 'https://www.free-ebooks.net/images/logo.png',
    },
    {
      'name': 'Smashwords',
      'url': 'https://www.smashwords.com/',
      'imageUrl': 'https://www.smashwords.com/apple-touch-icon-152x152.png',
    },
    {
      'name': 'BookRix',
      'url': 'https://www.bookrix.com/',
      'imageUrl': 'https://www.bookrix.com/graphics/layout/bxr_home_logo.png',
    },
    {
      'name': 'Feedbooks',
      'url': 'https://www.feedbooks.com/',
      'imageUrl':
          'https://www.feedbooks.com/assets/fb_logo-32930dc470d4e7e9d577938cd234ef70.png',
    },
    {
      'name': 'ManyBooks.net',
      'url': 'https://manybooks.net/',
      'imageUrl': 'https://www.manybooks.net/images/manybooks-logo.png',
    },
  ];


  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child:
              Text("Websites", style: TextStyle(fontWeight: FontWeight.w800)),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Wrap(
                runAlignment: WrapAlignment.spaceAround,
                children: <Widget>[
                  ..._bookWebsites.map((e) => WebsiteCard(
                      imageUrl: e['imageUrl'].toString(),
                      title: e['name'].toString(),
                      subtitle: e['url'].toString()))
                ]),
          ),
        ),
      ],
    );
  }
}
