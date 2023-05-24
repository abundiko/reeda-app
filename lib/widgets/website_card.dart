import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../screens/webview.dart';

class WebsiteCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  const WebsiteCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(subtitle),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AppWebview(
                title: title,
                url: subtitle,
              ))),
    );
  }
}
