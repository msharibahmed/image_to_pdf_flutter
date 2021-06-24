import 'dart:io';
import 'package:flutter/material.dart';

class EditPhotos extends StatelessWidget {
  final File image;
  EditPhotos({required this.image});
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    return Scaffold(
      // appBar: AppBar(title: Text('Edit Photo'),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Image.file(
                  image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(
                color: Colors.grey[200],
                height: mq.size.height * 0.08,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.clear)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.crop)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.rotate_left)),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.rotate_right)),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.arrow_forward)),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
