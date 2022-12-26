import 'package:aldayat_screens/models/am_or_pm_time.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Paragram extends StatefulWidget {
  final String title;
  final List data;
  const Paragram({super.key, required this.title, required this.data});

  @override
  State<Paragram> createState() => _ParagramState();
}

class _ParagramState extends State<Paragram> {
  Widget leftTitleWidgets(double value, TitleMeta meta) {
    print(value);
    const style = TextStyle(color: Colors.black, fontSize: 12);
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(' ${value < 70 ? "" : value}', style: style),
    );
  }

  static const _dateTextStyle = TextStyle(
    fontSize: 10,
    color: Colors.purple,
    fontWeight: FontWeight.bold,
  );
  List<FlSpot> drawLine = [];
  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    String time = amOrPm(widget.data[value.toInt()]['created_at'],false);

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 2,
      child: Text(time, style: _dateTextStyle),
    );
  }

  @override
  void initState() {
    drawLine = [
      for (int i = 0; i < widget.data.length; i++)
        FlSpot(i.toDouble(), double.parse(widget.data[i]['temp'])),
    ];
    print(drawLine);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // const cutOffYValue = 100.0;

    return AspectRatio(
      aspectRatio: 3.4,
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 24),
        child: LineChart(
          LineChartData(
            lineTouchData: LineTouchData(enabled: true),
            lineBarsData: [
              LineChartBarData(
                spots: drawLine,
                isCurved: true,
                barWidth: 3,
                color: Colors.blueGrey.shade900,
                // belowBarData: BarAreaData(
                //   show: true,
                //   color: Colors.deepPurple.withOpacity(0.4),
                //   cutOffY: cutOffYValue,
                //   applyCutOffY: false,
                // ),
                // aboveBarData: BarAreaData(
                //   show: true,
                //   color: Colors.pink.withOpacity(0.6),
                //   cutOffY: cutOffYValue,
                //   applyCutOffY: false,
                // ),

                dotData: FlDotData(
                  show: true,
                ),
              ),
            ],
            minY: 20,
            titlesData: FlTitlesData(
              show: true,
              topTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              bottomTitles: AxisTitles(
                // axisNameWidget: const Text(
                //   '2019',
                //   style: _dateTextStyle,
                // ),
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 18,
                  interval: 1,
                  getTitlesWidget: bottomTitleWidgets,
                ),
              ),
              leftTitles: AxisTitles(
                axisNameSize: 20,
                axisNameWidget: Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(widget.title),
                ),
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 10,
                  reservedSize: 40,
                  getTitlesWidget: leftTitleWidgets,
                ),
              ),
            ),
            gridData: FlGridData(
              show: true,
              drawVerticalLine: false,
              horizontalInterval: 1,
              checkToShowHorizontalLine: (double value) {
                return value == 100 ||
                    value == 60 ||
                    value == 40 ||
                    value == 150;
              },
            ),
          ),
        ),
      ),
    );
  }
}
