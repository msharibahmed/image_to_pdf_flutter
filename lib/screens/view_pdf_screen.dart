import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class ViewPdf extends StatelessWidget {
  final String path;
  ViewPdf(this.path);
  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(path: path,appBar: AppBar(),);
  }
}
