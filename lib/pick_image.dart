import 'package:flutter/material.dart';
//
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:image_to_pdf/widgets/gridView_image_child.dart';
import 'package:provider/provider.dart';
//
import 'package:image_to_pdf/provider/create_pdf.dart';
import 'package:image_to_pdf/screens/edit_photo_screen.dart';

import 'widgets/my_drawer.dart';

class PickImage extends StatelessWidget {
  Widget buildGridView(BuildContext context) {
    return GridViewImageBuilder();
  }

  @override
  Widget build(BuildContext context) {
    var createPdfProv = Provider.of<CreatePdfProvider>(context);
    var pickedFiles = createPdfProv.pickedFiles;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.image,
          color: Colors.black,
        ),
        onPressed: () async => createPdfProv.loadAssets(context),
      ),
      drawer: MyDrawer(),
      appBar: AppBar(
        actions: [
          if (pickedFiles.isNotEmpty)
            TextButton(
              onPressed: () {
                print('create pdf tap');
                createPdfProv.createPdf(context: context);
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text('Total Picked Files: ${pickedFiles.length}'),
          ),
          SizedBox(
            height: 4,
          ),
          // loading
          //     ? Center(
          //         child: LinearProgressIndicator(),
          //       )
          //     :
          Expanded(child: buildGridView(context))
        ],
      ),
    );
  }
}
