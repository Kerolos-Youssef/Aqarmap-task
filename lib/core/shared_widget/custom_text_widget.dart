import 'package:flutter/material.dart';

class MText extends StatelessWidget {
  final String text;
  final TextAlign? align;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextDirection? textDirection;
  final double? height;
  final double? size;
  final double? letterSpacing;
  final double? wordSpacing;
  final FontWeight? weight;
  final Color? color;
  final Color? backgroundColor;
  final String? fontFamily;
  final FontStyle? style;
  final TextDecoration? decoration;
  final TextBaseline? textBaseline;

  const MText({
    Key? key,
    required this.text,
    this.align,
    this.overflow,
    this.maxLines,
    this.textDirection,
    this.height,
    this.size,
    this.weight,
    this.color,
    this.letterSpacing,
    this.fontFamily,
    this.style,
    this.decoration,
    this.textBaseline,
    this.wordSpacing,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      overflow: overflow,
      maxLines: maxLines,
      textDirection: textDirection,
      style: TextStyle(
        height: height,
        fontSize: size,
        fontWeight: weight,
        color: color,
        letterSpacing: letterSpacing,
        fontFamily: fontFamily,
        fontStyle: style,
        decoration: decoration,
        textBaseline: textBaseline,
        wordSpacing: wordSpacing,
        overflow: overflow,
        backgroundColor: backgroundColor,
      ),
    );
  }
}
