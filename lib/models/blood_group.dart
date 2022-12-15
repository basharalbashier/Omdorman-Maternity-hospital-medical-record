import 'package:flutter/material.dart';

import '../constant.dart';

Widget bloodGroup(context, size,bloody) {
  var blood = [
    'A - ve',
    'A + ve',
    'B - ve',
    'B + ve',
    'AB - ve',
    'AB +ve',
    'O - ve',
    'O + ve'
  ];
  var whatIsBlood='';
  return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
   return PopupMenuButton<int>(
        itemBuilder: (context) => [
              for (int i = 0; i < blood.length; i++)
                PopupMenuItem(
                  value: i,
                  // row with 2 children
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Text(blood[i])
                    ],
                  ),
                ),
            ],
        offset: const Offset(0, 100),
        elevation: 2,
        // on selected we show the dialog box
        onSelected: (value) {
          // if value 1 show dialog
  
      setState((){
           bloody = blood[value];
      });
        },
        child: Text(
          whatIsBlood == '' ? 'Blood group & RH' : whatIsBlood,
          style: bloodStyle(size),
        ));}
  );
}
