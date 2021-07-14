import 'package:flutter/material.dart';
import 'package:flutter_practice2/static.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key, required this.children}) : super(key: key);
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          canPop(context),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: children),
            ),
          ),
        ],
      ),
      height: topSectionHeight(MediaQuery.of(context).size.height.toInt()),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(70),
              bottomRight: Radius.circular(70))),
    );
  }

  Widget canPop(BuildContext context) {
    return Navigator.of(context).canPop()
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    )),
              ),
            ],
          )
        : SizedBox(height: 60);
  }
}
