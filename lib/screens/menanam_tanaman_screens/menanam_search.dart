import 'package:flutter/material.dart';

class SearchMenanam extends StatefulWidget {
  const SearchMenanam({Key? key}) : super(key: key);

  @override
  State<SearchMenanam> createState() => _SearchMenanamState();
}

class _SearchMenanamState extends State<SearchMenanam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('search'),),
    );
  }
}