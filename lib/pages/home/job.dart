import 'package:flutter/material.dart';
import 'package:flutter_maimai/constants.dart';
import 'package:flutter_maimai/mock/home.dart';
import 'package:flutter_maimai/pages/home/components/speech_item.dart';

class Job extends StatefulWidget {
  const Job({Key? key}) : super(key: key);

  @override
  _JobState createState() => _JobState();
}

class _JobState extends State<Job> {
  List speechList = SpeechMockList;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: iDefaultPadding / 2),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return SpeechItem(speech: speechList[index]);
        },
        itemCount: speechList.length,
      ),
    );
  }
}
