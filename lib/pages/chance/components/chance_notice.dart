import 'package:flutter/material.dart';
import 'package:flutter_maimai/components/self_icon.dart';
import 'package:flutter_maimai/constants.dart';

class ChanceNotice extends StatelessWidget {
  const ChanceNotice({
    Key? key,
    required this.count,
    required this.press,
  }) : super(key: key);

  final int count;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(
          left: iDefaultPadding,
          right: iDefaultPadding,
          bottom: iDefaultPadding,
        ),
        padding: EdgeInsets.all(iDefaultPadding),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: iBorderRadius,
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: iPrimaryColor.withOpacity(0.7),
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              child: Icon(
                SelfIcon.NotificationFilling,
                size: 40,
                color: Colors.white,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: iDefaultPadding / 2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '机会来了',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '又有$count家公司主动找你，想要聊聊，想要聊，想要聊聊',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(fontSize: 14, color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      child: Center(
                        child: Text(
                          '$count',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Icon(
              SelfIcon.ArrowRight,
              size: 25,
              color: Colors.black12,
            ),
          ],
        ),
      ),
    );
  }
}
