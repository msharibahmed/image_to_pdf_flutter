import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_to_pdf/screens/view_pdf_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class CreatePdfProvider with ChangeNotifier {
  List<File> _pickedFiles = [];
  List<File> get pickedFiles {
    return [..._pickedFiles];
  }

  List<String> _pickedFilesName = [];
  List<String> get pickedFilesName {
    return [..._pickedFilesName];
  }

  void createPdf({required BuildContext context}) async {
    print('executing _createPdf func');
    final pdf = pw.Document();
    List.generate(
        _pickedFiles.length,
        (index) => pdf.addPage(
            pw.Page(
                pageFormat: PdfPageFormat.a4,
                build: (pw.Context context) => pw.Center(
                    child: pw.Image(pw.MemoryImage(
                        _pickedFiles[index].readAsBytesSync())))),
            index: index));
    final bytes = await pdf.save();
    final dir = await getExternalStorageDirectory();
    final file = File('${dir.path}/images.pdf');
    print(file);
    await file.writeAsBytes(bytes);

    print('completed');
    clearedPickedFiles();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ViewPdf(file.path)));
    notifyListeners();
  }

  Future<void> loadAssets(BuildContext context) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['jpg', 'jpeg', 'png'],
          onFileLoading: (status) {
            // if (status == FilePickerStatus.done) {
            //   setState(() {
            //     loading = false;
            //   });
            // } else if (status == FilePickerStatus.picking) {
            //   setState(() {
            //     loading = true;
            //   });
            // } else {
            //   setState(() {
            //     loading = false;
            //   });
            // }
          },
          allowMultiple: true);

      if (result != null) {
        _pickedFiles = result.paths.map((path) => File(path)).toList();
        _pickedFilesName = result.names;
      } else {
        clearedPickedFiles();
        // User canceled the picker
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('User canceled the picker'),
          backgroundColor: Colors.red[200],
        ));
        print('picking files cancelled');
      }
    } catch (error) {
      print(error);
    }
    notifyListeners();
  }

  void clearedPickedFiles() {
    _pickedFiles = [];
    _pickedFilesName = [];
    notifyListeners();
  }
}
