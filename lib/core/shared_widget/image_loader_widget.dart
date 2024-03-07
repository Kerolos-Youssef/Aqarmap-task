import 'package:aqarmap_task/core/extensions/radius.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImageLoaderWidget extends StatelessWidget {
  final double height;
  final double width;
  final double radius;
  const ImageLoaderWidget(
      {Key? key, this.height = 50.0, this.width = 50.0, this.radius = 0.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black12,
      highlightColor: Colors.black45,
      direction: ShimmerDirection.ltr,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: MBorderRadius.set(all: radius),
          color: Colors.grey.shade400.withOpacity(0.55),
        ),
      ),
    );
  }
}
