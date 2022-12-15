



  
 import 'package:flutter/material.dart';

import '../constant.dart';

Widget privateInfo(file,patient,size,context,user) {


    return       Column(
                                children: [
                                  Row(
                                    children: [
                                      Text("Occupation"),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                    patient['occup'],
                                        style: fileTitle(size),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Phone: "),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                    patient['tel'].toString(),
                                        style: fileTitle(size),
                                      ),
                                    ],
                                  ),
                                      Row(
                                    children: [
                                      Text("Residance: "),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                    file['residance'].toString(),
                                        style: fileTitle(size),
                                      ),
                                    ],
                                  ),
                                       Row(
                                    children: [
                                      Text("Husband Name: "),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                    file['husband'].toString(),
                                        style: fileTitle(size),
                                      ),
                                    ],
                                  ),
                                     Row(
                                    children: [
                                      Text("Husband phone: "),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                    file['husband_tel'].toString(),
                                        style: fileTitle(size),
                                      ),
                                    ],
                                  ),
                                     Row(
                                    children: [
                                      Text("Husband Occupation: "),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                    file['husband_occup'].toString(),
                                        style: fileTitle(size),
                                      ),
                                    ],
                                  ),
                                
                         
                                
                              
                                ],
                              );
                            
  }
