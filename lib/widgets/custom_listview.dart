import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({Key? key, required this.items}) : super(key: key);
  final List<Widget> items;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: items,
      ),
    );
  }
}
