import 'package:flutter/material.dart';
import 'package:flutter_practice2/widgets/top_bar.dart';

class PageTemplate extends StatelessWidget {
  const PageTemplate({Key? key, required this.topBar, required this.body})
      : super(key: key);
  final TopBar topBar;
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [topBar, Expanded(child: body)],
    );
  }
}
