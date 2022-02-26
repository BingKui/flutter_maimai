import 'package:flutter/material.dart';
import 'package:flutter_maimai/common/common.dart';
import 'package:flutter_maimai/components/app_bar_action.dart';
import 'package:flutter_maimai/components/customer_tab_item.dart';
import 'package:flutter_maimai/components/search_field.dart';
import 'package:flutter_maimai/components/self_icon.dart';
import 'package:flutter_maimai/constants.dart';
import 'package:flutter_maimai/mock/contact.dart';
import 'package:flutter_maimai/pages/contact/components/contact_item.dart';
import 'package:flutter_maimai/pages/contact/components/contact_menu.dart';
import 'package:flutter_maimai/pages/contact/components/discover_more.dart';
import 'package:flutter_maimai/pages/contact/components/friend_msg.dart';
import 'package:flutter_maimai/pages/contact/components/request_list.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  List contactList = ContactMockList;

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text('人脉', style: iAppBarTextStyle),
      actions: [
        AppBarAction(icon: SelfIcon.User, press: () {}, right: iDefaultPadding * 0.8),
      ],
      shadowColor: Colors.transparent,
      backgroundColor: iAppBarBackgroundColor,
    );
  }

  Widget _buildTop() {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          SearchField(
            placeholder: '找同学：XXX大学 XX专业',
          ),
          ContactMenu(),
          FriendMsg(),
          RequestList(),
          DiscoverMore(),
        ],
      ),
    );
  }

  Widget _buildTabContent() {
    return Row(
      children: [
        CustomerTabItem(title: '推荐', active: true, press: () {}),
        SizedBox(width: iDefaultPadding),
        CustomerTabItem(title: '同事', active: false, press: () {}),
        SizedBox(width: iDefaultPadding),
        CustomerTabItem(title: '校友', active: false, press: () {}),
        SizedBox(width: iDefaultPadding),
        CustomerTabItem(title: '同乡', active: false, press: () {}),
        SizedBox(width: iDefaultPadding),
        CustomerTabItem(title: '同行', active: false, press: () {}),
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
          return ContactItem(
            contact: contactList[index],
            press: () {},
          );
        },
        childCount: contactList.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
