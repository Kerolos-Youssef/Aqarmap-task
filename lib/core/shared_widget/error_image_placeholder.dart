import 'package:aqarmap_task/core/extensions/radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ErrorImagePlaceholder extends StatelessWidget {
  final double height;
  final double width;
  final double radius;

  const ErrorImagePlaceholder({
    Key? key,
    this.height = 50.0,
    this.width = 50.0,
    this.radius = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: MBorderRadius.set(all: radius),
      child: SvgPicture.asset(
        'assets/images/svgs/img-fail-icon.svg',
        height: height,
        width: width,
      ),
    );
  }
}
