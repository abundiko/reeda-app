import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../widgets/book_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List _books = [];
  final TextEditingController _controller = TextEditingController();
  void _loadBooks() async {}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          margin: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    border: InputBorder.none,
                  ),
                  onSubmitted: _go,
                ),
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  _go(_controller.text);
                },
              ),
            ],
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

  void _go(String s) async {
    final res = await Dio().get(
      'https://openlibrary.org/search.json?title=${s.replaceAll(' ', '+')}&limit=20',
    );
    final jsonData = Map<String, dynamic>.from(res.data);
    _books = (jsonData['docs'] as List);
    if (mounted) setState(() {});
  }
}
