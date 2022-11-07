


import 'package:flutter/material.dart';

import '../constant.dart';

Widget labRequstDialog(contexte,size){
  var why = [
    'A - ve',
    'A + ve',
    'B - ve',
    'B + ve',
    'AB - ve',
    'AB +ve',
    'O - ve',
    'O + ve'
  ];
var whyIsItRejected='';
return MaterialButton(
                    color: Colors.amber,
                    child: Text('check'),
                    onPressed: (() async{
                      await showDialog<void>(
  context: contexte,
  builder: (BuildContext context) {
    int selectedRadio = 0;
    return AlertDialog(
      content: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return SizedBox(
            child: SizedBox(
              child: Container(
                height: size.height,
                width: size.width,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                           PopupMenuButton<int>(
                            itemBuilder: (context) => [
                                            for (int i = 0; i < why.length; i++)
                                              PopupMenuItem(
                                                value: i,
                                                // row with 2 children
                                                child: Row(
                                                  children: [
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(why[i])
                                                  ],
                                                ),
                                              ),
                                          ],
                                      offset: const Offset(0, 100),
                                      elevation: 2,
                                      // on selected we show the dialog box
                                      onSelected: (value) {
                                        // if value 1 show dialog
                                        setState(() {
                                          whyIsItRejected = why[value];
                                        });
                                      },
                            child:  Card(
                                        color: Colors.red,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            whyIsItRejected == ''
                                                ? 'Reject'
                                                : whyIsItRejected,
                                            style:TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    
                                      ),


                                     


                                      MaterialButton(
                                        onPressed: (){},
                              color: Colors.green,
                                        child: Text(
                                          whyIsItRejected == ''
                                              ? 'Accept'
                                              : whyIsItRejected,
                                          style:TextStyle(color: Colors.white),
                                        ),
                                      )
                                 
                      ]
                      // List<Widget>.generate(2, (int index) {
                      //   return Radio<int>(
                      //     value: index,
                      //     groupValue: selectedRadio,
                      //     onChanged: (int? value) async {
                      //       setState(() => selectedRadio = value!);
                      //     },
                      //   );
                      // }
                      // ),
                      
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  },
);


                    }));

}