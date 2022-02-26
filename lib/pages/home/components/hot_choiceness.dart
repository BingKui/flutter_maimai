import 'package:flutter/material.dart';
import 'package:flutter_maimai/constants.dart';
import 'package:flutter_maimai/mock/home.dart';
import 'package:flutter_maimai/pages/home/components/choiceness_item.dart';

class HotChoiceness extends StatefulWidget {
  const HotChoiceness({Key? key}) : super(key: key);

  @override
  _HotChoicenessState createState() => _HotChoicenessState();
}

class _HotChoicenessState extends State<HotChoiceness> {
  List columnList = HotChoicenessColumnMock;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 160,
      margin: EdgeInsets.only(left: iDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: iDefaultPadding / 2),
            child: Text(
              '精选专栏',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            height: 120,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ChoicenessItem(item: columnList[index]);
              },
              itemCount: columnList.length,
            ),
          ),
        ],
      ),
    );
  }
}
