import 'package:flutter/material.dart';
import 'package:flutter_maimai/constants.dart';

class MessageType extends StatelessWidget {
  const MessageType({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        height: 35,
        margin: EdgeInsets.only(right: iDefaultPadding / 2),
        padding: EdgeInsets.symmetric(horizontal: iDefaultPadding / 2),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(35)),
        ),
        child: Center(
            child: Text(
          text,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: iTipColor),
        )),
      ),
    );
  }
}
