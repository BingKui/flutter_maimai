import 'package:flutter/material.dart';
import 'package:flutter_maimai/components/card_container.dart';
import 'package:flutter_maimai/components/self_icon.dart';
import 'package:flutter_maimai/constants.dart';

class RequestList extends StatelessWidget {
  const RequestList({Key? key}) : super(key: key);

  Widget _buildTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: iDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '待处理请求',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          Row(
            children: [
              Text(
                '管理我的请求',
                style: TextStyle(fontSize: 16, color: Colors.black38),
              ),
              Icon(
                SelfIcon.ArrowRightFilling,
                color: Colors.black26,
                size: 12,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: iDefaultPadding / 2),
      child: Center(
        child: Text(
          '暂无好友请求，先来添加认识的好友吧！',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black26,
          ),
        ),
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
          _buildContent(),
        ],
      ),
    );
  }
}
