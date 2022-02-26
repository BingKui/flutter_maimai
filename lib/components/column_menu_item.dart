import 'package:flutter/material.dart';
import 'package:flutter_maimai/components/self_icon.dart';
import 'package:flutter_maimai/constants.dart';

const _defaultExt = Text('');

class ColumnMenuItem extends StatelessWidget {
  const ColumnMenuItem({
    Key? key,
    this.ext = _defaultExt,
    required this.value,
    required this.press,
  }) : super(key: key);

  final Widget ext;
  final String value;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        height: iColumnMenuHeight,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: new Border(
            bottom: BorderSide(color: Colors.black.withOpacity(0.03), width: 1),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ext,
                ],
              ),
            ),
            SizedBox(width: iDefaultPadding / 4),
            Icon(
              SelfIcon.ArrowRightFilling,
              size: 12,
              color: Colors.black26,
            ),
          ],
        ),
      ),
    );
  }
}
