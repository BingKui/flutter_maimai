import 'package:flutter/material.dart';
import 'package:flutter_maimai/constants.dart';

const EdgeInsets _margin = EdgeInsets.only(
  left: iDefaultPadding,
  right: iDefaultPadding,
  bottom: iDefaultPadding,
);

class BannerAd extends StatelessWidget {
  const BannerAd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ImageAd extends StatelessWidget {
  const ImageAd(
    this.image, {
    Key? key,
    this.margin = _margin,
  }) : super(key: key);

  final String image;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 120,
      width: size.width,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: iBorderRadius,
        image: new DecorationImage(
          image: new NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              height: 18,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10)),
              ),
              child: Center(
                child: Text(
                  '广告',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
