import 'package:flutter/material.dart';
import 'package:flutter_maimai/components/self_icon.dart';
import 'package:flutter_maimai/constants.dart';
import 'package:flutter_maimai/pages/owner/components/owner_menu_item.dart';

class OwnerMenu extends StatelessWidget {
  const OwnerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: iDefaultPadding, left: iDefaultPadding, right: iDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OwnerMenuItem(
            icon: SelfIcon.FavoriteFilling,
            name: '我的圈子',
            press: () {},
          ),
          OwnerMenuItem(
            icon: SelfIcon.FileCommonFilling,
            name: '我的关注',
            press: () {},
          ),
          OwnerMenuItem(
            icon: SelfIcon.ClockFilling,
            name: '最近浏览',
            press: () {},
          ),
          OwnerMenuItem(
            icon: SelfIcon.CommentFilling,
            name: '我的互动',
            press: () {},
          ),
        ],
      ),
    );
  }
}
