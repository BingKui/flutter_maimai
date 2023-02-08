import 'package:flutter/material.dart';
import 'package:flutter_maimai/components/badge.dart';
import 'package:flutter_maimai/components/self_icon.dart';
import 'package:flutter_maimai/constants.dart';

class AskMenuItem extends StatelessWidget {
  const AskMenuItem({
    Key? key,
    required this.title,
    required this.desc,
    required this.icon,
    required this.press,
    this.isLink = false,
  }) : super(key: key);

  final String title, desc;
  final IconData icon;
  final VoidCallback press;
  final bool isLink;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: iDefaultPadding / 2, vertical: iDefaultPadding / 2),
      decoration: BoxDecoration(
        borderRadius: iBorderRadius,
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            margin: EdgeInsets.only(right: iDefaultPadding / 2),
            child: Icon(
              icon,
              size: 40,
            ),
          ),
          Expanded(
            child: Container(
              height: 45,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    desc,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black38,
                    ),
                  ),
                ],
              ),
            ),
          ),
          isLink
              ? Row(
                  children: [
                    SelfBadge('', dot: true, fixed: false),
                    SizedBox(width: iDefaultPadding / 4),
                    Icon(SelfIcon.ArrowRight, size: 16, color: Colors.black38),
                  ],
                )
              : Text(''),
        ],
      ),
    );
  }
}
