import 'package:flutter/material.dart';
import 'package:flutter_maimai/components/empty.dart';
import 'package:flutter_maimai/components/no_more.dart';
import 'package:flutter_maimai/components/safe_area.dart';
import 'package:flutter_maimai/pages/home/components/follows_recommend.dart';

class Follows extends StatelessWidget {
  const Follows({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Empty(
            title: '还没有关注任何人呢',
            tip: '关注你感兴趣的人，他们发布的内容会在这里展示',
          ),
          FollowsRecommend(),
          NoMore(),
          SafeAreaBottom(),
        ],
      ),
    );
  }
}
