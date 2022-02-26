import 'package:flutter/material.dart';
import 'package:flutter_maimai/constants.dart';

const EdgeInsets _margin = EdgeInsets.only(
  left: iDefaultPadding,
  right: iDefaultPadding,
  bottom: iDefaultPadding,
);

const EdgeInsets _padding = EdgeInsets.symmetric(
  vertical: iDefaultPadding,
);

class CardContainer extends StatelessWidget {
  const CardContainer({
    Key? key,
    this.child,
    this.margin = _margin,
    this.padding = _padding,
    this.height,
  }) : super(key: key);

  final Widget? child;
  final double? height;
  final EdgeInsets margin, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: iBorderRadius,
      ),
      child: child,
    );
  }
}
