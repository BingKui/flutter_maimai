import 'package:flutter/material.dart';
import 'package:flutter_maimai/components/badge.dart';
import 'package:flutter_maimai/constants.dart';
import 'package:flutter_maimai/enums.dart';

class NavbarItem extends StatelessWidget {
  const NavbarItem({
    Key? key,
    required this.isActive,
    required this.name,
    required this.icon,
    this.num = 0,
    this.type = NavbarMessageType.number,
    required this.press,
  }) : super(key: key);

  final bool isActive;
  final String name;
  final IconData icon;
  final int num;
  final NavbarMessageType type;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var itemWidth = (size.width * 0.9) / 5;
    bool isDot = type == NavbarMessageType.dot;
    // return
    return InkWell(
      onTap: press,
      child: Container(
        width: itemWidth,
        child: Stack(
          children: [
            SizedBox(
              width: itemWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: Icon(
                      icon,
                      color: isActive ? iNavbarActiveColor : iNavbarColor,
                    ),
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 12,
                      color: isActive ? iNavbarActiveColor : iNavbarColor,
                    ),
                  )
                ],
              ),
            ),
            num > 0
                ? SelfBadge(
                    '$num',
                    dot: isDot,
                    right: isDot ? itemWidth * 0.3 : itemWidth * 0.16,
                    top: isDot ? 10 : 4,
                  )
                : Text(''),
          ],
        ),
      ),
    );
  }
}

class NavbarItemBadge extends StatelessWidget {
  const NavbarItemBadge({
    Key? key,
    required this.type,
    this.num = 0,
  }) : super(key: key);

  final int num;
  final NavbarMessageType type;

  Widget createBadge() {
    bool isDot = type == NavbarMessageType.dot;
    return Container(
      width: isDot ? 8 : 18,
      height: isDot ? 8 : 18,
      child: isDot
          ? Text('')
          : Center(
              child: Text('$num', style: TextStyle(fontSize: 10.0, color: Colors.white)),
            ),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: new BorderRadius.all(
          const Radius.circular(16.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return num > 0 ? createBadge() : Text('');
  }
}
