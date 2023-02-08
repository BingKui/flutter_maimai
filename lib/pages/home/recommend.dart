import 'package:flutter/material.dart';
import 'package:flutter_maimai/constants.dart';
import 'package:flutter_maimai/mock/home.dart';
import 'package:flutter_maimai/pages/home/components/speech_item.dart';

class Recommend extends StatefulWidget {
  const Recommend({Key? key}) : super(key: key);

  @override
  _RecommendState createState() => _RecommendState();
}

class _RecommendState extends State<Recommend> {
  List speechList = SpeechMockList;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: iDefaultPadding / 2, bottom: iDefaultPadding * 4),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return SpeechItem(speech: speechList[index]);
        },
        itemCount: speechList.length,
      ),
    );
  }
}
