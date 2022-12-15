// import 'package:flutter/material.dart';

// import '../constant.dart';

// Widget drawer(
//     int i, Size size, int index, BuildContext context, List<String> taps) {
//   return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
//     return Container(
//       height: size.height / 15,
//       color: index == i ? Colors.lightBlue.withOpacity(.2) : null,
//       child: GestureDetector(
//         onTap: () => setState(() => {index = i, Navigator.of(context).pop()}),
//         child: Padding(
//           padding: const EdgeInsets.all(2.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 taps[i],
//                 style: index == i ? fileTitle(size / 1.5) : null,
//               ),
//               Container(
//                 color: index == i ? Colors.lightBlue : null,
//                 width: 5,
//                 height: size.height / 15,
//                 child: Text(''),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   });
// }
