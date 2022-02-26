import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomerTabSizeIndicator extends Decoration {
  final double width;
  final BorderSide borderSide;
  final EdgeInsetsGeometry insets;

  const CustomerTabSizeIndicator({
    this.borderSide = const BorderSide(width: 2.0, color: Colors.blue),
    this.insets = EdgeInsets.zero,
    this.width = 20,
  })  : assert(borderSide != null),
        assert(insets != null),
        assert(width != null);
  @override
  Decoration lerpFrom(Decoration? a, double t) {
    if (a is UnderlineTabIndicator) {
      return UnderlineTabIndicator(
        borderSide: BorderSide.lerp(a.borderSide, borderSide, t),
        insets: EdgeInsetsGeometry.lerp(a.insets, insets, t) as EdgeInsetsGeometry,
      );
    }
    return super.lerpFrom(a, t) as Decoration;
  }

  @override
  Decoration lerpTo(Decoration? b, double t) {
    if (b is CustomerTabSizeIndicator) {
      return CustomerTabSizeIndicator(
        borderSide: BorderSide.lerp(borderSide, b.borderSide, t),
        insets: EdgeInsetsGeometry.lerp(insets, b.insets, t) as EdgeInsetsGeometry,
      );
    }
    return super.lerpTo(b, t) as Decoration;
  }

  @override
  _MyUnderlinePainter createBoxPainter([VoidCallback? onChanged]) {
    return _MyUnderlinePainter(this, width, onChanged!);
  }
}

class _MyUnderlinePainter extends BoxPainter {
  final double width;
  _MyUnderlinePainter(this.decoration, this.width, VoidCallback onChanged)
      : assert(decoration != null),
        super(onChanged);

  final CustomerTabSizeIndicator decoration;

  BorderSide get borderSide => decoration.borderSide;
  EdgeInsetsGeometry get insets => decoration.insets;

  Rect _indicatorRectFor(Rect rect, TextDirection textDirection) {
    assert(rect != null);
    assert(textDirection != null);
    final Rect indicator = insets.resolve(textDirection).deflateRect(rect);

    //希望的宽度
    // double width = 20;
    //取中间坐标
    double cw = (indicator.left + indicator.right) / 2;
    return Rect.fromLTWH(cw - width / 2, indicator.bottom - borderSide.width, width, borderSide.width);
  }

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);
    final Rect rect = offset & (configuration.size as Size);
    final TextDirection textDirection = configuration.textDirection as TextDirection;
    final Rect indicator = _indicatorRectFor(rect, textDirection).deflate(borderSide.width / 2.0);
    // 规定绘制为圆角
    final Paint paint = borderSide.toPaint()..strokeCap = StrokeCap.round;
    canvas.drawLine(indicator.bottomLeft, indicator.bottomRight, paint);
  }
}
