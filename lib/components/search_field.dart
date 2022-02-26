import 'package:flutter/material.dart';
import 'package:flutter_maimai/components/self_icon.dart';
import 'package:flutter_maimai/constants.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
    this.placeholder = '输入搜索内容',
    this.btnText = '搜索',
    this.haveButton = false,
    this.haveGap = true,
  }) : super(key: key);

  final String placeholder, btnText;
  final bool haveButton, haveGap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(haveGap ? iDefaultPadding : 0),
      padding: EdgeInsets.only(right: haveGap ? 5 : 0, left: haveGap ? 10 : 0),
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(45)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            SelfIcon.Search,
            size: 20,
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                onChanged: (value) {},
                decoration: InputDecoration(
                  hintText: placeholder,
                  hintStyle: TextStyle(color: Colors.black45, fontSize: 16),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
          ),
          haveButton
              ? ElevatedButton(
                  onPressed: () {},
                  child: Text(btnText),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.all(1)),
                    textStyle: MaterialStateProperty.all(TextStyle(
                      fontSize: 14,
                    )),
                    backgroundColor: MaterialStateProperty.all(iPrimaryColor),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                )
              : Text(''),
        ],
      ),
    );
  }
}
