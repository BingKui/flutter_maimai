import 'package:flutter/material.dart';
import 'package:flutter_maimai/components/self_icon.dart';
import 'package:flutter_maimai/constants.dart';
import 'package:flutter_maimai/mock/contact.dart';

class DiscoverMore extends StatelessWidget {
  const DiscoverMore({Key? key}) : super(key: key);

  Widget _buildActionBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            '再说吧',
            style: TextStyle(color: Colors.black45),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
          ),
        ),
        SizedBox(width: iDefaultPadding / 2),
        TextButton(
          onPressed: () {},
          child: Text(
            '去看看',
            style: TextStyle(color: Colors.white),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(iPrimaryColor.withOpacity(0.9)),
          ),
        ),
      ],
    );
  }

  Widget _buildContentCard(Size size) {
    return Container(
      width: size.width - iDefaultPadding * 2,
      margin: EdgeInsets.only(top: iDefaultPadding / 2),
      padding: EdgeInsets.all(iDefaultPadding / 2),
      decoration: BoxDecoration(
        color: Color(0xFFF8F7FA),
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(QinghuaLogo),
          ),
          SizedBox(width: 10),
          Container(
            width: size.width - iDefaultPadding * 3 - 50,
            child: Column(
              children: [
                Text(
                  '我们为你推荐了一批你可能认识的同学，看看他们的职场近况吧',
                  textAlign: TextAlign.left,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: iDefaultPadding / 5),
                  child: Row(
                    children: [
                      Icon(
                        SelfIcon.UserFilling,
                        color: Colors.black26,
                        size: 18,
                      ),
                      SizedBox(width: 5),
                      Text(
                        '张三、李四、王五、赵六',
                        style: TextStyle(fontSize: 14, color: Colors.black38),
                      ),
                    ],
                  ),
                ),
                _buildActionBtn(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      color: Colors.white,
      padding: EdgeInsets.all(iDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '发现更多',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          _buildContentCard(size),
        ],
      ),
    );
  }
}
