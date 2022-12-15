import 'package:aldayat_screens/models/user_hive.dart';
import 'package:aldayat_screens/pages/delivery_note.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

Widget deliveryNoteButton(context, patient, file, User user) {
  return MaterialButton(
    color: Colors.orangeAccent,
    onPressed: () => Get.to(() => DeliveryPostnatal(
          patient: patient,
          file: file,
          user: user,
        ),),
    child: Center(
      child: SizedBox(
          height: 30,
          child: Center(
            child: Text(
              "Delivery Note",
              style: TextStyle(color: Colors.white),
            ),
          )),
    ),
  );
}
