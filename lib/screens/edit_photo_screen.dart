import 'dart:io';
import 'package:flutter/material.dart';

class EditPhotos extends StatelessWidget {
  final File image;
  EditPhotos({required this.image});
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(title: Text('Edit Photo'),),
      body: Column(
        
        children: [
          Expanded(
            child: Container(
              child: Image.file(image,fit: BoxFit.contain,),
            ),
          ),
          Container(
            color: Colors.grey[200],
            height: mq.size.height*0.08,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) =>
                    IconButton(onPressed: () {}, icon: Icon(Icons.ac_unit))),
          )
        ],
      ),
    );
  }
}
