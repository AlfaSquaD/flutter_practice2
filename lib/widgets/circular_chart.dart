import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

typedef StringMapper<T> = String Function(T value, int index);
typedef NumMapper<T> = num Function(T value, int index);

class CircularChart<T> extends StatelessWidget {
  const CircularChart(
      {Key? key,
      required this.dataSource,
      required this.xMapper,
      required this.dataLabelMapper,
      required this.yMapper,
      required this.chartTitle})
      : super(key: key);
  final String chartTitle;
  final List<T> dataSource;
  final StringMapper<T> xMapper;
  final NumMapper<T> yMapper;
  final StringMapper<T> dataLabelMapper;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: SfCircularChart(
          title: ChartTitle(text: chartTitle),
          legend: Legend(
              isVisible: true,
              position: LegendPosition.bottom,
              alignment: ChartAlignment.center,
              offset: Offset(0, 10)),
          series: <PieSeries<T, String>>[
            PieSeries<T, String>(
                animationDuration: 750,
                enableSmartLabels: true,
                explode: false,
                dataSource: dataSource,
                xValueMapper: xMapper,
                yValueMapper: yMapper,
                dataLabelMapper: dataLabelMapper,
                dataLabelSettings: DataLabelSettings(
                    isVisible: true,
                    showZeroValue: false,
                    alignment: ChartAlignment.center,
                    labelPosition: ChartDataLabelPosition.outside)),
          ]),
    );
  }
}
