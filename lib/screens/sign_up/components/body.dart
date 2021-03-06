import 'package:flutter/material.dart';
import 'package:tradegood/components/account_exist.dart';
import 'package:tradegood/size_config.dart';
import '../../../svg.dart';
import 'sign_up_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children:<Widget>[
              SizedBox(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: [
                    SizedBox(height: SizeConfig.screenHeight * 0.07),
                    Container(
                        child:Image.asset("assets/images2/tgood_black.png",width: SizeConfig.screenWidth*0.6,)
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.02), // 4%
                  Text(
                    '''Sign Up''',
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
                    SizedBox(height: SizeConfig.screenHeight * 0.03),
                    SignUpForm(),
                    SizedBox(height: SizeConfig.screenHeight * 0.01),
                    haveAccountText(),
                    SizedBox(height: 40,)
                  ],
                ),
              ),
            ),
          ]
          ),
        ),
    );
  }
}
