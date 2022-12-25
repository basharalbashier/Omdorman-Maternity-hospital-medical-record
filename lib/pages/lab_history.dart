// import 'dart:math' as math;
// import 'package:flutter/material.dart';

// import '../constant.dart';

// class LabHistory extends StatefulWidget {
//   final List source;
//   LabHistory({Key? key, required this.source}) : super(key: key);
//   @override
//   _DataPageState createState() => _DataPageState();
// }

// class _DataPageState extends State<LabHistory> {
//   List<Widget> labRequestWidgets = [];
//   // List<int> _perPages = [1,10, 20, 50, 100];
//   // int _total = 100;
//   // int? _currentPerPage = 2;
//   // List<bool>? _expanded;
//   // String? _searchKey = "id";

//   // int _currentPage = 1;
//   bool _shouldSee = false;
//   // List<Map<String, dynamic>> _sourceOriginal = [];
//   // List<Map<String, dynamic>> _sourceFiltered = [];
//   List<Map<String, dynamic>> _source = [];
//   List<Map<String, dynamic>> _selecteds = [];
//   // ignore: unused_field
//   String _selectableKey = "id";

//   // String? _sortColumn;
//   // bool _sortAscending = true;
//   // bool _isLoading = false;
//   // bool _showSelect = true;
//   // var random = new Random();

//   List<Map<String, dynamic>> _generateData() {
//     List<Map<String, dynamic>> temps = [];

//     for (var data in widget.source) {
//       temps.add({
//         "id": data['id'],
//         'Urine general': data['urine'] != 'false' ? data['urine'] : '-',
//         'Stool general': data['stoolG'] != 'false' ? data['stoolG'] : '-',
//         'B F F M': data['bffm'] != 'false' ? data['bffm'] : '-',
//         'E S R': data['esr'] != 'false' ? data['esr'] : '-',
//         'Stool for reducing substance':
//             data['stoolF'] != 'false' ? data['stoolF'] : '-',
//         'Viral Screening': data['viral'] != 'false' ? data['viral'] : '-',
//         'B.G': data['bG'] != 'false' ? data['bG'] : '-',
//         'C B C': data['cbc'] != 'false' ? data['cbc'] : '-',
//         'Sickling test': data['sick'] != 'false' ? data['sick'] : '-',
//         'Retics Count': data['retic'] != 'false' ? data['retic'] : '-',
//         'Platelet Count': data['plate'] != 'false' ? data['plate'] : '-',
//         'Coagulation': data['coag'] != 'false' ? data['coag'] : '-',
//         'PT + INR': data['pt'] != 'false' ? data['pt'] : '-',
//         'PTT': data['ptt'] != 'false' ? data['ptt'] : '-',
//         'F B G ': data['fbg'] != 'false' ? data['fbg'] : '-',
//         '2 H B B': data['hbb'] != 'false' ? data['hbb'] : '-',
//         'R B G': data['rbg'] != 'false' ? data['rbg'] : '-',
//         'HbAIC': data['hbAIC'] != 'false' ? data['hbAIC'] : '-',
//         'C R P': data['crp'] != 'false' ? data['crp'] : '-',
//         'Ca': data['ca'] != 'false' ? data['ca'] : '-',
//         'L F T': data['lft'] != 'false' ? data['lft'] : '-',
//         'R F T': data['rft'] != 'false' ? data['rft'] : '-',
//         'Thyroid profile': data['thy'] != 'false' ? data['thy'] : '-',
//         'Fertility profile': data['fer'] != 'false' ? data['fer'] : '-',
//         'Ca 125': data['ca125'] != 'false' ? data['ca125'] : '-',
//         'Urine culture + sensitivity':
//             data['urinC'] != 'false' ? data['urinC'] : '-',
//         'Stool culture + sensitivity':
//             data['stoolCul'] != 'false' ? data['stoolCul'] : '-',
//         'Blood culture + sensitivity':
//             data['bloodCul'] != 'false' ? data['bloodCul'] : '-',
//         'Fluid culture + sensitivity':
//             data['fluidCul'] != 'false' ? data['fluidCul'] : '-',
//         'Wond swab': data['wond'] != 'false' ? data['wond'] : '-',
//         'High vaginal swab': data['hiVag'] != 'false' ? data['hiVag'] : '-',
//         'Histopathology': data['histo'] != 'false' ? data['histo'] : '-',
//         "Cytology": data['cyto'] != 'false' ? data['cyto'] : '-',
//         'Status': data['status'],
//         // "Seen at": data['seen_at']==null?"In Progress..":data['seen_at'],
//         'Sent':
//             "${data['created_at'].substring(11, 16)}\n${data['created_at'].substring(0, 10)}",
//       });
//     }
//     setState(() {
//       _source = temps;
//     });
//     for (var i in _source) {
//       Map<String, dynamic> forWidget = {};
//       i.forEach((key, value) {
//         if (value != '-') {
//           forWidget[key] = value;
//         }
//       });

