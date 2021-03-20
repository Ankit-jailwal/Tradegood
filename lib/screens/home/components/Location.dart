import 'package:flutter/material.dart';
import 'package:tradegood/svg.dart';
import 'package:intl/intl.dart';

class locationField extends StatelessWidget {
  var userData;
  locationField(this.userData);
  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
      Image.asset(
        "assets/images2/4cfc5ee1f9831599e73d935a8d9c67d2fd57f5a3.png",
        fit: BoxFit.cover,
        width: 33.0,
        height: 33.0,
        colorBlendMode: BlendMode.dstATop,
      ),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.only(bottom: 3),
          child: userData['user']['route'] != null
              ? Text(
                  ' ${DateFormat('dd MMMM, yyyy').format(
                    DateTime.parse(userData['user']['route']['deliveryDate']),
                  )}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                )
              : Text(
                  "Choose your Route...",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
        ),
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
      ]),
    ]);
  }
}
