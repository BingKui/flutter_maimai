import 'package:flutter/material.dart';
import 'package:flutter_maimai/components/app_bar_action.dart';
import 'package:flutter_maimai/components/self_icon.dart';
import 'package:flutter_maimai/constants.dart';
import 'package:flutter_maimai/mock/message.dart';
import 'package:flutter_maimai/pages/message/components/message_item.dart';
import 'package:flutter_maimai/pages/message/components/message_type.dart';

class Message extends StatefulWidget {
  const Message({Key? key}) : super(key: key);

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  List messageList = MessageMockList;

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text('消息', style: iAppBarTextStyle),
      actions: [
        AppBarAction(
          icon: SelfIcon.Add,
          right: iDefaultPadding * 0.8,
          press: () {},
        ),
      ],
      leading: AppBarAction(
        icon: SelfIcon.Search,
        left: iDefaultPadding * 0.6,
        press: () {},
      ),
      shadowColor: Colors.transparent,
      backgroundColor: iAppBarBackgroundColor,
    );
  }

  Widget _buildModalHeader(String title) {
    return Container(
      height: iModalHeaderHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SizedBox(
              width: iModalHeaderHeight,
              height: iModalHeaderHeight,
              child: Center(
                child: Icon(SelfIcon.CloseBold, size: 20),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                title,
                style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SizedBox(width: iModalHeaderHeight, height: iModalHeaderHeight),
        ],
      ),
    );
  }

  Widget _buildModelSheetContent(Size size, String title) {
    Radius _radius = Radius.circular(20);
    return Container(
      height: size.height * 0.88,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: _radius, topRight: _radius),
      ),
      child: Column(
        children: [
          _buildModalHeader(title),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return MessageItem(message: messageList[index], press: () {});
              },
              itemCount: messageList.length,
            ),
          ),
        ],
      ),
    );
  }

  void _showModalSheetAction(Size size, String title) {
    showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
      context: context,
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      builder: (BuildContext context) {
        return _buildModelSheetContent(size, title);
      },
    );
  }

  Widget _buildMessageType(Size size) {
    return SliverToBoxAdapter(
      child: Container(
        color: iAppBackgroundColor,
        padding: EdgeInsets.symmetric(horizontal: iDefaultPadding, vertical: iDefaultPadding / 2),
        child: Row(
          children: [
            MessageType(
              text: '我主动沟通',
              press: () {
                _showModalSheetAction(size, '我主动沟通');
              },
            ),
            MessageType(
              text: '只看未读',
              press: () {
                _showModalSheetAction(size, '只看未读');
              },
            ),
            MessageType(
              text: '好友消息',
              press: () {
                _showModalSheetAction(size, '好友消息');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return MessageItem(message: messageList[index], press: () {});
        },
        childCount: messageList.length,
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
          _buildMessageType(size),
          _buildMessageList(),
        ],
      ),
    );
  }
}
