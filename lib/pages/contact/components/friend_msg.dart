import 'package:flutter/material.dart';
import 'package:flutter_maimai/components/badge.dart';
import 'package:flutter_maimai/components/card_container.dart';
import 'package:flutter_maimai/constants.dart';
import 'package:flutter_maimai/mock/contact.dart';
import 'package:flutter_maimai/pages/contact/components/friend_msg_item.dart';

class FriendMsg extends StatefulWidget {
  const FriendMsg({Key? key}) : super(key: key);

  @override
  _FriendMsgState createState() => _FriendMsgState();
}

class _FriendMsgState extends State<FriendMsg> {
  List msgList = FriendMsgList;

  Widget _buildTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: iDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('好友动态', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black)),
          Badge('', dot: true, fixed: false),
        ],
      ),
    );
  }

  Widget _buildMsgList() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return FriendMsgItem(
            message: msgList[index],
            press: () {},
          );
        },
        itemCount: msgList.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      padding: EdgeInsets.only(left: iDefaultPadding, right: iDefaultPadding, bottom: iDefaultPadding),
      child: Column(
        children: [
          _buildTitle(),
          _buildMsgList(),
        ],
      ),
    );
  }
}
