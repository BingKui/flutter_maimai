import 'package:flutter/material.dart';
import 'package:flutter_maimai/components/badge.dart';

class CustomerTabItem extends StatelessWidget {
  const CustomerTabItem({
    Key? key,
    required this.title,
    required this.active,
    required this.press,
    this.badge = 'new',
    this.haveBadge = false,
    this.haveBorder = false,
    this.isScale = false,
  }) : super(key: key);

  final String title, badge;
  final bool active, haveBadge, haveBorder, isScale;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    TextStyle _style = TextStyle(
      fontSize: isScale ? (active ? 20 : 18) : 18,
      color: active ? Colors.black : Colors.black38,
      fontWeight: FontWeight.w500,
    );
    return GestureDetector(
      onTap: press,
      child: Container(
        height: 30,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            haveBorder
                ? Column(
                    children: [
                      Text(title, style: _style),
                      Container(
                        height: 2,
                        width: 20,
                        decoration: BoxDecoration(
                          color: active ? Colors.black : Colors.transparent,
                        ),
                      ),
                    ],
                  )
                : Text(title, style: _style),
            haveBadge ? SelfBadge(badge, top: -8, right: -30) : Text(''),
          ],
        ),
      ),
    );
  }
}
