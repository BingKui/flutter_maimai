import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_maimai/components/card_container.dart';
import 'package:flutter_maimai/components/self_icon.dart';
import 'package:flutter_maimai/components/tag.dart';
import 'package:flutter_maimai/components/vip_badge.dart';
import 'package:flutter_maimai/constants.dart';
import 'package:flutter_maimai/types.dart';

class SpeechItem extends StatefulWidget {
  const SpeechItem({
    Key? key,
    required this.speech,
  }) : super(key: key);

  final speech;

  @override
  _SpeechItemState createState() => _SpeechItemState();
}

class _SpeechItemState extends State<SpeechItem> {
  String _dealCompanyInfo() {
    String _prefix = widget.speech['isOn'] ? '' : '前';
    String _company = widget.speech['company'];
    String _post = widget.speech['post'];
    return '$_prefix$_company$_post';
  }

  Widget _renderTag() {
    String _tag = widget.speech['tag'];
    if (_tag == '') {
      return Text('');
    } else {
      return Tag(_tag);
    }
  }

  Widget _buildHeader() {
    Size size = MediaQuery.of(context).size;
    bool _isVip = widget.speech['vip'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/user', arguments: UserDetailParam(widget.speech['userId']));
          },
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(widget.speech['avatar']),
              ),
              SizedBox(width: iDefaultPadding / 2),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.speech['name'],
                        style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: iDefaultPadding / 4),
                      _renderTag(),
                    ],
                  ),
                  Container(
                    width: size.width * 0.65,
                    child: Row(
                      children: [
                        Text(
                          _dealCompanyInfo(),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 14, color: Colors.black38),
                        ),
                        SizedBox(width: 3),
                        _isVip ? VipBadge() : Text(''),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {},
          child: Transform.rotate(
            angle: math.pi / 2,
            child: Icon(
              SelfIcon.Elipsis,
              size: 16,
              color: Colors.black26,
            ),
          ),
        ),
      ],
    );
  }

  // 生成单个tag标签
  Widget _buildTagItem(String tag) {
    return GestureDetector(
      onTap: () {
        // 跳转到搜索页面，并把标签内容带入
      },
      child: Padding(
        padding: EdgeInsets.only(right: iDefaultPadding / 4, top: iDefaultPadding / 2, bottom: iDefaultPadding / 2),
        child: Text(
          '#$tag',
          style: TextStyle(fontSize: 16, color: iPrimaryColor),
        ),
      ),
    );
  }

  // 生成tag列表
  Widget _buildTagList() {
    List<Widget> _tagList = <Widget>[];
    List<String> _tagData = widget.speech['tagList'];
    for (int i = 0; i < _tagData.length; i++) {
      _tagList.add(_buildTagItem(_tagData[i]));
    }
    return Row(
      children: _tagList,
    );
  }

  Widget _buildImageItem(String image, bool isSingle) {
    Size size = MediaQuery.of(context).size;
    double _allWidth = size.width - iDefaultPadding * 4;
    double _width = isSingle ? _allWidth / 2 : (_allWidth - iDefaultPadding) / 3;
    return InkWell(
      onTap: () {
        // 点击预览
      },
      child: isSingle
          ? Container(
              width: _width,
              margin: EdgeInsets.only(top: iDefaultPadding / 2),
              decoration: BoxDecoration(
                borderRadius: iBorderRadius,
                border: new Border.all(color: Colors.black54, width: 0.1),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            )
          : Container(
              width: _width,
              height: _width,
              margin: EdgeInsets.only(top: iDefaultPadding / 2),
              decoration: BoxDecoration(
                borderRadius: iBorderRadius,
                border: new Border.all(color: Colors.black54, width: 0.1),
                image: new DecorationImage(
                  image: new NetworkImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
    );
  }

  Widget _buildImageList() {
    List<Widget> _imgList = <Widget>[];
    List<String> _imgData = widget.speech['imgList'];
    int len = _imgData.length;
    Widget _more = Text('');
    int _targetLen = len;
    if (len == 1) {
      return _buildImageItem(_imgData[0], true);
    } else if (len > 3) {
      _targetLen = 3;
      _more = Positioned(
        right: iDefaultPadding / 2,
        bottom: iDefaultPadding,
        child: Container(
          height: 20,
          padding: EdgeInsets.symmetric(horizontal: iDefaultPadding / 4),
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: Center(
            child: Text('+${len - 3}', style: TextStyle(color: Colors.white, fontSize: 12)),
          ),
        ),
      );
    }

    for (int i = 0; i < _targetLen; i++) {
      _imgList.add(_buildImageItem(_imgData[i], false));
      if (i != _targetLen - 1) {
        _imgList.add(SizedBox(width: iDefaultPadding / 2));
      }
    }
    return Stack(
      children: [
        Row(
          children: _imgList,
        ),
        _more,
      ],
    );
  }

  // 生成主体内容
  Widget _buildContent(Size size) {
    String _content = widget.speech['content'];
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(top: iDefaultPadding / 2),
        constraints: BoxConstraints(
          // maxHeight: 300,
          minHeight: 30,
        ),
        decoration: BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _content,
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            _buildImageList(),
            _buildTagList(),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter() {
    int _share = widget.speech['share'];
    int _comment = widget.speech['comment'];
    int _praise = widget.speech['praise'];
    return Padding(
      padding: EdgeInsets.only(top: iDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BottomItem(
            icon: SelfIcon.Share,
            value: _share,
            press: () {},
          ),
          BottomItem(
            icon: SelfIcon.Comment,
            value: _comment,
            press: () {},
          ),
          BottomItem(
            icon: SelfIcon.Good,
            value: _praise,
            press: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildTopic() {
    String _topic = widget.speech['topic'];
    if (_topic == '') return Text('');
    return Container(
      height: 30,
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: iPrimaryColor.withOpacity(0.05),
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 15,
            height: 15,
            margin: EdgeInsets.only(right: iDefaultPadding / 4),
            decoration: BoxDecoration(
              color: iPrimaryColor.withOpacity(0.5),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Center(
              child: Text(
                '#',
                style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Text(
            _topic,
            style: TextStyle(fontSize: 12, color: iPrimaryColor.withOpacity(0.5), fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CardContainer(
      margin: EdgeInsets.only(left: iDefaultPadding / 2, right: iDefaultPadding / 2, bottom: iDefaultPadding / 2),
      padding: EdgeInsets.all(iDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          _buildContent(size),
          _buildTopic(),
          _buildFooter(),
        ],
      ),
    );
  }
}

class BottomItem extends StatelessWidget {
  const BottomItem({
    Key? key,
    required this.value,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final int value;
  final IconData icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: press,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 20,
                color: Colors.black54,
              ),
              SizedBox(width: iDefaultPadding / 2),
              Text(
                '$value',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
