import 'package:flutter/material.dart';
import '../../../size_config.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight*0.05,
      width: SizeConfig.screenWidth * 0.6,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 243, 243, 243),
        borderRadius: BorderRadius.circular(2),
      ),
      child: TextField(
        onChanged: (value) => print(value),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenWidth(9)),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "Search Products...",
            prefixIcon: Icon(Icons.search)),
      ),
    );
  }
}
