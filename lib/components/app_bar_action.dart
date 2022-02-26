import 'package:flutter/material.dart';
import 'package:flutter_maimai/constants.dart';

const double actionSize = 40.0;

class AppBarAction extends StatelessWidget {
  const AppBarAction({
    Key? key,
    required this.icon,
    required this.press,
    this.left = 0,
    this.right = 0,
  }) : super(key: key);

  final IconData icon;
  final VoidCallback press;
  final double left, right;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          width: actionSize,
          height: actionSize,
          margin: EdgeInsets.only(left: left, right: right),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(actionSize)),
          ),
          child: GestureDetector(
            onTap: press,
            child: Center(
              child: Icon(
                icon,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
