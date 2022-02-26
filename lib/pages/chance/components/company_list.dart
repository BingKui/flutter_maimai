import 'dart:math';

import 'package:flutter/material.dart';

class CompanyList extends StatelessWidget {
  const CompanyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SliverPersistentHeader(
            pinned: true, //是否固定在顶部
            floating: true,
            delegate: _SliverAppBarDelegate(
                minHeight: 50, //收起的高度
                maxHeight: 50, //展开的最大高度
                child: Container(
                  padding: EdgeInsets.only(left: 16),
                  color: Colors.pink,
                  alignment: Alignment.centerLeft,
                  child: Text("浮动", style: TextStyle(fontSize: 18)),
                )),
          ),
        ],
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight || minHeight != oldDelegate.minHeight || child != oldDelegate.child;
  }
}
