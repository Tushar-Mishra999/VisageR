import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

Map<String, double> dataMap = {"Present": 8, "Absent": 2};
final colorList = <Color>[
  const Color(0xff002003),
  const Color(0xffADEFD1)
  // const Color(0xff03fc17),
  // const Color(0xfff50a29)
  // const Color(0xfffdcb6e),
  // const Color(0xff0984e3),
  // const Color(0xfffd79a8),
  // const Color(0xffe17055),
  // const Color(0xff6c5ce7),
];

class ViewAttendance extends StatelessWidget {
  const ViewAttendance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PieChart(
        dataMap: dataMap,
        animationDuration: Duration(milliseconds: 800),
        chartLegendSpacing: 32,
        chartRadius: MediaQuery.of(context).size.width / 1.5,
        colorList: colorList,
        initialAngleInDegree: 0,
        chartType: ChartType.ring,
        ringStrokeWidth: 32,
        centerText: "",
        legendOptions: const LegendOptions(
          showLegendsInRow: false,
          legendPosition: LegendPosition.bottom,
          showLegends: true,
          legendShape: BoxShape.circle,
          legendTextStyle: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        chartValuesOptions: const ChartValuesOptions(
          showChartValueBackground: false,
          chartValueStyle:
              TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          showChartValues: true,
          showChartValuesInPercentage: true,
          showChartValuesOutside: false,
          decimalPlaces: 1,
        ),
        // gradientList: ---To add gradient colors---
        // emptyColorGradient: ---Empty Color gradient---
      ),
    );
  }
}
