import 'package:flutter/material.dart';
import 'package:flutter_maimai/common/common.dart';
import 'package:flutter_maimai/components/app_ad.dart';
import 'package:flutter_maimai/components/app_bar_action.dart';
import 'package:flutter_maimai/components/customer_tab_item.dart';
import 'package:flutter_maimai/components/search_field.dart';
import 'package:flutter_maimai/components/self_icon.dart';
import 'package:flutter_maimai/constants.dart';
import 'package:flutter_maimai/mock/ad.dart';
import 'package:flutter_maimai/mock/company.dart';
import 'package:flutter_maimai/pages/chance/components/chance_notice.dart';
import 'package:flutter_maimai/pages/chance/components/follow_market.dart';
import 'package:flutter_maimai/pages/chance/components/post_item.dart';

class Chance extends StatefulWidget {
  const Chance({Key? key}) : super(key: key);

  @override
  _ChanceState createState() => _ChanceState();
}

class _ChanceState extends State<Chance> {
  List postList = CompanyPostMockList;

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text('看机会', style: iAppBarTextStyle),
      actions: [
        AppBarAction(icon: SelfIcon.Add, press: () {}, right: iDefaultPadding * 0.8),
      ],
      shadowColor: Colors.transparent,
      backgroundColor: iAppBarBackgroundColor,
    );
  }

  Widget _buildTop() {
    return SliverToBoxAdapter(
      child: Column(
        children: <Widget>[
          SearchField(
            haveButton: true,
            placeholder: '搜索感兴趣的职位',
            btnText: '搜索',
          ),
          ImageAd(ChanceImageAdUrl),
          FollowMarket(),
          ChanceNotice(
            count: 1,
            press: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent() {
    return Row(
      children: [
        CustomerTabItem(title: '推荐', active: true, press: () {}, haveBorder: true),
        SizedBox(width: iDefaultPadding),
        CustomerTabItem(title: '最新', active: false, press: () {}, haveBadge: true, haveBorder: true),
        Spacer(),
        Row(
          children: [
            Icon(
              SelfIcon.EditFilling,
              size: 16,
            ),
            Text(
              '职位偏好',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _buildStickBar() {
    return SliverPersistentHeader(
      pinned: true, //是否固定在顶部
      floating: true,
      delegate: CustomSliverDelegate(
        minHeight: 50, //收起的高度
        maxHeight: 50, //展开的最大高度
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: iDefaultPadding),
          color: Colors.white,
          alignment: Alignment.centerLeft,
          child: _buildTabContent(),
        ),
      ),
    );
  }

  Widget _buildList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return PostItem(
            itemInfo: postList[index],
            press: () {},
          );
        },
        childCount: postList.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: iAppBackgroundColor,
      appBar: _buildAppBar(),
      body: CustomScrollView(
        slivers: <Widget>[
          _buildTop(),
          _buildStickBar(),
          _buildList(),
          SliverPadding(
            padding: EdgeInsets.only(bottom: 200),
          ),
        ],
      ),
    );
  }
}
