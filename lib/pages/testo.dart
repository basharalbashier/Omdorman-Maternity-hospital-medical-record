// // // import 'dart:async';
// // // import 'dart:math';

// // // import 'package:fl_chart/fl_chart.dart';
// // // import 'package:flutter/material.dart';

// // // class BarChartSample1 extends StatefulWidget {
// // //   const BarChartSample1({super.key});

// // //   List<Color> get availableColors => const <Color>[
// // //         Colors.purpleAccent,
// // //         Colors.yellow,
// // //         Colors.lightBlue,
// // //         Colors.orange,
// // //         Colors.pink,
// // //         Colors.redAccent,
// // //       ];

// // //   @override
// // //   State<StatefulWidget> createState() => BarChartSample1State();
// // // }

// // // class BarChartSample1State extends State<BarChartSample1> {
// // //   final Color barBackgroundColor = const Color(0xff72d8bf);
// // //   final Duration animDuration = const Duration(milliseconds: 250);

// // //   int touchedIndex = -1;

// // //   bool isPlaying = false;

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return AspectRatio(
// // //       aspectRatio: 1,
// // //       child: Card(
// // //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
// // //         color: const Color(0xff81e5cd),
// // //         child: Stack(
// // //           children: <Widget>[
// // //             Padding(
// // //               padding: const EdgeInsets.all(16),
// // //               child: Column(
// // //                 crossAxisAlignment: CrossAxisAlignment.stretch,
// // //                 children: <Widget>[
// // //                   const Text(
// // //                     'Mingguan',
// // //                     style: TextStyle(
// // //                       color: Color(0xff0f4a3c),
// // //                       fontSize: 24,
// // //                       fontWeight: FontWeight.bold,
// // //                     ),
// // //                   ),
// // //                   const SizedBox(
// // //                     height: 4,
// // //                   ),
// // //                   const Text(
// // //                     'Grafik konsumsi kalori',
// // //                     style: TextStyle(
// // //                       color: Color(0xff379982),
// // //                       fontSize: 18,
// // //                       fontWeight: FontWeight.bold,
// // //                     ),
// // //                   ),
// // //                   const SizedBox(
// // //                     height: 38,
// // //                   ),
// // //                   Expanded(
// // //                     child: Padding(
// // //                       padding: const EdgeInsets.symmetric(horizontal: 8),
// // //                       child: BarChart(
// // //                         isPlaying ? randomData() : mainBarData(),
// // //                         swapAnimationDuration: animDuration,
// // //                       ),
// // //                     ),
// // //                   ),
// // //                   const SizedBox(
// // //                     height: 12,
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //             Padding(
// // //               padding: const EdgeInsets.all(8),
// // //               child: Align(
// // //                 alignment: Alignment.topRight,
// // //                 child: IconButton(
// // //                   icon: Icon(
// // //                     isPlaying ? Icons.pause : Icons.play_arrow,
// // //                     color: const Color(0xff0f4a3c),
// // //                   ),
// // //                   onPressed: () {
// // //                     setState(() {
// // //                       isPlaying = !isPlaying;
// // //                       if (isPlaying) {
// // //                         refreshState();
// // //                       }
// // //                     });
// // //                   },
// // //                 ),
// // //               ),
// // //             )
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   BarChartGroupData makeGroupData(
// // //     int x,
// // //     double y, {
// // //     bool isTouched = false,
// // //     Color barColor = Colors.white,
// // //     double width = 22,
// // //     List<int> showTooltips = const [],
// // //   }) {
// // //     return BarChartGroupData(
// // //       x: x,
// // //       barRods: [
// // //         BarChartRodData(
// // //           toY: isTouched ? y + 1 : y,
// // //           color: isTouched ? Colors.yellow : barColor,
// // //           width: width,
// // //           borderSide: isTouched
// // //               ? BorderSide(color: Colors.yellow..shade900)
// // //               : const BorderSide(color: Colors.white, width: 0),
// // //           backDrawRodData: BackgroundBarChartRodData(
// // //             show: true,
// // //             toY: 20,
// // //             color: barBackgroundColor,
// // //           ),
// // //         ),
// // //       ],
// // //       showingTooltipIndicators: showTooltips,
// // //     );
// // //   }

// // //   List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
// // //         switch (i) {
// // //           case 0:
// // //             return makeGroupData(0, 5, isTouched: i == touchedIndex);
// // //           case 1:
// // //             return makeGroupData(1, 6.5, isTouched: i == touchedIndex);
// // //           case 2:
// // //             return makeGroupData(2, 5, isTouched: i == touchedIndex);
// // //           case 3:
// // //             return makeGroupData(3, 7.5, isTouched: i == touchedIndex);
// // //           case 4:
// // //             return makeGroupData(4, 9, isTouched: i == touchedIndex);
// // //           case 5:
// // //             return makeGroupData(5, 11.5, isTouched: i == touchedIndex);
// // //           case 6:
// // //             return makeGroupData(6, 6.5, isTouched: i == touchedIndex);
// // //           default:
// // //             return throw Error();
// // //         }
// // //       });

// // //   BarChartData mainBarData() {
// // //     return BarChartData(
// // //       barTouchData: BarTouchData(
// // //         touchTooltipData: BarTouchTooltipData(
// // //           tooltipBgColor: Colors.blueGrey,
// // //           getTooltipItem: (group, groupIndex, rod, rodIndex) {
// // //             String weekDay;
// // //             switch (group.x) {
// // //               case 0:
// // //                 weekDay = 'Monday';
// // //                 break;
// // //               case 1:
// // //                 weekDay = 'Tuesday';
// // //                 break;
// // //               case 2:
// // //                 weekDay = 'Wednesday';
// // //                 break;
// // //               case 3:
// // //                 weekDay = 'Thursday';
// // //                 break;
// // //               case 4:
// // //                 weekDay = 'Friday';
// // //                 break;
// // //               case 5:
// // //                 weekDay = 'Saturday';
// // //                 break;
// // //               case 6:
// // //                 weekDay = 'Sunday';
// // //                 break;
// // //               default:
// // //                 throw Error();
// // //             }
// // //             return BarTooltipItem(
// // //               '$weekDay\n',
// // //               const TextStyle(
// // //                 color: Colors.white,
// // //                 fontWeight: FontWeight.bold,
// // //                 fontSize: 18,
// // //               ),
// // //               children: <TextSpan>[
// // //                 TextSpan(
// // //                   text: (rod.toY - 1).toString(),
// // //                   style: const TextStyle(
// // //                     color: Colors.yellow,
// // //                     fontSize: 16,
// // //                     fontWeight: FontWeight.w500,
// // //                   ),
// // //                 ),
// // //               ],
// // //             );
// // //           },
// // //         ),
// // //         touchCallback: (FlTouchEvent event, barTouchResponse) {
// // //           setState(() {
// // //             if (!event.isInterestedForInteractions ||
// // //                 barTouchResponse == null ||
// // //                 barTouchResponse.spot == null) {
// // //               touchedIndex = -1;
// // //               return;
// // //             }
// // //             touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
// // //           });
// // //         },
// // //       ),
// // //       titlesData: FlTitlesData(
// // //         show: true,
// // //         rightTitles: AxisTitles(
// // //           sideTitles: SideTitles(showTitles: false),
// // //         ),
// // //         topTitles: AxisTitles(
// // //           sideTitles: SideTitles(showTitles: false),
// // //         ),
// // //         bottomTitles: AxisTitles(
// // //           sideTitles: SideTitles(
// // //             showTitles: true,
// // //             getTitlesWidget: getTitles,
// // //             reservedSize: 38,
// // //           ),
// // //         ),
// // //         leftTitles: AxisTitles(
// // //           sideTitles: SideTitles(
// // //             showTitles: false,
// // //           ),
// // //         ),
// // //       ),
// // //       borderData: FlBorderData(
// // //         show: false,
// // //       ),
// // //       barGroups: showingGroups(),
// // //       gridData: FlGridData(show: false),
// // //     );
// // //   }

// // //   Widget getTitles(double value, TitleMeta meta) {
// // //     const style = TextStyle(
// // //       color: Colors.white,
// // //       fontWeight: FontWeight.bold,
// // //       fontSize: 14,
// // //     );
// // //     Widget text;
// // //     switch (value.toInt()) {
// // //       case 0:
// // //         text = const Text('M', style: style);
// // //         break;
// // //       case 1:
// // //         text = const Text('T', style: style);
// // //         break;
// // //       case 2:
// // //         text = const Text('W', style: style);
// // //         break;
// // //       case 3:
// // //         text = const Text('T', style: style);
// // //         break;
// // //       case 4:
// // //         text = const Text('F', style: style);
// // //         break;
// // //       case 5:
// // //         text = const Text('S', style: style);
// // //         break;
// // //       case 6:
// // //         text = const Text('S', style: style);
// // //         break;
// // //       default:
// // //         text = const Text('', style: style);
// // //         break;
// // //     }
// // //     return SideTitleWidget(
// // //       axisSide: meta.axisSide,
// // //       space: 16,
// // //       child: text,
// // //     );
// // //   }

// // //   BarChartData randomData() {
// // //     return BarChartData(
// // //       barTouchData: BarTouchData(
// // //         enabled: false,
// // //       ),
// // //       titlesData: FlTitlesData(
// // //         show: true,
// // //         bottomTitles: AxisTitles(
// // //           sideTitles: SideTitles(
// // //             showTitles: true,
// // //             getTitlesWidget: getTitles,
// // //             reservedSize: 38,
// // //           ),
// // //         ),
// // //         leftTitles: AxisTitles(
// // //           sideTitles: SideTitles(
// // //             showTitles: false,
// // //           ),
// // //         ),
// // //         topTitles: AxisTitles(
// // //           sideTitles: SideTitles(
// // //             showTitles: false,
// // //           ),
// // //         ),
// // //         rightTitles: AxisTitles(
// // //           sideTitles: SideTitles(
// // //             showTitles: false,
// // //           ),
// // //         ),
// // //       ),
// // //       borderData: FlBorderData(
// // //         show: false,
// // //       ),
// // //       barGroups: List.generate(7, (i) {
// // //         switch (i) {
// // //           case 0:
// // //             return makeGroupData(
// // //               0,
// // //               Random().nextInt(15).toDouble() + 6,
// // //               barColor: widget.availableColors[
// // //                   Random().nextInt(widget.availableColors.length)],
// // //             );
// // //           case 1:
// // //             return makeGroupData(
// // //               1,
// // //               Random().nextInt(15).toDouble() + 6,
// // //               barColor: widget.availableColors[
// // //                   Random().nextInt(widget.availableColors.length)],
// // //             );
// // //           case 2:
// // //             return makeGroupData(
// // //               2,
// // //               Random().nextInt(15).toDouble() + 6,
// // //               barColor: widget.availableColors[
// // //                   Random().nextInt(widget.availableColors.length)],
// // //             );
// // //           case 3:
// // //             return makeGroupData(
// // //               3,
// // //               Random().nextInt(15).toDouble() + 6,
// // //               barColor: widget.availableColors[
// // //                   Random().nextInt(widget.availableColors.length)],
// // //             );
// // //           case 4:
// // //             return makeGroupData(
// // //               4,
// // //               Random().nextInt(15).toDouble() + 6,
// // //               barColor: widget.availableColors[
// // //                   Random().nextInt(widget.availableColors.length)],
// // //             );
// // //           case 5:
// // //             return makeGroupData(
// // //               5,
// // //               Random().nextInt(15).toDouble() + 6,
// // //               barColor: widget.availableColors[
// // //                   Random().nextInt(widget.availableColors.length)],
// // //             );
// // //           case 6:
// // //             return makeGroupData(
// // //               6,
// // //               Random().nextInt(15).toDouble() + 6,
// // //               barColor: widget.availableColors[
// // //                   Random().nextInt(widget.availableColors.length)],
// // //             );
// // //           default:
// // //             return throw Error();
// // //         }
// // //       }),
// // //       gridData: FlGridData(show: false),
// // //     );
// // //   }

// // //   Future<dynamic> refreshState() async {
// // //     setState(() {});
// // //     await Future<dynamic>.delayed(
// // //       animDuration + const Duration(milliseconds: 50),
// // //     );
// // //     if (isPlaying) {
// // //       await refreshState();
// // //     }
// // //   }
// // // }

// // import 'package:fl_chart/fl_chart.dart';
// // import 'package:flutter/material.dart';

// // class _LineChart extends StatelessWidget {
// //   const _LineChart({required this.isShowingMainData});

// //   final bool isShowingMainData;

// //   @override
// //   Widget build(BuildContext context) {
// //     return LineChart(
// //       isShowingMainData ? sampleData1 : sampleData2,
// //       swapAnimationDuration: const Duration(milliseconds: 250),
// //     );
// //   }

// //   LineChartData get sampleData1 => LineChartData(
// //         lineTouchData: lineTouchData1,
// //         gridData: gridData,
// //         titlesData: titlesData1,
// //         borderData: borderData,
// //         lineBarsData: lineBarsData1,
// //         minX: 0,
// //         maxX: 14,
// //         maxY: 4,
// //         minY: 0,
// //       );

// //   LineChartData get sampleData2 => LineChartData(
// //         lineTouchData: lineTouchData2,
// //         gridData: gridData,
// //         titlesData: titlesData2,
// //         borderData: borderData,
// //         lineBarsData: lineBarsData2,
// //         minX: 0,
// //         maxX: 14,
// //         maxY: 6,
// //         minY: 0,
// //       );

// //   LineTouchData get lineTouchData1 => LineTouchData(
// //         handleBuiltInTouches: true,
// //         touchTooltipData: LineTouchTooltipData(
// //           tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
// //         ),
// //       );

// //   FlTitlesData get titlesData1 => FlTitlesData(
// //         bottomTitles: AxisTitles(
// //           sideTitles: bottomTitles,
// //         ),
// //         rightTitles: AxisTitles(
// //           sideTitles: SideTitles(showTitles: false),
// //         ),
// //         topTitles: AxisTitles(
// //           sideTitles: SideTitles(showTitles: false),
// //         ),
// //         leftTitles: AxisTitles(
// //           sideTitles: leftTitles(),
// //         ),
// //       );

// //   List<LineChartBarData> get lineBarsData1 => [
// //         lineChartBarData1_1,
// //         lineChartBarData1_2,
// //         lineChartBarData1_3,
// //       ];

// //   LineTouchData get lineTouchData2 => LineTouchData(
// //         enabled: false,
// //       );

// //   FlTitlesData get titlesData2 => FlTitlesData(
// //         bottomTitles: AxisTitles(
// //           sideTitles: bottomTitles,
// //         ),
// //         rightTitles: AxisTitles(
// //           sideTitles: SideTitles(showTitles: false),
// //         ),
// //         topTitles: AxisTitles(
// //           sideTitles: SideTitles(showTitles: false),
// //         ),
// //         leftTitles: AxisTitles(
// //           sideTitles: leftTitles(),
// //         ),
// //       );

// //   List<LineChartBarData> get lineBarsData2 => [
// //         lineChartBarData2_1,
// //         lineChartBarData2_2,
// //         lineChartBarData2_3,
// //       ];

// //   Widget leftTitleWidgets(double value, TitleMeta meta) {
// //     const style = TextStyle(
// //       color: Color(0xff75729e),
// //       fontWeight: FontWeight.bold,
// //       fontSize: 14,
// //     );
// //     String text;
// //     switch (value.toInt()) {
// //       case 1:
// //         text = '1m';
// //         break;
// //       case 2:
// //         text = '2m';
// //         break;
// //       case 3:
// //         text = '3m';
// //         break;
// //       case 4:
// //         text = '5m';
// //         break;
// //       case 5:
// //         text = '6m';
// //         break;
// //       default:
// //         return Container();
// //     }

// //     return Text(text, style: style, textAlign: TextAlign.center);
// //   }

// //   SideTitles leftTitles() => SideTitles(
// //         getTitlesWidget: leftTitleWidgets,
// //         showTitles: true,
// //         interval: 1,
// //         reservedSize: 40,
// //       );

// //   Widget bottomTitleWidgets(double value, TitleMeta meta) {
// //     const style = TextStyle(
// //       color: Color(0xff72719b),
// //       fontWeight: FontWeight.bold,
// //       fontSize: 16,
// //     );
// //     Widget text;
// //     switch (value.toInt()) {
// //       case 2:
// //         text = const Text('SEPT', style: style);
// //         break;
// //       case 7:
// //         text = const Text('OCT', style: style);
// //         break;
// //       case 12:
// //         text = const Text('DEC', style: style);
// //         break;
// //       default:
// //         text = const Text('');
// //         break;
// //     }

// //     return SideTitleWidget(
// //       axisSide: meta.axisSide,
// //       space: 10,
// //       child: text,
// //     );
// //   }

// //   SideTitles get bottomTitles => SideTitles(
// //         showTitles: true,
// //         reservedSize: 32,
// //         interval: 1,
// //         getTitlesWidget: bottomTitleWidgets,
// //       );

// //   FlGridData get gridData => FlGridData(show: false);

// //   FlBorderData get borderData => FlBorderData(
// //         show: true,
// //         border: const Border(
// //           bottom: BorderSide(color: Color(0xff4e4965), width: 4),
// //           left: BorderSide(color: Colors.transparent),
// //           right: BorderSide(color: Colors.transparent),
// //           top: BorderSide(color: Colors.transparent),
// //         ),
// //       );

// //   LineChartBarData get lineChartBarData1_1 => LineChartBarData(
// //         isCurved: true,
// //         color: const Color(0xff4af699),
// //         barWidth: 8,
// //         isStrokeCapRound: true,
// //         dotData: FlDotData(show: false),
// //         belowBarData: BarAreaData(show: false),
// //         spots: const [
// //           FlSpot(1, 1),
// //           FlSpot(3, 1.5),
// //           FlSpot(5, 1.4),
// //           FlSpot(7, 3.4),
// //           FlSpot(10, 2),
// //           FlSpot(12, 2.2),
// //           FlSpot(13, 1.8),
// //         ],
// //       );

// //   LineChartBarData get lineChartBarData1_2 => LineChartBarData(
// //         isCurved: true,
// //         color: const Color(0xffaa4cfc),
// //         barWidth: 8,
// //         isStrokeCapRound: true,
// //         dotData: FlDotData(show: false),
// //         belowBarData: BarAreaData(
// //           show: false,
// //           color: const Color(0x00aa4cfc),
// //         ),
// //         spots: const [
// //           FlSpot(1, 1),
// //           FlSpot(3, 2.8),
// //           FlSpot(7, 1.2),
// //           FlSpot(10, 2.8),
// //           FlSpot(12, 2.6),
// //           FlSpot(13, 3.9),
// //         ],
// //       );

// //   LineChartBarData get lineChartBarData1_3 => LineChartBarData(
// //         isCurved: true,
// //         color: const Color(0xff27b6fc),
// //         barWidth: 8,
// //         isStrokeCapRound: true,
// //         dotData: FlDotData(show: false),
// //         belowBarData: BarAreaData(show: false),
// //         spots: const [
// //           FlSpot(1, 2.8),
// //           FlSpot(3, 1.9),
// //           FlSpot(6, 3),
// //           FlSpot(10, 1.3),
// //           FlSpot(13, 2.5),
// //         ],
// //       );

// //   LineChartBarData get lineChartBarData2_1 => LineChartBarData(
// //         isCurved: true,
// //         curveSmoothness: 0,
// //         color: const Color(0x444af699),
// //         barWidth: 4,
// //         isStrokeCapRound: true,
// //         dotData: FlDotData(show: false),
// //         belowBarData: BarAreaData(show: false),
// //         spots: const [
// //           FlSpot(1, 1),
// //           FlSpot(3, 4),
// //           FlSpot(5, 1.8),
// //           FlSpot(7, 5),
// //           FlSpot(10, 2),
// //           FlSpot(12, 2.2),
// //           FlSpot(13, 1.8),
// //         ],
// //       );

// //   LineChartBarData get lineChartBarData2_2 => LineChartBarData(
// //         isCurved: true,
// //         color: const Color(0x99aa4cfc),
// //         barWidth: 4,
// //         isStrokeCapRound: true,
// //         dotData: FlDotData(show: false),
// //         belowBarData: BarAreaData(
// //           show: true,
// //           color: const Color(0x33aa4cfc),
// //         ),
// //         spots: const [
// //           FlSpot(1, 1),
// //           FlSpot(3, 2.8),
// //           FlSpot(7, 1.2),
// //           FlSpot(10, 2.8),
// //           FlSpot(12, 2.6),
// //           FlSpot(13, 3.9),
// //         ],
// //       );

// //   LineChartBarData get lineChartBarData2_3 => LineChartBarData(
// //         isCurved: true,
// //         curveSmoothness: 0,
// //         color: const Color(0x4427b6fc),
// //         barWidth: 2,
// //         isStrokeCapRound: true,
// //         dotData: FlDotData(show: true),
// //         belowBarData: BarAreaData(show: false),
// //         spots: const [
// //           FlSpot(1, 3.8),
// //           FlSpot(3, 1.9),
// //           FlSpot(6, 5),
// //           FlSpot(10, 3.3),
// //           FlSpot(13, 4.5),
// //         ],
// //       );
// // }

// // class LineChartSample1 extends StatefulWidget {
// //   const LineChartSample1({super.key});

// //   @override
// //   State<StatefulWidget> createState() => LineChartSample1State();
// // }

// // class LineChartSample1State extends State<LineChartSample1> {
// //   late bool isShowingMainData;

// //   @override
// //   void initState() {
// //     super.initState();
// //     isShowingMainData = true;
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return AspectRatio(
// //       aspectRatio: 1.23,
// //       child: DecoratedBox(
// //         decoration: const BoxDecoration(
// //           borderRadius: BorderRadius.all(Radius.circular(18)),
// //           gradient: LinearGradient(
// //             colors: [
// //               Color(0xff2c274c),
// //               Color(0xff46426c),
// //             ],
// //             begin: Alignment.bottomCenter,
// //             end: Alignment.topCenter,
// //           ),
// //         ),
// //         child: Stack(
// //           children: <Widget>[
// //             Column(
// //               crossAxisAlignment: CrossAxisAlignment.stretch,
// //               children: <Widget>[
// //                 const SizedBox(
// //                   height: 37,
// //                 ),
// //                 const Text(
// //                   'Unfold Shop 2018',
// //                   style: TextStyle(
// //                     color: Color(0xff827daa),
// //                     fontSize: 16,
// //                   ),
// //                   textAlign: TextAlign.center,
// //                 ),
// //                 const SizedBox(
// //                   height: 4,
// //                 ),
// //                 const Text(
// //                   'Monthly Sales',
// //                   style: TextStyle(
// //                     color: Colors.white,
// //                     fontSize: 32,
// //                     fontWeight: FontWeight.bold,
// //                     letterSpacing: 2,
// //                   ),
// //                   textAlign: TextAlign.center,
// //                 ),
// //                 const SizedBox(
// //                   height: 37,
// //                 ),
// //                 Expanded(
// //                   child: Padding(
// //                     padding: const EdgeInsets.only(right: 16, left: 6),
// //                     child: _LineChart(isShowingMainData: isShowingMainData),
// //                   ),
// //                 ),
// //                 const SizedBox(
// //                   height: 10,
// //                 ),
// //               ],
// //             ),
// //             IconButton(
// //               icon: Icon(
// //                 Icons.refresh,
// //                 color: Colors.white.withOpacity(isShowingMainData ? 1.0 : 0.5),
// //               ),
// //               onPressed: () {
// //                 setState(() {
// //                   isShowingMainData = !isShowingMainData;
// //                 });
// //               },
// //             )
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';

// class LineChartSample5 extends StatelessWidget {
//   const LineChartSample5({super.key});

//   List<int> get showIndexes => const [1, 3, 5];
//   List<FlSpot> get allSpots => const [
//         FlSpot(0, 1),
//         FlSpot(1, 2),
//         FlSpot(2, 1.5),
//         FlSpot(3, 3),
//         FlSpot(4, 3.5),
//         FlSpot(5, 5),
//         FlSpot(6, 8),
//       ];

//   Widget bottomTitleWidgets(double value, TitleMeta meta) {
//     const style = TextStyle(
//       fontWeight: FontWeight.bold,
//       color: Colors.blueGrey,
//       fontFamily: 'Digital',
//       fontSize: 18,
//     );
//     String text;
//     switch (value.toInt()) {
//       case 0:
//         text = '00:00';
//         break;
//       case 1:
//         text = '04:00';
//         break;
//       case 2:
//         text = '08:00';
//         break;
//       case 3:
//         text = '12:00';
//         break;
//       case 4:
//         text = '16:00';
//         break;
//       case 5:
//         text = '20:00';
//         break;
//       case 6:
//         text = '23:59';
//         break;
//       default:
//         return Container();
//     }

//     return SideTitleWidget(
//       axisSide: meta.axisSide,
//       child: Text(text, style: style),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final lineBarsData = [
//       LineChartBarData(
//         showingIndicators: showIndexes,
//         spots: allSpots,
//         isCurved: true,
//         barWidth: 4,
//         shadow: const Shadow(
//           blurRadius: 8,
//         ),
//         belowBarData: BarAreaData(
//           show: true,
//           gradient: LinearGradient(
//             colors: [
//               const Color(0xff12c2e9).withOpacity(0.4),
//               const Color(0xffc471ed).withOpacity(0.4),
//               const Color(0xfff64f59).withOpacity(0.4),
//             ],
//           ),
//         ),
//         dotData: FlDotData(show: false),
//         gradient: const LinearGradient(
//           colors: [
//             Color(0xff12c2e9),
//             Color(0xffc471ed),
//             Color(0xfff64f59),
//           ],
//           stops: [0.1, 0.4, 0.9],
//         ),
//       ),
//     ];

//     final tooltipsOnBar = lineBarsData[0];

//     return SizedBox(
//       width: 300,
//       height: 140,
//       child: LineChart(
//         LineChartData(
//           showingTooltipIndicators: showIndexes.map((index) {
//             return ShowingTooltipIndicators([
//               LineBarSpot(
//                 tooltipsOnBar,
//                 lineBarsData.indexOf(tooltipsOnBar),
//                 tooltipsOnBar.spots[index],
//               ),
//             ]);
//           }).toList(),
//           lineTouchData: LineTouchData(
//             enabled: false,
//             getTouchedSpotIndicator:
//                 (LineChartBarData barData, List<int> spotIndexes) {
//               return spotIndexes.map((index) {
//                 return TouchedSpotIndicatorData(
//                   FlLine(
//                     color: Colors.pink,
//                   ),
//                   FlDotData(
//                     show: true,
//                     getDotPainter: (spot, percent, barData, index) =>
//                         FlDotCirclePainter(
//                       radius: 8,
//                       color: lerpGradient(
//                         barData.gradient!.colors,
//                         barData.gradient!.stops!,
//                         percent / 100,
//                       ),
//                       strokeWidth: 2,
//                       strokeColor: Colors.black,
//                     ),
//                   ),
//                 );
//               }).toList();
//             },
//             touchTooltipData: LineTouchTooltipData(
//               tooltipBgColor: Colors.pink,
//               tooltipRoundedRadius: 8,
//               getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
//                 return lineBarsSpot.map((lineBarSpot) {
//                   return LineTooltipItem(
//                     lineBarSpot.y.toString(),
//                     const TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   );
//                 }).toList();
//               },
//             ),
//           ),
//           lineBarsData: lineBarsData,
//           minY: 0,
//           titlesData: FlTitlesData(
//             leftTitles: AxisTitles(
//               axisNameWidget: const Text('count'),
//               sideTitles: SideTitles(
//                 showTitles: false,
//                 reservedSize: 0,
//               ),
//             ),
//             bottomTitles: AxisTitles(
//               sideTitles: SideTitles(
//                 showTitles: true,
//                 interval: 1,
//                 getTitlesWidget: bottomTitleWidgets,
//               ),
//             ),
//             rightTitles: AxisTitles(
//               axisNameWidget: const Text('count'),
//               sideTitles: SideTitles(
//                 showTitles: false,
//                 reservedSize: 0,
//               ),
//             ),
//             topTitles: AxisTitles(
//               axisNameWidget: const Text(
//                 'Wall clock',
//                 textAlign: TextAlign.left,
//               ),
//               sideTitles: SideTitles(
//                 showTitles: true,
//                 reservedSize: 0,
//               ),
//             ),
//           ),
//           gridData: FlGridData(show: false),
//           borderData: FlBorderData(
//             show: true,
//           ),
//         ),
//       ),
//     );
//   }
// }

// /// Lerps between a [LinearGradient] colors, based on [t]
// Color lerpGradient(List<Color> colors, List<double> stops, double t) {
//   if (colors.isEmpty) {
//     throw ArgumentError('"colors" is empty.');
//   } else if (colors.length == 1) {
//     return colors[0];
//   }

//   if (stops.length != colors.length) {
//     stops = [];

//     /// provided gradientColorStops is invalid and we calculate it here
//     colors.asMap().forEach((index, color) {
//       final percent = 1.0 / (colors.length - 1);
//       stops.add(percent * index);
//     });
//   }

//   for (var s = 0; s < stops.length - 1; s++) {
//     final leftStop = stops[s];
//     final rightStop = stops[s + 1];
//     final leftColor = colors[s];
//     final rightColor = colors[s + 1];
//     if (t <= leftStop) {
//       return leftColor;
//     } else if (t < rightStop) {
//       final sectionT = (t - leftStop) / (rightStop - leftStop);
//       return Color.lerp(leftColor, rightColor, sectionT)!;
//     }
//   }
//   return colors.last;
// }

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Paragram extends StatelessWidget {
  final String title;
  const Paragram({super.key, required this.title});

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 0:
        text = '7:00';
        break;
      case 1:
        text = '8:00';
        break;
      case 2:
        text = '9:00';
        break;
      case 3:
        text = '10:00';
        break;
      case 4:
        text = '11:00';
        break;
      case 5:
        text = '12:00';
        break;
      case 6:
        text = '1:00';
        break;
      case 7:
        text = '2:00';
        break;
      case 8:
        text = '3:00';
        break;
      case 9:
        text = '4:00';
        break;
      case 10:
        text = '5:00';
        break;
      case 11:
        text = '6:00';
        break;
      case 12:
        text = '7:00';
        break;
      default:
        return Container();
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: _dateTextStyle),
    );
  }

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

  @override
  Widget build(BuildContext context) {
    const cutOffYValue = 100.0;

    return AspectRatio(
      aspectRatio: 3.4,
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 24),
        child: LineChart(
          LineChartData(
            lineTouchData: LineTouchData(enabled: true),
            lineBarsData: [
              LineChartBarData(
                spots: const [
                  FlSpot(0, 110),
                  FlSpot(1, 100),
                  FlSpot(2, 80),
                  FlSpot(3, 90),
                  FlSpot(4, 120),
                  FlSpot(5, 70),
                  FlSpot(6, 110),
                  FlSpot(7, 120),
                  FlSpot(8, 80),
                  FlSpot(9, 120),
                  FlSpot(10, 60),
                  FlSpot(11, 100),
                  FlSpot(12, 110),
                ],
                isCurved: true,
                barWidth: 3,
                color: Colors.blueGrey.shade900,
                belowBarData: BarAreaData(
                  show: true,
                  color: Colors.deepPurple.withOpacity(0.4),
                  cutOffY: cutOffYValue,
                  applyCutOffY: true,
                ),
                aboveBarData: BarAreaData(
                  show: true,
                  color: Colors.pink.withOpacity(0.6),
                  cutOffY: cutOffYValue,
                  applyCutOffY: true,
                ),
                dotData: FlDotData(
                  show: true,
                ),
              ),
            ],
            minY: 50,
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
                  child: Text(title),
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
                    value == 50;
              },
            ),
          ),
        ),
      ),
    );
  }
}
// "name_of_mother","sex","baby_no","baby_no",""

  
