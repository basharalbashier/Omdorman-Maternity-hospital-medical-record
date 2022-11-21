



 import 'package:aldayat_screens/models/user_hive.dart';
import 'package:flutter/material.dart';

Dialog logout (context){


return Dialog(

  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), //this right here
  child: Container(
    height: 300.0,
    width: 300.0,
   
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding:  EdgeInsets.all(15.0),
          child: Text('Sorry!', style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
        ),
        Padding(
          padding: EdgeInsets.all(15.0),
          child: Text('Are you sure?'),
        ),
        
        Padding(padding: EdgeInsets.only(top: 50.0)),
        TextButton(onPressed: () {
          remove(context);
          Navigator.of(context).pop();
        },
            child: Text('Log out!', style: TextStyle(color: Colors.purple, fontSize: 18.0,fontWeight:FontWeight.bold),))
      ],
    ),
  ),
);

} 
