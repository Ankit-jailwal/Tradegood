import 'package:flutter/material.dart';
import '../../../svg.dart';



class location extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
      Container(
      width: 182.0,
      height: 1.0,
      child: SvgWidget(painters: [
        SvgPathPainter.stroke(
          1.0,
          strokeMiterLimit: null,
          strokeCap: null,
          strokeJoin: StrokeJoin.miter,
        )
          ..addPath('M0 0L182 0L182 -1L0 -1L0 0Z')
          ..color = Color.fromARGB(255, 255, 255, 255),
      ]),
    ),
      ],
    );
  }
}