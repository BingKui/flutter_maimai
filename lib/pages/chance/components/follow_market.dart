import 'package:flutter/material.dart';
import 'package:flutter_maimai/components/card_container.dart';
import 'package:flutter_maimai/components/menu_item.dart';
import 'package:flutter_maimai/components/self_icon.dart';
import 'package:flutter_maimai/constants.dart';

class FollowMarket extends StatelessWidget {
  const FollowMarket({Key? key}) : super(key: key);

  Widget _buildTitle() {
    return Padding(
      padding: EdgeInsets.all(iDefaultPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage('assets/images/avatar.png'),
          ),
          Container(
            margin: EdgeInsets.only(left: iDefaultPadding / 2),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '关注行情',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Icon(
                  SelfIcon.ArrowRightFilling,
                  size: 12,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuList() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        MenuItem(
          name: '我的简历',
          press: () {},
          icon: SelfIcon.FolderFilling,
        ),
        MenuItem(
          name: '我的申请',
          press: () {},
          icon: SelfIcon.HistoryFilling,
        ),
        MenuItem(
          name: '职位收藏',
          press: () {},
          icon: SelfIcon.FavoriteFilling,
        ),
        MenuItem(
          name: '更多',
          press: () {},
          icon: SelfIcon.DynamicFilling,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      padding: EdgeInsets.only(bottom: iDefaultPadding),
      child: Column(
        children: <Widget>[
          _buildTitle(),
          // Spacer(),
          _buildMenuList(),
        ],
      ),
    );
  }
}
