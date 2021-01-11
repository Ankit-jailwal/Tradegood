import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:tradegood/API/addToCart.dart';
import '../../../size_config.dart';

class productButton extends StatefulWidget {
  int index;
  var data;
  productButton(this.data,this.index);
  @override
  _productButtonState createState() => _productButtonState();
}

class _productButtonState extends State<productButton> {
  bool check=false;
  int _counter=0;
  bool _countFlag=false;
  void _increment() {
    if (_counter >= 0)
      setState(() {
        _counter++;
        _countFlag = true;
      });
    else
      setState(() {
        _countFlag = false;
      });
  }

  void _decrement() {
    if (_counter > 1)
      setState(() {
        _counter--;
      });
    else
      setState(() {
        _counter = 0;
        _countFlag = false;
      });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: 10),
      child: Column(
        children: [
          Container(
            height: SizeConfig
                .screenHeight *
                0.06,
            width: SizeConfig
                .screenWidth *
                0.25,
            decoration: BoxDecoration(
                color: Colors
                    .orangeAccent,
                borderRadius:
                BorderRadius
                    .circular(
                    5)),
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment
                  .spaceEvenly,
              crossAxisAlignment:
              CrossAxisAlignment
                  .center,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets
                          .only(
                          left:
                          7),
                      child: Text(
                        _countFlag?"${widget.data['products'][widget.index]['quantity']*_counter}":"ADD",
                        style:
                        TextStyle(
                          color: Colors
                              .white,
                          fontSize:
                          14,
                          fontWeight:
                          FontWeight
                              .w700,
                          fontFamily:
                          "Roberto",
                        ),
                      ),
                    ),
                    SizedBox(width: 3,),
                    Column(
                      mainAxisAlignment:
                      MainAxisAlignment
                          .center,
                      children: [
                        GestureDetector(
                            child:
                            Icon(
                              Icons.add,
                              size:
                              20,
                              color:
                              Colors.white,
                            ),
                            onTap:
                                () {
                              if (_counter >= 0) {
                                setState(() {
                                  _counter++;
                                  print(
                                      _counter);
                                  _countFlag =
                                  true;
                                });
                              }
                              else {
                                setState(() {
                                  _countFlag =
                                  false;
                                });
                              }
                            }),
                        GestureDetector(
                          child:
                          Icon(
                            Icons
                                .remove,
                            size:
                            20,
                            color: Colors
                                .white,
                          ),
                          onTap:
                          _decrement,
                        ),
                      ],
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (check == true){
                        Toast.show("Item already added in your cart", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                      }
                      else
                      {
                        check =
                        true;
                        addToCart(widget.data['products'][widget.index]['_id'],
                            _countFlag?widget.data['products'][widget.index]['quantity']*_counter:widget.data['products'][widget.index]['quantity'],
                            );
                      }

                    });
                  },
                  child: Container(
                    height: 23,
                    child:
                    Image.asset(
                      "assets/images2/4e2f4fae4dd36d9fe6ceccb20d21cad9b32dddf9.png",
                    ),
                  ),
                )
              ],
            ),
          ),
          check
              ? Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                Image.asset(
                  "assets/images2/9cc73194de6fa0e85d13ba8fe84e31a844ad6341.png",
                  height: 12,
                ),
                SizedBox(width: 4,),
                Text(
                  "Added",
                  style:
                  TextStyle(
                    color: Colors
                        .green,
                    fontSize:
                    14,
                    fontWeight:
                    FontWeight
                        .w500,
                    fontFamily:
                    "Roberto",
                  ),
                ),
              ],
            ),
          )
              : Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              "Min. Order ${widget.data['products'][widget.index]['quantity']}",
              style: TextStyle(
                color:
                Colors.red,
                fontSize: 14,
                fontWeight:
                FontWeight
                    .w500,
                fontFamily:
                "Roberto",
              ),
            ),
          ),
        ],
      ),
    );
  }
}