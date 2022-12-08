




 import 'package:flutter/material.dart';

Color  setUniColor(unit){
  Color color=unit == '1'
              ? Colors.teal
              : unit == '2'
                  ? Colors.pink
                  : unit == '3'
                      ? Colors.amber
                      : unit == '4'
                          ? Colors.purple
                          : unit == '5'
                              ? Colors.blue
                              : Colors.blueGrey;

                              return color;
}