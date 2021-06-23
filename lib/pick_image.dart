import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
//
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Asset> images = <Asset>[];

  @override
  void initState() {
    super.initState();
  }

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Detected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(
          takePhotoIcon: "chat",
          doneButtonTitle: "Fatto",
        ),
        materialOptions: MaterialOptions(
          actionBarColor: "#1e0f55",
          actionBarTitle: "Pick images",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.image,
          color: Colors.black,
        ),
        onPressed: loadAssets,
      ),
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              print('create pdf tap');
              _createPdf(images: images);
            },
            child: Text(
              'create pdf',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
        title: const Text('Image to pdf'),
      ),
      body: Column(
        children: [
          Expanded(
            child: buildGridView(),
          )
        ],
      ),
    );
  }

  void _createPdf({required List<Asset> images}) async {
    print('executing _createPdf func');
    final pdf = pw.Document();
    pdf.addPage(pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) => [
              pw.Center(
                child: pw.Text("Hello World"),
              ),
              pw.Center(
                child: pw.Text("Hello World"),
              ),
              pw.Center(
                child: pw.Text("Hello World"),
              )
            ]));

    // pdf.addPage(pw.Page(
    //     pageFormat: PdfPageFormat.a4,
    //     build: (pw.Context context) {
    //       return pw.Center(
    //         child: pw.Text("Hello World"),
    //       ); // Center
    //     }));
    // Page
    final bytes = await pdf.save();
    final dir = await getA();
    final file = File('${dir.path}/myPdf.pdf');
    print(file);
    await file.writeAsBytes(bytes);
    print('completed');
  }
}
