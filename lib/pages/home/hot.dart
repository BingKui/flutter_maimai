import 'package:flutter/material.dart';
import 'package:flutter_maimai/pages/home/components/hot_choiceness.dart';
import 'package:flutter_maimai/pages/home/components/hot_list.dart';

class Hot extends StatelessWidget {
  const Hot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          List<Widget> _list = <Widget>[];
          if (index == 0) {
            _list.add(HotList());
            _list.add(HotChoiceness());
            _list.add(Text('$index'));
            return Column(
              children: _list,
            );
          }
          return Text('$index');
        },
        itemCount: 120,
      ),
    );
  }
}
