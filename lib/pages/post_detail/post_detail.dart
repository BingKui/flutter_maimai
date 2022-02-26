import 'package:flutter/material.dart';
import 'package:flutter_maimai/types.dart';

class PostDetail extends StatefulWidget {
  const PostDetail({Key? key}) : super(key: key);
  @override
  _PostDetailState createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as PostDetailParam;
    return Scaffold(
      appBar: AppBar(),
      body: Text('传过来的ID为${args.postId}'),
    );
  }
}
