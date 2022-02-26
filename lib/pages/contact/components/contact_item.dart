import 'package:flutter/material.dart';
import 'package:flutter_maimai/components/self_icon.dart';
import 'package:flutter_maimai/constants.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({
    Key? key,
    required this.contact,
    required this.press,
  }) : super(key: key);

  final contact;
  final VoidCallback press;

  Widget _buildActionBtn() {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(iPrimaryColor),
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: iDefaultPadding)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
      ),
      child: Row(
        children: [
          Icon(
            SelfIcon.Add,
            size: 16,
            color: Colors.white,
          ),
          SizedBox(width: iDefaultPadding / 4),
          Text(
            '好友',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildInfo() {
    List<Widget> _tagsWidget = <Widget>[];
    List<Widget> _otherWidget = <Widget>[];
    List _tags = contact['tag'];
    List _other = contact['other'];
    const _style = TextStyle(fontSize: 14, color: Colors.black38, fontWeight: FontWeight.w500);
    for (int i = 0; i < _tags.length; i++) {
      String item = _tags[i];
      _tagsWidget.add(Text(
        item,
        style: _style,
      ));
      _tagsWidget.add(SizedBox(width: 5));
    }
    for (int i = 0; i < _other.length; i++) {
      String item = _other[i];
      _otherWidget.add(Text(
        item,
        style: _style,
      ));
    }
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: iDefaultPadding / 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              contact['name'],
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
            ),
            Text(
              contact['post'],
              softWrap: true,
              style: TextStyle(fontSize: 14, color: Color(0xFFA9B2D6), fontWeight: FontWeight.w500),
            ),
            Row(children: _tagsWidget),
            Column(children: _otherWidget),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(iDefaultPadding),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(contact['avatar']),
          ),
          _buildInfo(),
          _buildActionBtn(),
        ],
      ),
    );
  }
}
