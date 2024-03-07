import 'package:aqarmap_task/core/extensions/padding.dart';
import 'package:aqarmap_task/core/shared_widget/custom_button_widget.dart';
import 'package:aqarmap_task/core/shared_widget/custom_text_widget.dart';
import 'package:flutter/material.dart';

class MErrorWidget extends StatelessWidget {
  final String errorMessage;
  final void Function()? onPressed;
  const MErrorWidget({
    Key? key,
    required this.errorMessage,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.warning_amber,
            color: Colors.red,
            size: 200.0,
          ).addPadding(bottom: 14.0),
          MText(
            text: errorMessage,
            color: Colors.red,
            size: 24.0,
          ).addPadding(bottom: 14.0),
          if (onPressed != null)
            MButton(
              horizontalPadding: 40.0,
              verticalPadding: 22.0,
              onPressed: onPressed,
              child: const MText(
                text: 'try again',
                size: 24.0,
                color: Colors.white,
              ),
            ),
        ],
      ),
    );
  }
}
