import 'package:flutter/material.dart';
import 'package:flutter_maimai/components/card_container.dart';
import 'package:flutter_maimai/components/menu_item.dart';
import 'package:flutter_maimai/components/self_icon.dart';

class ContactMenu extends StatelessWidget {
  const ContactMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MenuItem(name: '我的好友', press: () {}, icon: SelfIcon.ContactFilling),
          MenuItem(name: '人脉探索', press: () {}, icon: SelfIcon.Search),
          MenuItem(name: '校友群', press: () {}, icon: SelfIcon.Layers),
          MenuItem(name: '极速找人', press: () {}, icon: SelfIcon.Operation),
        ],
      ),
    );
  }
}
