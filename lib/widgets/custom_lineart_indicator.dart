import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class IndicatorData extends ChangeNotifier with EquatableMixin {
  double target;
  double current;
  double percent;

  IndicatorData({required this.target, required this.current})
      : percent = (current / target);

  void updateTarget(double newTarget) {
    this.target = newTarget;
    updatePercent();
  }

  void updateCurrent(double newCurrent) {
    this.current = newCurrent;
    updatePercent();
  }

  void updatePercent() {
    this.percent = (this.current / this.target);
    notifyListeners();
  }

  void updateAll(double newTarget, double newCurrent, double newPercent) {
    this.target = newTarget;
    this.current = newCurrent;
    updatePercent();
  }

  @override
  List<Object?> get props => [this.current, this.target];
}

class CustomLinearIndicator extends StatefulWidget {
  final String targetName;
  final IndicatorData data;
  final Color normalColor;
  final Color exceedColor;

  CustomLinearIndicator(
      {required this.targetName,
      required this.data,
      required this.normalColor,
      required this.exceedColor});

  @override
  _CustomLinearIndicatorState createState() => _CustomLinearIndicatorState();
}

class _CustomLinearIndicatorState extends State<CustomLinearIndicator> {
  @override
  Widget build(BuildContext context) {
    widget.data.addListener(onUpdate);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LinearPercentIndicator(
        progressColor:
            widget.data.percent > 1 ? widget.exceedColor : widget.normalColor,
        width: MediaQuery.of(context).size.width / 100 * 60,
        alignment: MainAxisAlignment.center,
        lineHeight: 20,
        animation: true,
        padding: const EdgeInsets.all(16),
        leading: Container(
            width: MediaQuery.of(context).size.width / 100 * 30,
            child: Text(
              widget.targetName,
            )),
        percent: widget.data.percent > 1 ? 1 : widget.data.percent,
      ),
    );
  }

  void onUpdate() {
    setState(() {});
  }
}
