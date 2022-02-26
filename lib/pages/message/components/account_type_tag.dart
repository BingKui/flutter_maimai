import 'package:flutter/material.dart';
import 'package:flutter_maimai/constants.dart';

class AccountTypeTag extends StatelessWidget {
  const AccountTypeTag({
    Key? key,
    this.isOfficial = false,
    this.isCompany = false,
  }) : super(key: key);

  final bool isOfficial, isCompany;

  @override
  Widget build(BuildContext context) {
    bool _isNoEmpty = isCompany || isOfficial;
    String _tagValue = isCompany ? '企业' : (isOfficial ? '官方' : '');
    return _isNoEmpty
        ? Container(
            margin: EdgeInsets.only(left: iDefaultPadding / 2),
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            child: Text(
              _tagValue,
              style: TextStyle(fontSize: 12, color: Colors.black26),
            ),
          )
        : Text('');
  }
}
