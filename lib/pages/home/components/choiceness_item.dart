import 'package:flutter/material.dart';
import 'package:flutter_maimai/constants.dart';

class ChoicenessItem extends StatelessWidget {
  const ChoicenessItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final item;

  Widget _buildTag() {
    String _tag = item['tag'];
    if (_tag == '') return Text('');
    return Positioned(
      right: iDefaultPadding / 2,
      top: iDefaultPadding / 2,
      child: Container(
        width: 25,
        height: 14,
        // padding: EdgeInsets.symmetric(horizontal: 5, ),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        child: Center(
          child: Text(_tag, style: TextStyle(color: Colors.white, fontSize: 10, fontStyle: FontStyle.italic)),
        ),
      ),
    );
  }

  Widget _buildTopImage() {
    return Container(
      width: 170,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
        image: DecorationImage(
          image: NetworkImage(item['picture']),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: iDefaultPadding / 4,
            left: iDefaultPadding / 4,
            child: Text(
              item['name'],
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
            ),
          ),
          _buildTag(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      // height: 120,
      margin: EdgeInsets.only(right: iDefaultPadding / 2),
      decoration: BoxDecoration(
        // color: Colors.yellow,
        border: Border.all(width: 0.3, color: Colors.black38),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTopImage(),
          Text(
            item['desc'],
            style: TextStyle(fontSize: 12, color: Colors.black38),
          ),
          Padding(
            padding: EdgeInsets.only(left: iDefaultPadding / 4),
            child: Text(
              item['content'],
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(),
            ),
          ),
        ],
      ),
    );
  }
}
