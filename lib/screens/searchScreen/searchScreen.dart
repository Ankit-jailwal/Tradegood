import 'package:flutter/material.dart';
import 'package:tradegood/size_config.dart';
import 'components/body.dart';
import 'package:tradegood/API/searchByProduct.dart';
import 'package:tradegood/components/internet_handler.dart';
import 'package:flutter_offline/flutter_offline.dart';

class searchField extends StatefulWidget {

  static String routeName = "/cart";
  @override
  _searchFieldState createState() => _searchFieldState();
}

class _searchFieldState extends State<searchField> {
  var data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        leading: Padding(
          padding: const EdgeInsets.only(left:20),
          child: Icon(
            Icons.search,
            size: 33,
            color: Colors.grey,
          ),
        ),
        title:
        TextField(
          onChanged: (value) async{
            var setData;
            setData=await searchByProduct(value);
            setState(() {
              data=setData;
            });
            },
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                  vertical: getProportionateScreenWidth(9)),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintText: "Search Products...",
              ),
        ),
        backgroundColor: Colors.white,
      ),
        body: Builder(
          builder: (BuildContext context) {
            return OfflineBuilder(
                connectivityBuilder: (BuildContext context,
                    ConnectivityResult connectivity, Widget child) {
                  final bool connected =
                      connectivity != ConnectivityResult.none;
                  return !connected?noInternet():Body(data);
                },
                child: Container()
            );
          },
        )
    );
  }
}