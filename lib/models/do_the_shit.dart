
  // doTheShit() async {
  //   for (int i = 0; i < 10; i++) {
  //     setState(() {
  //       dimo.add({
  //         "id": i,
  //         "comment":
  //             "Plain text ($i. txt) is a type of digital file that is free of computer tags, special formatting, and code. This is the only file type recognized by the Lexile Analyzer. Note: Copying and pasting or uploading text and text files other than plain text may include computer tags, special formatting, and code.Plain text (. txt) is a type of digital file that is free of computer tags, special formatting, and code. This is the only file type recognized by the Lexile Analyzer. Note: Copying and pasting or uploading text and text files other than plain text may include computer tags, special formatting, and code.Plain text (. txt) is a type of digital file that is free of computer tags, special formatting, and code. This is the only file type recognized by the Lexile Analyzer. Note: Copying and pasting or uploading text and text files other than plain text may include computer tags, special formatting, and code.Plain text (. txt) is a type of digital file that is free of computer tags, special formatting, and code. This is the only file type recognized by the Lexile Analyzer. Note: Copying and pasting or uploading text and text files other than plain text may include computer tags, special formatting, and code.Plain text (. txt) is a type of digital file that is free of computer tags, special formatting, and code. This is the only file type recognized by the Lexile Analyzer. Note: Copying and pasting or uploading text and text files other than plain text may include computer tags, special formatting, and code.Plain text (. txt) is a type of digital file that is free of computer tags, special formatting, and code. This is the only file type recognized by the Lexile Analyzer. Note: Copying and pasting or uploading text and text files other than plain text may include computer tags, special formatting, and code.Plain text (. txt) is a type of digital file that is free of computer tags, special formatting, and code. This is the only file type recognized by the Lexile Analyzer. Note: Copying and pasting or uploading text and text files other than plain text may include computer tags, special formatting, and code.",
  //         "dr_id": i,
  //         "created_at": "2022-11-12T17:34:29.$i",
  //         "urine": "file",
  //         "fh": "file",
  //         "eng": "file",
  //         "pres": "file",
  //         "fl": "file",
  //         "ga": "file",
  //         "bp": "digital",
  //         "hb": "Plain text",
  //         "next_visit": "free",
  //       });
  //     });
  //   }
  //   try {
  //     await http.get(
  //       Uri.parse('${url}user'),
  //       headers: {
  //         'Content-type': 'application/json',
  //         'Accept': 'application/json',
  //         // 'Authorization': 'Bearer ${user.token!}'
  //       },
  //     ).then((value) {
  //       if (value.statusCode == 200 || value.statusCode == 201) {
  //         // print(value.body);
  //         setState(() {
  //           dimo = json.decode(value.body);
  //         });
  //         List users = json.decode(value.body);

  //         storTheFuckers(users).then((value) async {
  //           List<int> ha = [];
  //           for (var i in dimo) {
  //             ha.add(i['id']);
  //           }

  //           findFromData(ha).then((value) {
  //             for (int i = 0; i < dimo.length; i++) {
  //               setState(() {
  //                 dimo[i]['dr_name'] = value[i];
  //               });
  //             }
  //           });
  //         });
  //       } else {
  //         // print(value.body);
  //         // setState(() => show = !show);
  //       }
  //     });
  //   } catch (e) {
  //     // setState(() => show = !show);
  //   }
  // }
