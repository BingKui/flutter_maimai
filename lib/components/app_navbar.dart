import 'package:flutter/material.dart';
import 'package:flutter_maimai/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppNavBar extends StatelessWidget {
  const AppNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: iDefaultPadding,
        // bottom: iDefaultPadding,
        right: iDefaultPadding,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: iAppBottomBarColor,
          borderRadius: BorderRadius.circular(15),
          // boxShadow: [
          //   BoxShadow(
          //     offset: Offset(0, -10),
          //     blurRadius: 35,
          //     color: iPrimaryColor.withOpacity(0.38),
          //   ),
          // ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <IconButton>[
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/flower.svg'),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/heart-icon.svg'),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/heart-icon.svg'),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/heart-icon.svg'),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/user-icon.svg'),
            ),
          ],
        ),
      ),
    );
  }
}
