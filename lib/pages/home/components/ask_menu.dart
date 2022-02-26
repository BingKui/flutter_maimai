import 'package:flutter/material.dart';
import 'package:flutter_maimai/components/self_icon.dart';
import 'package:flutter_maimai/constants.dart';
import 'package:flutter_maimai/pages/home/components/ask_menu_item.dart';

class AskMenu extends StatelessWidget {
  const AskMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(iDefaultPadding / 2),
      child: Column(
        children: [
          AskMenuItem(
            title: '去发现感兴趣的公司',
            desc: '暂无关注的公司',
            icon: SelfIcon.Home,
            isLink: true,
            press: () {},
          ),
          SizedBox(height: iDefaultPadding / 2),
          Row(
            children: [
              Expanded(
                child: AskMenuItem(
                  title: '大厂职级揭秘',
                  desc: '洞察大环境',
                  icon: SelfIcon.Home,
                  press: () {},
                ),
              ),
              SizedBox(width: iDefaultPadding / 2),
              Expanded(
                child: AskMenuItem(
                  title: '员工认可榜单',
                  desc: '甄选好机遇',
                  icon: SelfIcon.Home,
                  press: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
