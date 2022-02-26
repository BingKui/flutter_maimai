import 'package:flutter/material.dart';
import 'package:flutter_maimai/components/app_ad.dart';
import 'package:flutter_maimai/components/safe_area.dart';
import 'package:flutter_maimai/constants.dart';
import 'package:flutter_maimai/mock/ad.dart';
import 'package:flutter_maimai/mock/home.dart';
import 'package:flutter_maimai/pages/home/components/ask_item.dart';
import 'package:flutter_maimai/pages/home/components/ask_menu.dart';

class Ask extends StatefulWidget {
  const Ask({Key? key}) : super(key: key);

  @override
  _AskState createState() => _AskState();
}

class _AskState extends State<Ask> {
  List askList = AskMockList;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          if (index == 0) {
            return AskMenu();
          }
          if (index == 1) {
            return ImageAd(
              AskImageAdUrl,
              margin: EdgeInsets.only(
                left: iDefaultPadding / 2,
                right: iDefaultPadding / 2,
                bottom: iDefaultPadding / 2,
              ),
            );
          }
          if (index == askList.length + 2) {
            return SafeAreaBottom();
          }
          return AskItem(askList[index - 2]);
        },
        itemCount: askList.length + 3,
      ),
    );
  }
}
