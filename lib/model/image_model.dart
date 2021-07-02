// import 'package:flutter/material.dart';

import 'dart:io';

import 'package:flutter/cupertino.dart';

class ImageModel {
  String id;
  String name;
  String path;
  double size;
  DateTime createdAt;
  File imageFile;
  int rotationTurns;
  FilterQuality imageQuality;
  Color blendColor;
  bool isAntiAlias;
  BlendMode colorBlendMode;

  ImageModel(
      {required this.id,
      required this.createdAt,
      required this.name,
      required this.path,
      required this.size,
      required this.imageFile,
      this.rotationTurns = 4,
      this.imageQuality = FilterQuality.low,
      this.isAntiAlias = false,
      this.blendColor = const Color(2),
      this.colorBlendMode = BlendMode.color});
  // Widget imageModelWidget(
  //   // String id,
  //   //   {int rotationTurns = 1,
  //   //   FilterQuality imageQuality = FilterQuality.low,
  //   //   Color? blendColor,
  //   //   bool isAntiAlias = false,
  //   //   BlendMode? colorBlendMode,
  //   //   required File imageFile}
  //     ) {
  //   return RotatedBox(
  //     quarterTurns: rotationTurns,
  //     child: Image.file(
  //       imageFile,
  //       key: Key(id),
  //       cacheHeight: 150,
  //       cacheWidth: 150,
  //       isAntiAlias: isAntiAlias,
  //       filterQuality: imageQuality,
  //       color: blendColor,
  //       colorBlendMode: colorBlendMode,
  //     ),
  //   );
  // }
}
