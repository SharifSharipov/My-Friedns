import 'package:flutter/material.dart';

class BaseContainer extends StatelessWidget {
  final Alignment? alignment;
  final Widget child;
  final double width;
  final double? height;
  final EdgeInsets? margin;
  final EdgeInsets padding;
  final double radius;
  final Color? color;
  final Border? border;
  const BaseContainer(
      {super.key,
      required this.child,
      required this.width,
      this.height,
      this.margin,
      this.color,
      this.alignment,
      this.border,
      this.padding = const EdgeInsets.only(left: 12),
      required this.radius});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // TODO: implement build
    return Container(
      alignment: alignment,
      height: height,
      color: color,
      width: width,
      padding: padding,
      margin: margin, //
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(radius),
        border: border,
      ),
      child: child,
    );
  }
}
