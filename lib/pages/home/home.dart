import 'package:flutter/material.dart';
import 'package:flutter_maimai/common/customer_tab_size_indicator.dart';
import 'package:flutter_maimai/components/app_bar_action.dart';
import 'package:flutter_maimai/components/customer_tab_item.dart';
import 'package:flutter_maimai/components/search_field.dart';
import 'package:flutter_maimai/components/self_icon.dart';
import 'package:flutter_maimai/constants.dart';
import 'package:flutter_maimai/pages/home/ask.dart';
import 'package:flutter_maimai/pages/home/follows.dart';
import 'package:flutter_maimai/pages/home/hot.dart';
import 'package:flutter_maimai/pages/home/job.dart';
import 'package:flutter_maimai/pages/home/recommend.dart';
import 'package:flutter_maimai/types.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int idx = 0;
  final List<String> _tabList = ['关注', '推荐', '热门', '职言', '问员工'];
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 5, initialIndex: 1);
  }

  void _changeActiveIdx(int index) {
    print('修改idx:$index');
    setState(() {
      idx = index;
    });
  }

  AppBar _buildAppBarHistory() {
    return AppBar(
      title: SearchField(
        haveGap: false,
        placeholder: '找同学：清华大学计算机专业',
      ),
      centerTitle: false,
      actions: [
        AppBarAction(
          icon: SelfIcon.AddBold,
          press: () {},
          right: iDefaultPadding / 2,
        ),
        AppBarAction(
          icon: SelfIcon.AddBold,
          press: () {},
          right: iDefaultPadding * 0.8,
        ),
      ],
      shadowColor: Colors.transparent,
      backgroundColor: iAppBarBackgroundColor,
      flexibleSpace: Container(
          // height: 30,
          // color: Colors.red,
          ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(48.0),
        child: Container(
          height: 40,
          // color: Colors.amber,
          padding: EdgeInsets.symmetric(horizontal: iDefaultPadding),
          child: Row(
            children: [
              CustomerTabItem(
                title: '关注',
                active: idx == 0,
                press: () {
                  _changeActiveIdx(0);
                },
                isScale: true,
                haveBorder: true,
              ),
              SizedBox(width: iDefaultPadding),
              CustomerTabItem(
                title: '推荐',
                active: idx == 1,
                press: () {
                  _changeActiveIdx(1);
                },
                isScale: true,
                haveBorder: true,
              ),
              SizedBox(width: iDefaultPadding),
              CustomerTabItem(
                title: '热门',
                active: idx == 2,
                press: () {
                  _changeActiveIdx(2);
                },
                isScale: true,
                haveBorder: true,
              ),
              SizedBox(width: iDefaultPadding),
              CustomerTabItem(
                title: '职言',
                active: idx == 3,
                press: () {
                  _changeActiveIdx(3);
                },
                isScale: true,
                haveBorder: true,
              ),
              SizedBox(width: iDefaultPadding),
              CustomerTabItem(
                title: '问员工',
                active: idx == 4,
                press: () {
                  _changeActiveIdx(4);
                },
                isScale: true,
                haveBorder: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SearchField(
        haveGap: false,
        placeholder: '找同学：清华大学计算机专业',
      ),
      centerTitle: false,
      actions: [
        AppBarAction(
          icon: SelfIcon.AddBold,
          press: () {},
          right: iDefaultPadding / 2,
        ),
        AppBarAction(
          icon: SelfIcon.AddBold,
          press: () {},
          right: iDefaultPadding * 0.8,
        ),
      ],
      shadowColor: Colors.transparent,
      backgroundColor: iAppBarBackgroundColor,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(48.0),
        child: Container(
          alignment: Alignment.centerLeft,
          height: 40,
          child: TabBar(
            tabs: _tabList.map((f) {
              return Text(f);
            }).toList(),
            indicator: CustomerTabSizeIndicator(
              borderSide: BorderSide(
                width: 3,
              ),
              width: 20,
            ),
            controller: _tabController,
            indicatorColor: Colors.black,
            isScrollable: true,
            labelColor: Colors.black,
            indicatorWeight: 3.0,
            labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            unselectedLabelColor: Colors.black38,
            unselectedLabelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  Widget _buildBtn() {
    return TextButton(
      onPressed: () {
        print('点击');
        Navigator.pushNamed(
          context,
          '/postDetail',
          arguments: PostDetailParam(1),
        );
      },
      child: Text('去详情'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: iAppBackgroundColor,
      body: TabBarView(
        controller: _tabController,
        children: [
          Follows(),
          Recommend(),
          Hot(),
          Job(),
          Ask(),
        ],
      ),
    );
  }
}
