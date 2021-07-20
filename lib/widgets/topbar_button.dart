import 'package:flutter/material.dart';

class TopBarButton extends StatelessWidget {
  const TopBarButton({Key? key, required this.onTap, required this.title})
      : super(key: key);
  final VoidCallback onTap;
  final Widget title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 200,
      child: TextButton(
          onPressed: onTap,
          child: title,
          style: Theme.of(context).textButtonTheme.style!.copyWith(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.green.shade500),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))))),
    );
  }
}
