import 'package:flutter/material.dart';
import 'package:flutter_maimai/components/self_icon.dart';
import 'package:flutter_maimai/components/tag.dart';
import 'package:flutter_maimai/constants.dart';

class PostItem extends StatelessWidget {
  const PostItem({
    Key? key,
    required this.itemInfo,
    required this.press,
  }) : super(key: key);

  final itemInfo;
  final VoidCallback press;

  String _dealSalaryText() {
    var obj = itemInfo['salary'];
    if (obj == null) return '';
    int minNum = obj['min'];
    int maxNum = obj['max'];
    int monthNum = itemInfo['month'];
    return '$minNum' + 'k-' + '$maxNum' + 'k·$monthNum薪';
  }

  Widget _buildLogo() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: iBorderRadius,
        border: new Border.all(
          color: Colors.black12,
        ),
        image: new DecorationImage(
          image: new NetworkImage(itemInfo['companyLogo']),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          itemInfo['postName'],
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Spacer(flex: 1,),
        Text(
          _dealSalaryText(),
          style: TextStyle(
            color: iPrimaryColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildTagList() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Tag(itemInfo['location']),
          SizedBox(width: 10),
          Tag(itemInfo['education']),
          SizedBox(width: 10),
          Tag(itemInfo['workYear']),
        ],
      ),
    );
  }

  Widget _buildExtInfo() {
    TextStyle _style = TextStyle(
      color: Colors.black45,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );
    return Row(
      children: [
        Text(itemInfo['companyName'], style: _style),
        SizedBox(width: 5),
        Text(itemInfo['status'], style: _style),
        SizedBox(width: 5),
        Text(itemInfo['people'], style: _style),
        Spacer(),
        InkWell(
          onTap: press,
          child: Icon(
            SelfIcon.Close,
            size: 15,
            color: Colors.black26,
          ),
        ),
      ],
    );
  }

  Widget _buildContent() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: iDefaultPadding / 2),
        child: Column(
          children: <Widget>[
            _buildHeader(),
            _buildTagList(),
            _buildExtInfo(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // print("数据为：$itemInfo.pay['pay']");
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(horizontal: iDefaultPadding),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: iDefaultPadding),
        decoration: BoxDecoration(
          border: new Border(
            bottom: BorderSide(
              color: Colors.black.withOpacity(0.05),
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLogo(),
            _buildContent(),
          ],
        ),
      ),
    );
  }
}
