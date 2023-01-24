import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

footerOfPdf(PdfPageFormat pageFormat, Size size)  {
  const baseColor = PdfColors.cyan;

  return pw.Column(
    children: [
            pw.Divider(),
      pw.SizedBox(
        width: double.infinity,
        child: pw.Column(
            // mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
               pw.SizedBox(
        width: double.infinity,child:
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                children: [
                  pw.Text(
                    'Bashar Albashier 2022',
                  ),
                  pw.Text(
                    ' - V: 0.0.0+1',
                  ),
               
                ],
              ),)
           
            ]),
      ),
    ],
  );
}
