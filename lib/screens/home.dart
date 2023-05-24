import 'dart:math';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../widgets/book_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

String getRandomLowercaseAlphabet() {
  final random = Random();
  const alphabet = 'abcdefghijklmnopqrstuvwxyz';
  return alphabet[random.nextInt(alphabet.length)];
}

class _HomeState extends State<Home> {
  List _books = [];
  void _loadBooks() async {
    final res = await Dio().get(
      'https://openlibrary.org/search.json?title=${getRandomLowercaseAlphabet()}&limit=12',
    );
    final jsonData = Map<String, dynamic>.from(res.data);
    _books = ((jsonData['docs'] as List));
    setState(() {});
  }

  @override
  void initState() {
    _loadBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child:
                Text("For You", style: TextStyle(fontWeight: FontWeight.w800)),
          ),
        ),
        Expanded(
          child: SizedBox(
            width: (MediaQuery.of(context).size.width - 20),
            child: SingleChildScrollView(
              child:
                  Wrap(alignment: WrapAlignment.spaceAround, children: <Widget>[
                ..._books.map((e) {
                  final isbn = List.from(e['isbn'] ?? []);
                  return BookCard(
                      id: e['key'],
                      image: isbn.isEmpty ? '' : isbn.first ?? "",
                      title: e['title'],
                      author: (e['author_name'] ?? ['UNKNOWN'] as List).first);
                })
              ]),
            ),
          ),
        ),
      ],
    );
  }
}
