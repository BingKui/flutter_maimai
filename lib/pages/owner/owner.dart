import 'package:flutter/material.dart';
import 'package:flutter_maimai/components/app_bar_action.dart';
import 'package:flutter_maimai/components/card_container.dart';
import 'package:flutter_maimai/components/column_menu_item.dart';
import 'package:flutter_maimai/components/safe_area.dart';
import 'package:flutter_maimai/components/self_icon.dart';
import 'package:flutter_maimai/constants.dart';
import 'package:flutter_maimai/pages/owner/components/owner_info.dart';
import 'package:flutter_maimai/pages/owner/components/owner_menu.dart';

class Owner extends StatelessWidget {
  const Owner({Key? key}) : super(key: key);

  AppBar _buildAppBar() {
    return AppBar(
      actions: [
        AppBarAction(
          icon: SelfIcon.Scanning,
          press: () {},
          right: iDefaultPadding * 0.8,
        ),
      ],
      shadowColor: Colors.transparent,
      backgroundColor: iAppBarBackgroundColor,
    );
  }

  Widget _buildMenuList() {
    TextStyle _style = TextStyle(fontSize: 14, color: Colors.black38);
    TextStyle _styleYellow = TextStyle(fontSize: 14, color: Colors.yellow[700]);
    return CardContainer(
      padding: EdgeInsets.symmetric(horizontal: iDefaultPadding),
      child: Column(
        children: [
          ColumnMenuItem(
            value: '我的社区身份',
            press: () {},
          ),
          ColumnMenuItem(
            value: '我的收藏',
            press: () {},
          ),
          ColumnMenuItem(
            value: '关注内容',
            press: () {},
          ),
          ColumnMenuItem(
            value: '历史通知',
            press: () {},
          ),
          ColumnMenuItem(
            value: '成为认证用户',
            press: () {},
            ext: Text('完善资料', style: _style),
          ),
          ColumnMenuItem(
            value: '成为会员',
            press: () {},
            ext: Text('限时免费使用', style: _styleYellow),
          ),
          ColumnMenuItem(
            value: '附件简历',
            press: () {},
            ext: Text('去上传', style: _style),
          ),
          ColumnMenuItem(
            value: '加好友额度中心',
            press: () {},
            ext: Text('本月待领取0', style: _style),
          ),
          ColumnMenuItem(
            value: '钱包',
            press: () {},
            ext: Text('查看额度', style: _style),
          ),
          ColumnMenuItem(
            value: '人气周报',
            press: () {},
            ext: Text('相比上周下降了27%', style: _style),
          ),
          ColumnMenuItem(
            value: '职趣实验室',
            press: () {},
          ),
          ColumnMenuItem(
            value: '职场福利',
            press: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildSettingMenuList() {
    return CardContainer(
      padding: EdgeInsets.symmetric(horizontal: iDefaultPadding),
      child: Column(
        children: [
          ColumnMenuItem(
            value: '意见反馈',
            press: () {},
          ),
          ColumnMenuItem(
            value: '在线客服',
            press: () {},
          ),
          ColumnMenuItem(
            value: '隐私',
            press: () {},
          ),
          ColumnMenuItem(
            value: '第三方SDK列表',
            press: () {},
          ),
          ColumnMenuItem(
            value: '设置',
            press: () {},
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: iAppBackgroundColor,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            OwnerInfo(),
            OwnerMenu(),
            _buildMenuList(),
            _buildSettingMenuList(),
            SafeAreaBottom(),
          ],
        ),
      ),
    );
  }
}
