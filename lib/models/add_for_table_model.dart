


import 'package:flutter/material.dart';


MaterialButton addButtonModel(String title, onTap) {

  return
   MaterialButton(
      onPressed:onTap,
      color: Colors.pink,
      child: SizedBox(
          // height: 30,
          child: Center(
        child: Text(
          "$title",
          style: TextStyle(color: Colors.white),
        ),
      )));
}
