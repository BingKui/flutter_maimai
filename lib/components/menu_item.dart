import 'package:flutter/material.dart';
import 'package:flutter_maimai/constants.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    Key? key,
    required this.name,
    required this.press,
    required this.icon,
  }) : super(key: key);

  final String name;
  final VoidCallback press;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: iFollowMenuHeight,
            width: iFollowMenuHeight,
            margin: EdgeInsets.only(bottom: iDefaultPadding / 2),
            decoration: BoxDecoration(
              color: Color(0xFFF9FAFC),
              borderRadius: BorderRadius.all(Radius.circular(iFollowMenuHeight)),
            ),
            child: Icon(icon),
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
