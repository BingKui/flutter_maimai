// 路由配置
import 'package:flutter/material.dart';
import 'package:flutter_maimai/404.dart';

// 路由配置信息
import 'package:flutter_maimai/pages/post_detail/post_detail.dart';
import 'package:flutter_maimai/pages/user/user.dart';

final Map<String, Widget Function(BuildContext)> iPageRouter = {
  '/postDetail': (context) => PostDetail(),
  '/user': (context) => User(),
};

// Route iPageRouterController(RouteSettings settings) {
//   if (settings.name == )
// }

// 路由传参配置方法
// Route pageRouterController(RouteSettings settings) {
//   final name = settings.name;
//   final Function? pageContentBuilder = iPageRouter[name];
//   print('运行到这里');
//   print(pageContentBuilder);
//   if (pageContentBuilder != null) {
//     if (settings.arguments != null) {
//       print('运行到这里');

//       final Route route = MaterialPageRoute(builder: (context) => pageContentBuilder(context, arguments: settings.arguments));
//       return route;
//     } else {
//       final Route route = MaterialPageRoute(builder: (context) => pageContentBuilder(context));
//       return route;
//     }
//   } else {
//     return MaterialPageRoute(builder: (context) => Error());
//   }
// }
