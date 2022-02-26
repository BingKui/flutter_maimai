import 'package:flutter/material.dart';

// 定义基本颜色
const iAppBackgroundColor = Color(0xFFF4F5FA);
const iAppBarBackgroundColor = Color(0xFFF4F5FA);

// 定义在 app 中用到的颜色
const iPrimaryColor = Color(0xFF2150F4); // 主题色
const iTextColor = Color(0xFF3C4046);
const iTipColor = Color(0xFF7C7D81);
const iBackgroundColor = Color(0xFFF9F8FD);
const iAppBottomBarColor = Color(0xFF555763);
const iTagBackgroundColor = Color(0xFFF3F4FA);
const iTagTextColor = Color(0xFF7B7D84);
// 定义边界padding
const double iDefaultPadding = 20.0;
const BorderRadiusGeometry iBorderRadius = BorderRadius.all(Radius.circular(10));

// 定义基本样式变量
const List<BoxShadow> iBoxShadow = <BoxShadow>[
  BoxShadow(
    color: Colors.black12,
    offset: Offset(0, 0), //阴影y轴偏移量
    blurRadius: 5, //阴影模糊程度
    spreadRadius: 5, //阴影扩散程度
  ),
];

// 定义基本组件的尺寸
const double iSearchHeight = 54.0;
const double iModalHeaderHeight = 65.0;
const double iColumnMenuHeight = 60.0;

// appbar
const TextStyle iAppBarTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 24,
  fontWeight: FontWeight.bold,
);

// app-navbar
const double iNavBarHeight = 65.0;
const double iNavBarIconSize = 40.0;
const iNavbarColor = Color(0xFFAAACB8);
const iNavbarActiveColor = Colors.white;

// chance page
const double iFollowMenuHeight = 50.0;
