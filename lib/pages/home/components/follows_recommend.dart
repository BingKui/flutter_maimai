import 'package:flutter/material.dart';
import 'package:flutter_maimai/components/card_container.dart';
import 'package:flutter_maimai/components/self_icon.dart';
import 'package:flutter_maimai/constants.dart';
import 'package:flutter_maimai/mock/home.dart';
import 'package:flutter_maimai/pages/home/components/user_item.dart';

class FollowsRecommend extends StatefulWidget {
  const FollowsRecommend({Key? key}) : super(key: key);

  @override
  _FollowsRecommendState createState() => _FollowsRecommendState();
}

class _FollowsRecommendState extends State<FollowsRecommend> {
  List userList = FollowsRecommendMockList;

  Widget _buildTitle() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: iDefaultPadding / 2),
      child: Text(
        '为你推荐',
        style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildContent() {
    List<Widget> _list = <Widget>[];
    for (int i = 0; i < userList.length; i++) {
      _list.add(UserItem(userList[i]));
    }
    return Column(
      children: _list,
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: iDefaultPadding / 1.5),
      decoration: BoxDecoration(
        border: new Border(top: BorderSide(width: 0.3, color: Colors.black12)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('查看更多', style: TextStyle(fontSize: 16, color: Colors.black54)),
          SizedBox(width: iDefaultPadding / 4),
          Icon(SelfIcon.ArrowRightFilling, size: 14, color: Colors.black45),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      padding: EdgeInsets.symmetric(horizontal: iDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(),
          _buildContent(),
          _buildFooter(),
        ],
      ),
    );
  }
}
