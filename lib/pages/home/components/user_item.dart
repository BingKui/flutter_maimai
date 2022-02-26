import 'package:flutter/material.dart';
import 'package:flutter_maimai/components/vip_badge.dart';
import 'package:flutter_maimai/constants.dart';

class UserItem extends StatelessWidget {
  const UserItem(this.userInfo, {Key? key}) : super(key: key);

  final userInfo;

  Widget _buildPostInfo(Size size) {
    String _company = userInfo['company'];
    String _post = userInfo['post'];
    bool _isVip = userInfo['vip'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: size.width * 0.4,
          child: Text(
            '$_company$_post',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.black45, fontSize: 14),
          ),
        ),
        _isVip ? VipBadge() : Text(''),
      ],
    );
  }

  Widget _buildMoreInfo() {
    int _count = userInfo['msgCount'];
    return _count > 0 ? Text('近30天发布了$_count个动态', style: TextStyle(color: Colors.black45, fontSize: 14)) : Text('');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: iDefaultPadding / 2),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(userInfo['avatar']),
          ),
          SizedBox(width: iDefaultPadding / 2),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userInfo['name'],
                  style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500),
                ),
                _buildPostInfo(size),
                _buildMoreInfo(),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              '关注',
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(iPrimaryColor),
              padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: iDefaultPadding)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
