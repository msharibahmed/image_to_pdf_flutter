import 'dart:io';
import 'package:flutter/material.dart';
//
import 'package:file_picker/file_picker.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
//
import 'package:image_to_pdf/provider/create_pdf.dart';
import 'package:image_to_pdf/screens/edit_photo_screen.dart';

class GridViewImageBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pickedFiles = Provider.of<CreatePdfProvider>(context).pickedFiles;
    var pickedFilesName =
        Provider.of<CreatePdfProvider>(context).pickedFilesName;

    return StaggeredGridView.countBuilder(
      padding: const EdgeInsets.all(0),
      mainAxisSpacing: 1,
      crossAxisSpacing: 1,
      crossAxisCount: 2,
      itemCount: pickedFiles.length,
      itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        EditPhotos(image: pickedFiles[index])));
          },
          child: GridViewImageChild(
            image: pickedFiles[index],
            imageName: pickedFilesName[index],
          )),
      staggeredTileBuilder: (int index) => new StaggeredTile.fit(1),
    );
  }
}

class GridViewImageChild extends StatelessWidget {
  final File image;
  final String imageName;
  GridViewImageChild({required this.image, required this.imageName});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.file(
          image,
          key: Key(image.path),
          // fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 0,

            child: Container(
          decoration: BoxDecoration(color: Colors.black45),
          child: Text(imageName.toString(),style: TextStyle(color: Colors.white),),
        ))
      ],
    );
  }
}
