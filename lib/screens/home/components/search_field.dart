import 'package:flutter/material.dart';
import '../../../size_config.dart';
import 'package:tradegood/screens/searchScreen/searchScreen.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => searchField()),
        );
      },
      child: Container(
        height: SizeConfig.screenHeight*0.05,
        width: SizeConfig.screenWidth * 0.6,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 243, 243, 243),
          borderRadius: BorderRadius.circular(2),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Icon(Icons.search,color: Colors.grey,),
            ),
            Text("Search Products...")
          ],
        )
      ),
    );
  }
}
