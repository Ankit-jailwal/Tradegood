import 'package:flutter/material.dart';
import 'package:shop_app/components/no_account_text.dart';
import 'package:shop_app/svg.dart';
import '../../../size_config.dart';
import 'sign_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Stack(children: <Widget>[
          Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage(
                  "assets/images2/Login_forgotpswd_TG.png",
                ),
                fit: BoxFit.fitWidth,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.zero,
              child: Image.asset(
                "assets/images2/Login_forgotpswd_TG.png",
                color: null,
                fit: BoxFit.fitWidth,
                width: 411.0,
                height: 731.0,
                colorBlendMode: BlendMode.dstATop,
              ),
            ),
          ),
          SizedBox(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.15),
                  Container(
                    //color: Colors.black,
                      width: SizeConfig.screenWidth*0.6,
                      child: Image.asset("assets/logo/tgood.png")),
                  SizedBox(height: SizeConfig.screenHeight * 0.02),
                  Text(
                    '''Sign In''',
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 1.171875,
                      fontSize: 22.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 73, 73, 73),
                      /* letterSpacing: 0.0, */
                    ),
                  ),
                SizedBox(height: 10,),
                Transform(
                    transform: Matrix4(1.00, 0.00, 0.00, 0.00, -0.00, 1.00, 0.00, 0.00,
                        0.00, 0.00, 1.00, 0.00, 0.00, 0.00, 0.00, 1.00),
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 40.0,
                      height: 2.0,
                      child: SvgWidget(painters: [
                        SvgPathPainter.stroke(
                          2.0,
                          strokeMiterLimit: null,
                          strokeCap: null,
                          strokeJoin: StrokeJoin.miter,
                        )
                          ..addPath('M0 0L40 0L40 -2L0 -2L0 0Z')
                          ..color = Color.fromARGB(255, 255, 212, 37),
                      ]),
                    )),
                  SizedBox(height: SizeConfig.screenHeight * 0.04),
                  SignForm(),
                  SizedBox(height: SizeConfig.screenHeight * 0.01),
                  NoAccountText(),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
