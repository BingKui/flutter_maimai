import 'package:flutter/material.dart';
import 'package:flutter_maimai/components/self_icon.dart';
import 'package:flutter_maimai/constants.dart';
import 'package:flutter_maimai/mock/home.dart';

class HotList extends StatefulWidget {
  const HotList({Key? key}) : super(key: key);

  @override
  _HotListState createState() => _HotListState();
}

class _HotListState extends State<HotList> {
  List hotList = HotListMock;

  Widget _buildTitle() {
    return Row(
      children: [
        Text(
          '脉脉',
          style: TextStyle(fontSize: 25, color: iPrimaryColor, fontWeight: FontWeight.w500),
        ),
        Text(
          '热榜',
          style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildListContent() {
    List<Widget> _list = <Widget>[];
    for (int i = 0; i < hotList.length; i++) {
      _list.add(HotListItem(item: hotList[i], idx: i + 1));
    }
    return Column(
      children: _list,
    );
  }

  Widget _buildMoreAction() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: iDefaultPadding / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('查看更多', style: TextStyle(color: iPrimaryColor, fontSize: 14)),
          Icon(
            SelfIcon.ArrowRight,
            size: 14,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: iDefaultPadding / 2, horizontal: iDefaultPadding),
      padding: EdgeInsets.all(iDefaultPadding / 1.5),
      decoration: BoxDecoration(
        color: iAppBackgroundColor,
        borderRadius: iBorderRadius,
      ),
      child: Column(
        children: [
          _buildTitle(),
          _buildListContent(),
          GestureDetector(
            onTap: () {},
            child: _buildMoreAction(),
          ),
        ],
      ),
    );
  }
}

class HotListItem extends StatelessWidget {
  const HotListItem({
    Key? key,
    required this.item,
    required this.idx,
  }) : super(key: key);

  final item;
  final int idx;

  Widget _buildTag() {
    bool _isNew = item['isNew'];
    Color _color = _isNew ? iPrimaryColor : Colors.red;
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        border: new Border.all(width: 1, color: _color),
      ),
      child: Center(
        child: Text(
          _isNew ? '新' : '爆',
          style: TextStyle(color: _color, fontSize: 12),
        ),
      ),
    );
  }

  Widget _buildIdx() {
    Color _color = Colors.black;
    switch (idx) {
      case 1:
        _color = Colors.red[500] as Color;
        break;
      case 2:
        _color = Colors.yellow[900] as Color;
        break;
      case 3:
        _color = Colors.yellow[700] as Color;
        break;
    }
    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        color: _color,
        borderRadius: BorderRadius.all(Radius.circular(3)),
      ),
      child: Center(
        child: Text(
          '$idx',
          style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(top: iDefaultPadding / 4),
        child: Row(
          children: [
            _buildIdx(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  item['name'],
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
            _buildTag(),
          ],
        ),
      ),
    );
  }
}
