import 'package:flutter/material.dart';
import 'package:tradegood/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight*0.075,),
          Container(
            width: SizeConfig.screenWidth*0.5,
            child: Image.asset(
              "assets/images2/tgood_black.png"
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight*0.08,),
          Container(
            width: SizeConfig.screenWidth*0.8,
            child: Text("Hola! jaskdaskd aksd lkaslkd klsakd aksc sakxs kmxakmsx kkxask xaskmx kmsacnds cna oied ieadnic ksxclkdc jids ckiadcalsd cadmklcixzlkcmASCSKLcnkdlkc.a slkdad mkldsklKLDk ks MKkmklm sckmKMM KCKLMAKMC KMmLKLk CMKadklC KlaDKLCas KD as<<asL lkkdskdcmdlmk lakfmkladklakld lkmfadkm klmsakldmcaksdkafsnank da  fan",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: "Roberto",
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
