import 'package:flutter/material.dart';
import 'package:flutter_maimai/constants.dart';

class OwnerMenuItem extends StatelessWidget {
  const OwnerMenuItem({
    Key? key,
    required this.icon,
    required this.name,
    required this.press,
  }) : super(key: key);

  final IconData icon;
  final String name;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double _width = (size.width - iDefaultPadding * 2 - 30) / 4;
    return Container(
      width: _width,
      height: _width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: iBorderRadius,
      ),
      child: Stack(
        children: [
          Positioned(
            left: iDefaultPadding / 2,
            top: iDefaultPadding / 2,
            child: Icon(
              icon,
              size: 26,
            ),
          ),
          Positioned(
            bottom: iDefaultPadding / 2,
            left: 0,
            right: 0,
            child: Center(
              child: Text(name, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            ),
          )
        ],
      ),
    );
  }
}
