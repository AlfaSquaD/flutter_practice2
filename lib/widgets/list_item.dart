import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomListItem extends StatelessWidget {
  CustomListItem(
      {Key? key,
      this.onTap,
      this.subtitle,
      this.title,
      this.trailing,
      this.leading,
      this.constraints})
      : super(key: key);
  final VoidCallback? onTap;
  final Widget? trailing;
  final Widget? leading;
  final String? title;
  final String? subtitle;
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Container(
          constraints: constraints,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(flex: 1, child: leading ?? Container()),
                Expanded(
                    flex: 4,
                    child: _ItemDescription(title: title, subtitle: subtitle)),
                Expanded(flex: 1, child: trailing ?? Container()),
              ]),
        ),
      ),
    );
  }
}

class _ItemDescription extends StatelessWidget {
  const _ItemDescription({Key? key, this.title, this.subtitle})
      : super(key: key);
  final String? title;
  final String? subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (title != null)
              Expanded(
                flex: 1,
                child: Text(
                  title ?? "",
                  maxLines: 1,
                  textScaleFactor: 1.2,
                ),
              ),
            if (subtitle != null)
              Expanded(
                flex: 1,
                child: Text(
                  subtitle ?? "",
                  maxLines: 1,
                  textScaleFactor: 0.9,
                ),
              ),
          ]),
    );
  }
}
