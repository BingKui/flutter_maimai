import 'package:flutter/material.dart';
import 'package:flutter_maimai/constants.dart';

const double badgeSize = 20.0;
const double badgeDotSize = 10.0;

class SelfBadge extends StatelessWidget {
  const SelfBadge(
    this.value, {
    Key? key,
    this.right,
    this.top,
    this.left,
    this.bottom,
    this.color = Colors.red,
    this.dot = false,
    this.fixed = true,
  }) : super(key: key);

  final double? right, top, left, bottom;
  final bool dot, fixed;
  final Color? color;
  final String value;

  Widget _buildContent() {
    TextStyle _style = TextStyle(fontSize: 12, color: Colors.white);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      height: dot ? badgeDotSize : badgeSize,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(dot ? badgeDotSize : badgeSize)),
      ),
      child: dot
          ? Text('')
          : Align(
              child: Text(value, style: _style),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return fixed
        ? Positioned(
            left: left,
            right: right,
            top: top,
            bottom: bottom,
            child: _buildContent(),
          )
        : _buildContent();
  }
}
