import 'package:flutter/material.dart';
import 'package:tradegood/API/addToWishlist.dart';
import 'package:toast/toast.dart';
import 'package:tradegood/API/removeItemWishlist.dart';

class wishListButton extends StatefulWidget {
  var data;
  int index;
  wishListButton(this.data,this.index);
  @override
  _wishListButtonState createState() => _wishListButtonState();
}

class _wishListButtonState extends State<wishListButton> {
  bool wishCheck=true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: GestureDetector(
        onTap: () {

          setState(() {
            if (wishCheck ==
                true) {
              wishCheck = false;
               addToWishlist(
                  widget.data['products'][widget.index]['_id']);
              Toast.show("Item added in wishlist", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
            }
            else {
              wishCheck = true;
              Toast.show("Item removed from wishlist", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
              removeItemWishlist(widget.data['products'][widget.index]['_id']);
            }
          });
        },
        child: wishCheck
            ? Image.asset(
          "assets/images2/f99614dc8ffdca073f67f7261c6a80fbbe774e29.png",
          height: 25,
        ) : Image.asset(
          "assets/images2/406096fa0d4df7618ea2b7bd7b3b1beaa4c6b8bd.png",
          height: 25,
        ),
      ),
    );
  }
}