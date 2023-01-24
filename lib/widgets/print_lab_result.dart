// ignore_for_file: public_member_api_docs

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../models/footer_of_pdf.dart';
import '../models/title_of_pdf.dart';

class PrintLabResult extends StatelessWidget {
    final Map request;
  const PrintLabResult( this.request, {Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              BackButton(
                onPressed: () => Navigator.of(context).pop(),
              ),
              Text(request['id'].toString()),
            ],
          ),
        ),
        body: PdfPreview(
          build: (format) => _generatePdf(format,size),
        ),
      ),
    );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format,size) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    final font = await PdfGoogleFonts.nunitoExtraLight();
    var title=   await titleOfPdf(format,size,"Department");
  const baseColor = PdfColors.pink;
    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) {
          return pw.Column(
            children: [
          title,
          pw.Expanded(child:pw.Container(color: baseColor) ),
              // pw.SizedBox(
              //   width: double.infinity,
              //   child: pw.FittedBox(
              //     child: 

              footerOfPdf(format,size)
              //   ),
              // ),
              // pw.SizedBox(height: 20),
            ],
          );
        },
      ),
    );

    return pdf.save();
  }
}
