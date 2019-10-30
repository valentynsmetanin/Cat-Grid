import 'dart:math';

import 'package:cat_grid/data/cat_list_data_source.dart';
import 'package:cat_grid/screens/cat_details_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CatListPage extends StatefulWidget {
  final String title;

  CatListPage({Key key, this.title = 'Cat explorer'}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CatListPageState();

}

class CatListPageState extends State<CatListPage> {
  final _cats = CatListDataSource.catUrls;
  final _random = new Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title),
      ),
      body: _createGridView(),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add cat',
        child: const Icon(Icons.control_point_duplicate),
        onPressed: () {
          _onAddRandomCat();
        },
      ),
    );
  }

  GridView _createGridView() {
    return GridView.count(
      crossAxisCount: 3,
      padding: EdgeInsets.all(4),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: _createCatWidgets()
    );
  }

  List<Widget> _createCatWidgets() {
    return _cats.map((url) {
      return _createImage(url);
    }).toList();
  }

  Widget _createImage(String url) {
    return InkWell(
        onTap: () {
          _onNavigateToDetails(url);
        },
        child: Image.network(
          url,
          fit: BoxFit.cover,
        )
    );
  }

  void _onNavigateToDetails(String url) {
    if (url == null) {
      return;
    }
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CatDetailsPage(catUrl: url)
        )
    );
  }

  void _onAddRandomCat() {
    setState(() {
      final _position = _random.nextInt(_cats.length - 1);
      _cats.add(_cats[_position]);
    });
  }

}