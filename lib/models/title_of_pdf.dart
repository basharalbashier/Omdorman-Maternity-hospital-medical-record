// import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

titleOfPdf(PdfPageFormat pageFormat, Size size, String depart) async {
  const baseColor = PdfColors.cyan;
  final profileImage = pw.MemoryImage(
    (await rootBundle.load('lib/assets/download.png')).buffer.asUint8List(),
  );

  return pw.Column(
    children: [
      pw.SizedBox(
        width: double.infinity,
        child: pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    'Republic of Sudan',
                  ),
                  pw.Text(
                    'Ministry of health - Khartoum State',
                  ),
                  pw.Text(
                    'Omdurman Maternity Hospital',
                  ),
                  pw.Text(
                    'Health Information & Research',
                  ),
                  pw.Text(
                    depart,
                  ),
                ],
              ),
              pw.ClipOval(
                child: pw.Container(
                  width: 100,
                  height: 100,
                  color: baseColor,
                  child: pw.Image(profileImage),
                ),
              ),
            ]),
      ),
      pw.Divider()
    ],
  );
}
