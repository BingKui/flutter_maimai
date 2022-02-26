import 'package:flutter/material.dart';
import 'package:flutter_maimai/constants.dart';

class Empty extends StatelessWidget {
  const Empty({
    Key? key,
    required this.title,
    this.tip = '',
  }) : super(key: key);

  final String title, tip;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      margin: EdgeInsets.all(iDefaultPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/empty.png',
            width: 160,
            height: 160,
          ),
          Padding(
            padding: EdgeInsets.only(top: iDefaultPadding, bottom: iDefaultPadding / 2),
            child: Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black)),
          ),
          Text(tip, style: TextStyle(fontSize: 14, color: Colors.black54)),
        ],
      ),
    );
  }
}
