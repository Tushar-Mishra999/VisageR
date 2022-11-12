import 'package:facialrecognition_attendance/provider/user_provider.dart';
import 'package:facialrecognition_attendance/services/view_attendance.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

Map<String, dynamic> attendanceList = {};
Map<String, double> dataMap = {"Present": 0, "Absent": 0};
final colorList = <Color>[
  const Color(0xff00203f),
  const Color(0xffadefd1),
];

class ViewAttendance extends StatefulWidget {
  const ViewAttendance({Key? key}) : super(key: key);

  @override
  State<ViewAttendance> createState() => _ViewAttendanceState();
}

class _ViewAttendanceState extends State<ViewAttendance> {
  @override
  void initState() {
    super.initState();
    fetch();
  }

  fetch() async {
    attendanceList = await viewAttendance(context);
    dataMap['Present'] = attendanceList['present'];
    dataMap['Absent'] = attendanceList['absent'];
    setState(() {});
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
          future: viewAttendance(context),
          builder: (context, snapshot) => snapshot.hasData
              ? PieChart(
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
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  chartValuesOptions: const ChartValuesOptions(
                    showChartValueBackground: false,
                    chartValueStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                    showChartValues: true,
                    showChartValuesInPercentage: true,
                    showChartValuesOutside: false,
                    decimalPlaces: 1,
                  ),
                  // gradientList: ---To add gradient colors---
                  // emptyColorGradient: ---Empty Color gradient---
                )
              : const Center(
                  child:
                      CircularProgressIndicator(backgroundColor: Colors.purple),
                )),
    );
  }
}
