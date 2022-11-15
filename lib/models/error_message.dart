 import 'package:flutter/material.dart';

errono(a, e,context,la,Widget ourWidget,int duratio) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: duratio),
        backgroundColor: Colors.grey.withOpacity(0.5),
        content: Row(
          children: [
            const Icon(
              Icons.error,
              color: Colors.pink,
            ),
            Container(
              width: 20,
              height: 12,
            ),
            Text(
              !la ? a : e,
              style: TextStyle(fontFamily: 'Cairo'),
            ),
            
          ],
          
        )));
  }
