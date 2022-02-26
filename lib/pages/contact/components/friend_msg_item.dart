import 'package:flutter/material.dart';
import 'package:flutter_maimai/constants.dart';

class FriendMsgItem extends StatelessWidget {
  const FriendMsgItem({
    Key? key,
    required this.message,
    required this.press,
  }) : super(key: key);

  final message;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      margin: EdgeInsets.only(bottom: iDefaultPadding / 2),
      child: Row(
        children: [
          // Text('12123'),
          CircleAvatar(
            radius: 15,
            backgroundImage: NetworkImage(message['avatar']),
          ),
          SizedBox(width: iDefaultPadding / 2),
          Text(
            message['nickname'] + '：',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          Expanded(
            child: Text(
              message['tip'],
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
