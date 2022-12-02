import 'package:flutter/material.dart';
import '../models/user_hive.dart';
import '../widgets/gyn_inve_table.dart';


class Testo extends StatefulWidget {
  const Testo({Key? key}) : super(key: key);

  @override
  _SearchNameState createState() => _SearchNameState();
}

class _SearchNameState extends State<Testo> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> dimo = [];
    for (int i = 0; i < 10; i++) {
      dimo.add({
        "id": i,
        "result":
            "Plain text ($i. txt) is a type of digital file that is free of computer tags, special formatting, and code. This is the only file type recognized by the Lexile Analyzer. Note: Copying and pasting or uploading text and text files other than plain text may include computer tags, special formatting, and code.Plain text (. txt) is a type of digital file that is free of computer tags, special formatting, and code. This is the only file type recognized by the Lexile Analyzer. Note: Copying and pasting or uploading text and text files other than plain text may include computer tags, special formatting, and code.Plain text (. txt) is a type of digital file that is free of computer tags, special formatting, and code. This is the only file type recognized by the Lexile Analyzer. Note: Copying and pasting or uploading text and text files other than plain text may include computer tags, special formatting, and code.Plain text (. txt) is a type of digital file that is free of computer tags, special formatting, and code. This is the only file type recognized by the Lexile Analyzer. Note: Copying and pasting or uploading text and text files other than plain text may include computer tags, special formatting, and code.Plain text (. txt) is a type of digital file that is free of computer tags, special formatting, and code. This is the only file type recognized by the Lexile Analyzer. Note: Copying and pasting or uploading text and text files other than plain text may include computer tags, special formatting, and code.Plain text (. txt) is a type of digital file that is free of computer tags, special formatting, and code. This is the only file type recognized by the Lexile Analyzer. Note: Copying and pasting or uploading text and text files other than plain text may include computer tags, special formatting, and code.Plain text (. txt) is a type of digital file that is free of computer tags, special formatting, and code. This is the only file type recognized by the Lexile Analyzer. Note: Copying and pasting or uploading text and text files other than plain text may include computer tags, special formatting, and code.",
        "dr_id": "Valverde $i",
        "created_at": "2022-11-12T17:34:29.$i",
            "Feeding":"file",
    "Residual":"digital",
    "gestation":"Plain text",
    "inv":"free",
      });
    }
    final User user=User({}, "token");
    return Scaffold(
        appBar: AppBar(
          title: Text('Demos'),
        ),
        body: SingleChildScrollView(
            child: gyneInvTable(dimo.reversed.toList(),context,{},user)));
  }
}
