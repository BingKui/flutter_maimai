import 'package:flutter/material.dart';
import 'package:flutter_maimai/components/card_container.dart';
import 'package:flutter_maimai/components/tag.dart';
import 'package:flutter_maimai/constants.dart';

class AskItem extends StatelessWidget {
  const AskItem(this.askInfo, {Key? key}) : super(key: key);

  final askInfo;

  Widget _buildMention() {
    List _mentionData = askInfo['mention'];
    List<Widget> _mentionList = <Widget>[];
    for (int i = 0; i < _mentionData.length; i++) {
      _mentionList.add(Padding(
          padding: EdgeInsets.only(top: iDefaultPadding / 4, right: iDefaultPadding / 2),
          child: Text(
            '@${_mentionData[i]}',
            style: TextStyle(color: iPrimaryColor, fontSize: 14),
          )));
    }
    return Row(
      children: _mentionList,
    );
  }

  Widget _buildAnswer() {
    var _answer = askInfo['answer'];
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: iDefaultPadding, bottom: iDefaultPadding / 2),
          child: Row(
            children: [
              CircleAvatar(
                radius: 10,
                backgroundImage: NetworkImage(_answer['logo']),
              ),
              Padding(
                padding: EdgeInsets.only(left: iDefaultPadding / 4),
                child: Text(
                  _answer["name"],
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: Tag('ID', plain: true),
              ),
              Text(
                '回答：',
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
        ),
        Text(
          _answer['content'],
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: TextStyle(fontSize: 18, color: Colors.black54),
        )
      ],
    );
  }

  Widget _buildFooter() {
    int _count = askInfo['count'];
    int _likes = askInfo['likes'];
    return Padding(
      padding: EdgeInsets.only(top: iDefaultPadding / 2),
      child: Text('$_count 回答 · $_likes 人觉得靠谱', style: TextStyle(color: Colors.black38)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      margin: EdgeInsets.only(left: iDefaultPadding / 2, right: iDefaultPadding / 2, bottom: iDefaultPadding / 2),
      padding: EdgeInsets.all(iDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            askInfo['title'],
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          _buildMention(),
          _buildAnswer(),
          _buildFooter(),
        ],
      ),
    );
  }
}
