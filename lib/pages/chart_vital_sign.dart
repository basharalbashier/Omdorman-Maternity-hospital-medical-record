import 'package:aldayat_screens/models/am_or_pm_time.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chartooo extends StatefulWidget {
  final List data;
  Chartooo({Key? key, required this.data}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Chartooo> {
  List<List<_SalesData>> allData = [];
  List<_SalesData> prus = [];
  List<_SalesData> puls = [];
  List<_SalesData> breath = [];
  List<_SalesData> temp = [];
  List<_SalesData> other = [];
  List<String> titles = ["Blood Pruser", "Pulse", "Breath", "Temp", "Other"];
  @override
  void initState() {
    for (Map i in widget.data) {
      prus.add(_SalesData(
          amOrPm(i['created_at'], true),
          double.parse(
              i['bp'].toString().replaceAll("/", ".").replaceAll(" ", ''))));
      puls.add(_SalesData(
          amOrPm(i['created_at'], true), double.parse(i['puls'] ?? "0")));
      breath.add(_SalesData(
          amOrPm(i['created_at'], true), double.parse(i['breath'] ?? "0")));
      temp.add(_SalesData(
          amOrPm(i['created_at'], true), double.parse(i['temp'] ?? "0")));
      other.add(_SalesData(
          amOrPm(i['created_at'], true), double.parse(i['other'] ?? "0")));
    }
    allData = [prus, puls, breath, temp, other];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        //Initialize the chart widget
        SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            // Chart title
            title: ChartTitle(text: 'Vital Sign'),
            // Enable legend
            legend: Legend(isVisible: true), // Enable tooltip
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <ChartSeries<_SalesData, String>>[
              for (int i = 0; i < allData.length; i++)
                LineSeries<_SalesData, String>(
                    isVisibleInLegend: true,
                    legendItemText: titles[i],
                    dataSource: allData[i],
                    xValueMapper: (_SalesData sales, _) => sales.year,
                    yValueMapper: (_SalesData sales, _) => sales.sales,
                    dataLabelSettings: DataLabelSettings(isVisible: true))
            ]),
      ]),
    ));
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
