import 'dart:typed_data';

import 'package:aldayat_screens/models/get_request.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../models/am_or_pm_time.dart';
import '../models/footer_of_pdf.dart';
import '../models/replace_key.dart';
import '../models/title_of_pdf.dart';
import '../models/user_hive.dart';

class PrintLabResult extends StatelessWidget {
  final User user;
  final Map request;
  const PrintLabResult(this.user, this.request, {Key? key}) : super(key: key);

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
          build: (format) => _generatePdf(format, size, context),
        ),
      ),
    );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format, size, context) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    // final font = await PdfGoogleFonts.nunitoExtraLight();
    var title = await titleOfPdf(format, size, user.user['dep']);
    // const baseColor = PdfColors.pink;
    var patientInfo;
    await getIt("patient", user, context, request['patient_id'])
        .then((value) => patientInfo = value[0]);
    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) {
          return pw.Column(
            children: [
              title,
              pw.Expanded(
                  child: pw.Container(
                child: pw.Column(children: [
                  pw.Padding(
                    padding: pw.EdgeInsets.all(8.0),
                    child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text(
                            "Lab Investigation for  :  ".toUpperCase(),
                          ),
                          pw.Text(patientInfo != null
                              ? patientInfo['name']
                              : '..............................................'),
                        ]),
                  ),
                  pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text(
                          "Requested At  :  ".toUpperCase(),
                        ),
                        pw.Text(amOrPm(request["created_at"], true)
                            .replaceAll("\n", " ")),
                      ]),
                  pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text(
                          "Responded At  :   ".toUpperCase(),
                        ),
                        pw.Text(amOrPm(request["updated_at"], true)
                            .replaceAll("\n", " ")),
                      ]),
                  pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text(
                          "Responded by  :  ".toUpperCase(),
                        ),
                        pw.Text(drName(
                          request["got_by_id"],
                        )),
                      ]),
                  pw.Padding(
                      padding: pw.EdgeInsets.all(8.0),
                      child:
                          pw.Table(border: pw.TableBorder.all(), columnWidths: {
                        0: pw.IntrinsicColumnWidth(),
                      }, children: [
                        pw.TableRow(children: [
                          pw.Padding(
                            padding: pw.EdgeInsets.all(8.0),
                            child: pw.Text(
                              "Investigation".toUpperCase(),
                            ),
                          ),
                          pw.Padding(
                            padding: pw.EdgeInsets.all(8.0),
                            child: pw.Text("Result".toUpperCase()),
                          )
                        ]),
                        for (int i = 1;
                            i <
                                request.entries.map((e) => e).toList().length -
                                    13;
                            i++)
                          request.entries.map((e) => e).toList()[i].value !=
                                  'false'
                              ? pw.TableRow(children: [
                                  pw.Padding(
                                    padding: pw.EdgeInsets.all(8.0),
                                    child: pw.Text(
                                      "${replacLabKey(request.entries.map((e) => e).toList()[i].key)}"
                                          .toUpperCase(),
                                    ),
                                  ),
                                  pw.Padding(
                                      padding: pw.EdgeInsets.all(8.0),
                                      child: pw.Text(
                                        "${request["result"]}",
                                      ))
                                ])
                              : pw.TableRow(children: [])
                      ])),
                  pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text(
                          "More  :  ".toUpperCase(),
                        ),
                        pw.Text(
                          request["comm"] ?? '',
                        ),
                      ]),
                ]),

                // color: baseColor
              )),
              footerOfPdf(format, size)
            ],
          );
        },
      ),
    );

    return pdf.save();
  }
}