//       setState(() {
//         labRequestWidgets.add(Card(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//                 children: forWidget.entries.map((entry) {
//               var w = Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "${entry.key}".toUpperCase(),
//                       style: entry.key == 'id'
//                           ? TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
//                           : TextStyle(),
//                     ),
//                     entry.key != 'Status'
//                         ? Text("${entry.value}" == 'true'
//                             ? "In Progress.."
//                             : "${entry.value}")
//                         : CircularProgressIndicator(
//                             color: entry.value == "0"
//                                 ? Colors.amber
//                                 : entry.value == '3'
//                                     ? Colors.orange
//                                     : Colors.teal,
//                           ),
//                   ],
//                 ),
//               );
//               // doSomething(entry.key);
//               return w;
//             }).toList()),
//           ),
//         ));
//       });
//     }
//     return temps;
//   }

//   List inv = [
//     'id',
//     'Urine general',
//     'Stool general',
//     'B F F M',
//     'E S R',
//     'Stool for reducing substance',
//     'Viral Screening',
//     'B.G',
//     'C B C',
//     'Sickling test',
//     'Retics Count',
//     'Platelet Count',
//     'Coagulation',
//     'PT + INR',
//     'PTT',
//     'F B G ',
//     '2 H B B',
//     'R B G',
//     'HbAIC',
//     'C R P',
//     'Ca',
//     'L F T',
//     'R F T',
//     'Thyroid profile',
//     'Fertility profile',
//     'Ca 125',
//     'Urine culture + sensitivity',
//     'Stool culture + sensitivity',
//     'Blood culture + sensitivity',
//     'Fluid culture + sensitivity',
//     'Wond swab',
//     'High vaginal swab',
//     'Histopathology',
//     'Cytology',
//     'Status',
//     'Sent',
//     // "Seen at",
//   ];
//   @override
//   void initState() {
//     // print(widget.source);
//     super.initState();
//     _generateData();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     if (_source.isEmpty) {
//       return Scaffold(
//         body: Center(
//             child: CircularProgressIndicator(
//           strokeWidth: 1,
//         )),
//       );
//     }
//     return Scaffold(
//       body: SingleChildScrollView(
//           child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               mainAxisSize: MainAxisSize.max,
//               children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: GestureDetector(
//                 onTap: () => setState(() => _shouldSee = !_shouldSee),
//                 child: Row(
//                   children: [
//                     Text("Lab Requests History", style: fileTitle(size)),
//                     Icon(_shouldSee
//                         ? Icons.arrow_drop_up
//                         : Icons.arrow_drop_down)
//                   ],
//                 ),
//               ),
//             ),
//             for (var i in labRequestWidgets.reversed)
//               Visibility(visible: _shouldSee, child: i)
//           ])),
//     );
//   }
// }
