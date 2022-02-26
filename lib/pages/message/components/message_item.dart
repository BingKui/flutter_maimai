import 'package:flutter/material.dart';
import 'package:flutter_maimai/constants.dart';
import 'package:flutter_maimai/pages/message/components/account_type_tag.dart';

const double itemHeight = 60.0;

class MessageItem extends StatelessWidget {
  const MessageItem({
    Key? key,
    required this.message,
    required this.press,
  }) : super(key: key);

  final message;
  final VoidCallback press;

  Widget _buildTitle(Size size) {
    TextStyle _titleStyle = TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold);
    TextStyle _dateStyle = TextStyle(color: Colors.black26, fontSize: 14, fontWeight: FontWeight.w400);
    return Container(
      width: size.width * 0.7,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(message['name'], style: _titleStyle),
          AccountTypeTag(isCompany: message['isCompany'], isOfficial: message['isOfficial']),
          Spacer(),
          Text(message['date'], style: _dateStyle),
        ],
      ),
    );
  }

  Widget _buildContent(Size size) {
    TextStyle _tipStyle = TextStyle(color: Colors.black45, fontSize: 16, fontWeight: FontWeight.w500);
    return Container(
      width: size.width * 0.7,
      child: Text(
        message['tip'],
        style: _tipStyle,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        color: Colors.white,
        width: size.width,
        height: itemHeight + iDefaultPadding * 2,
        padding: EdgeInsets.symmetric(horizontal: iDefaultPadding, vertical: iDefaultPadding),
        child: Row(
          children: [
            CircleAvatar(
              radius: itemHeight / 2,
              backgroundImage: NetworkImage(message['avatar']),
            ),
            SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitle(size),
                _buildContent(size),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
