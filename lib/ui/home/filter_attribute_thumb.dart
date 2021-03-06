import 'package:flutter/material.dart';

class FilterAttributeSliderThumb extends SliderComponentShape {
  final double min;
  final double max;
  final double thumbRadius;
  final thumbHeight;

  const FilterAttributeSliderThumb({
    this.thumbRadius,
    this.thumbHeight,
    this.min,
    this.max});

  @override void paint(
      PaintingContext context,
      Offset center,
      {Animation<double> activationAnimation,
        Animation<double> enableAnimation,
        bool isDiscrete,
        TextPainter labelPainter,
        RenderBox parentBox,
        SliderThemeData sliderTheme,
        TextDirection textDirection,
        double value,
        double textScaleFactor,
        Size sizeWithOverflow
      }) {
    final Canvas canvas = context.canvas;

    final paint = Paint();

    TextSpan span = new TextSpan(
      /*style: new TextStyle(
        fontSize: thumbRadius * .8,
        fontWeight: FontWeight.w700,
        color: sliderTheme.thumbColor, //Text Color of Value on Thumb
      ),*/
      text: this.max.toStringAsPrecision(2),
    );

    TextPainter tp = new TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr);
    tp.layout();
    Offset textCenter =
    Offset(center.dx - (tp.width / 2), center.dy - (tp.height / 2));

    canvas.drawCircle(center, thumbRadius * .9, paint);
    tp.paint(canvas, textCenter);


  }

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

}