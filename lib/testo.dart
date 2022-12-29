import 'package:aldayat_screens/models/am_or_pm_time.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';



class Chartooo extends StatefulWidget {
  final List data;
  Chartooo({Key? key, required this.data}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Chartooo> {
 List< List<_SalesData>> allData = [


  ];
  @override
  void initState() {
  for(Map i in widget.data){
    
  for(int m=0;m <  i.entries.toList().length;m++)

    allData[m].add(
 _SalesData(amOrPm(i.entries.toList()[m].value, false), double.parse(i['puls'])),
    );
  }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
        body: Column(children: [
          //Initialize the chart widget
          SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              // Chart title
              title: ChartTitle(text: 'Half yearly sales analysis'),
              // Enable legend
              // Enable tooltip
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries<_SalesData, String>>[
                     for(var data in allData)
                LineSeries<_SalesData, String>(
                    dataSource: data,
                    xValueMapper: (_SalesData sales, _) => sales.year,
                    yValueMapper: (_SalesData sales, _) => sales.sales,
                    // Enable data label
                    dataLabelSettings: DataLabelSettings(isVisible: true))
         
              ]),
        
        ]));
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;}