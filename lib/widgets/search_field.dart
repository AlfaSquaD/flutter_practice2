import 'package:flutter/material.dart';

typedef onChangedFunction = Function(String);

class SearchField extends StatelessWidget {
  const SearchField({Key? key, required this.onChanged}) : super(key: key);
  final onChangedFunction onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search_rounded,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
