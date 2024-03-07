import 'package:flutter/material.dart';

class MButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget child;
  final double horizontalPadding;
  final double verticalPadding;
  final double borderRadius;
  final Color backgroundColor;

  const MButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.horizontalPadding = 22,
    this.verticalPadding = 10,
    this.backgroundColor = Colors.blue,
    this.borderRadius = 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(
                horizontal: horizontalPadding, vertical: verticalPadding)),
        backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius),
            ),
          ),
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
