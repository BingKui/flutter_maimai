import 'package:flutter/material.dart';
import 'package:flutter_maimai/constants.dart';

class VipBadge extends StatelessWidget {
  const VipBadge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 14,
      height: 14,
      // padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      decoration: BoxDecoration(
        color: iPrimaryColor.withOpacity(0.4),
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Center(
        child: Image.asset(
          'assets/icons/vip.png',
          width: 10,
          height: 10,
        ),
      ),
    );
  }
}
