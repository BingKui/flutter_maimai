import 'package:flutter/material.dart';

class OwnerDetailItem extends StatelessWidget {
  const OwnerDetailItem({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  final String label;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            '$value',
            style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(color: Colors.black38, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
