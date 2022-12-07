




//   import 'dart:convert';

// import 'package:flutter/widgets.dart';

// import '../main.dart';

// Future<List> getIt(String privateUrl,) async {
//     List list = [];
//     if (widget.user.user!['dep'] != 'Department of Statistics') {
//       try {
//         await http.get(
//           Uri.parse('$url$privateUrl/fileid/${widget.file['id']}'),
//           headers: {
//             'Accept': 'application/json',
//             'Authorization': 'Bearer ${widget.user.token!}'
//           },
//         ).then((value) {
//           if (value.statusCode == 200) {
//             list = json.decode(value.body);

//             return list;
//           } else {
//             errono("${json.decode(value.body)}", "${json.decode(value.body)}",
//                 context, true, Container(), 1);
//             return list;
//           }
//         });
//       } catch (e) {
//         print(e);
//         return list;
//       }
//     }

//     return list;
//     // ... Navigate To your Home Page
//   }
  