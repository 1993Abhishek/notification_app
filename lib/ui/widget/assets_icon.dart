import 'package:flutter/material.dart';

class AssetIcon extends StatelessWidget {
  final double width;
  final double height;
  final String imageAssetPath;
  final BoxFit boxFit;

  AssetIcon(
      {@required this.imageAssetPath,
        @required this.width,
        @required this.height,
        this.boxFit});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        child: Image(
          image: AssetImage(imageAssetPath),
          fit: boxFit != null ? boxFit : BoxFit.scaleDown,
        ));
  }
}
