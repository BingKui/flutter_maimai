import 'package:flutter/material.dart';
import 'package:flutter_maimai/pages/home/components/hot_choiceness.dart';
import 'package:flutter_maimai/pages/home/components/hot_list.dart';
import 'package:flutter_maimai/mock/home.dart';
import 'package:flutter_maimai/pages/home/components/speech_item.dart';

class Hot extends StatelessWidget {
  const Hot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List speechList = SpeechMockList;
    return Container(
      color: Colors.white,
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          List<Widget> _list = <Widget>[];
          if (index == 0) {
            _list.add(HotList());
            _list.add(HotChoiceness());
            _list.add(SpeechItem(speech: speechList[index]));
            return Column(
              children: _list,
            );
          }
          return SpeechItem(speech: speechList[index]);
        },
        itemCount: speechList.length,
      ),
    );
  }
}
