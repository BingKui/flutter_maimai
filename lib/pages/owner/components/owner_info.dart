import 'package:flutter/material.dart';
import 'package:flutter_maimai/components/card_container.dart';
import 'package:flutter_maimai/components/self_icon.dart';
import 'package:flutter_maimai/constants.dart';
import 'package:flutter_maimai/pages/owner/components/owner_detail_item.dart';
import 'package:flutter_maimai/pages/owner/components/owner_detail_line.dart';

class OwnerInfo extends StatelessWidget {
  const OwnerInfo({Key? key}) : super(key: key);

  Widget _buildInfo() {
    TextStyle _style = TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w500);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage('assets/images/avatar.jpg'),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: iDefaultPadding / 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '小码农',
                  style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text('悠点互娱', style: _style),
                Text('CEO', style: _style),
              ],
            ),
          ),
        ),
        Row(
          children: [
            Text('个人主页'),
            Icon(SelfIcon.ArrowRightFilling, size: 12),
          ],
        ),
      ],
    );
  }

  Widget _buildDetail() {
    return Padding(
      padding: EdgeInsets.only(top: iDefaultPadding),
      child: Row(
        children: [
          OwnerDetailItem(label: '好友', value: 1),
          OwnerDetailLine(),
          OwnerDetailItem(label: '影响力', value: 22),
          OwnerDetailLine(),
          OwnerDetailItem(label: '访客', value: 10),
          OwnerDetailLine(),
          OwnerDetailItem(label: '内容发布', value: 0),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      margin: EdgeInsets.only(left: iDefaultPadding, right: iDefaultPadding, bottom: iDefaultPadding, top: iDefaultPadding / 2),
      padding: EdgeInsets.all(iDefaultPadding),
      child: Column(
        children: [
          _buildInfo(),
          _buildDetail(),
        ],
      ),
    );
  }
}
