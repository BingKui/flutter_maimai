import 'package:flutter/material.dart';
import 'package:flutter_maimai/constants.dart';

class Tag extends StatelessWidget {
  const Tag(this.value, {Key? key, this.plain = false}) : super(key: key);

  final String value;
  final bool plain;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: plain ? Colors.transparent : iTagBackgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(4)),
        border: new Border.all(width: 1, color: iTagBackgroundColor),
      ),
      child: Text(
        value,
        style: TextStyle(
          color: iTagTextColor,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
