import 'package:flutter/material.dart';
import '../../../Yutils/ydimension.dart';


class SmallText extends StatelessWidget {
  const SmallText({
    Key? key,
    required this.text,
    this.size,
    this.height,
    this.colour,
  }) : super(key: key);

  final String text;
  final double? height;
  final double? size;
  final Color? colour;


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        height: height == null ? Dimensions.customTextHeight(1.2) : Dimensions.customTextHeight(height!),
        fontSize: size != null ? Dimensions.customSize(size!) : Dimensions.customSize(12),
      ),
    );
  }
}