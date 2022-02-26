import 'package:flutter/material.dart';
import 'package:flutter_maimai/constants.dart';

class NoMore extends StatelessWidget {
  const NoMore({
    Key? key,
    this.tip = '没有更多了',
  }) : super(key: key);

  final String tip;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(iDefaultPadding),
      child: Text(
        tip,
        style: TextStyle(fontSize: 16, color: Colors.black45),
      ),
    );
  }
}
