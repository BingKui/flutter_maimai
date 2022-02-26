import 'package:flutter/material.dart';
import 'package:flutter_maimai/components/navbar_item.dart';
import 'package:flutter_maimai/components/self_icon.dart';
import 'package:flutter_maimai/constants.dart';
import 'package:flutter_maimai/enums.dart';
import 'package:flutter_maimai/pages/chance/chance.dart';
import 'package:flutter_maimai/pages/contact/contact.dart';
import 'package:flutter_maimai/pages/home/home.dart';
import 'package:flutter_maimai/pages/message/message.dart';
import 'package:flutter_maimai/pages/owner/owner.dart';
import 'package:flutter_maimai/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Maimai',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      routes: iPageRouter,
      // onGenerateRoute: pageRouterController,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int navIdx = 0;
  List pageList = [
    Home(),
    Contact(),
    Chance(),
    Message(),
    Owner(),
  ];

  void changeNavbar(int idx) {
    setState(() {
      navIdx = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: pageList[navIdx],
      backgroundColor: iAppBackgroundColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: size.width * 0.9,
        height: iNavBarHeight,
        decoration: BoxDecoration(
          color: iAppBottomBarColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <NavbarItem>[
            NavbarItem(
              isActive: navIdx == 0,
              name: '首页',
              icon: SelfIcon.HomeFilling,
              press: () => changeNavbar(0),
            ),
            NavbarItem(
              isActive: navIdx == 1,
              name: '人脉',
              icon: SelfIcon.ContactFilling,
              num: 10,
              type: NavbarMessageType.dot,
              press: () => changeNavbar(1),
            ),
            NavbarItem(
              isActive: navIdx == 2,
              name: '机遇',
              num: 10,
              icon: SelfIcon.WorkFilling,
              press: () => changeNavbar(2),
            ),
            NavbarItem(
              isActive: navIdx == 3,
              name: '消息',
              num: 99,
              icon: SelfIcon.NotificationFilling,
              press: () => changeNavbar(3),
            ),
            NavbarItem(
              isActive: navIdx == 4,
              name: '我',
              icon: SelfIcon.UserFilling,
              press: () => changeNavbar(4),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
