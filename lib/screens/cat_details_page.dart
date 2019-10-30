import 'package:flutter/material.dart';

class CatDetailsPage extends StatelessWidget {
  final String catUrl;
  final TextStyle _appBarTextStyle = const TextStyle(fontFamily: 'Karmatic');

  CatDetailsPage({Key key, this.catUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cat details', style: _appBarTextStyle),
        ),
        body: Center(
          child: Image.network(this.catUrl),
        ));
  }
}
