import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:tradegood/API/addToCart.dart';
import '../../../size_config.dart';
import 'package:tradegood/size_config.dart';
import 'package:flutter/cupertino.dart';
import '../../../constants.dart';

class productButton extends StatefulWidget {
  int index;
  var data;
  productButton(this.data, this.index);
  @override
  _productButtonState createState() => _productButtonState();
}

class _productButtonState extends State<productButton> {
  bool check = false;
  int _counter = 0;
  bool _countFlag = false;

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

  final TextEditingController quantityController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Container(
            height: SizeConfig.screenHeight * 0.063,
            width: SizeConfig.screenWidth * 0.3,
            decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Stack(
                                  overflow: Overflow.visible,
                                  children: <Widget>[
                                    Form(
                                      key: _formKey,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Text(
                                            "Available Stock: ${widget.data['product'][widget.index]['availableStock']}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: TextFormField(
                                                keyboardType: TextInputType.number,
                                                controller: quantityController,
                                                onChanged: (value) {
                                                  if (value.isNotEmpty) {
                                                    removeError(
                                                        error: kEmailNullError);
                                                  } else if (emailValidatorRegExp
                                                      .hasMatch(value)) {
                                                    removeError(
                                                        error:
                                                            kInvalidEmailError);
                                                  }
                                                  return null;
                                                },
                                                validator: (value) {
                                                  if (value.isEmpty) {
                                                    addError(
                                                        error: kEmailNullError);
                                                    return "";
                                                  } else if (!emailValidatorRegExp
                                                      .hasMatch(value)) {
                                                    addError(
                                                        error:
                                                            kInvalidEmailError);
                                                    return "";
                                                  }
                                                  return null;
                                                },
                                                decoration: InputDecoration(
                                                  hintText: "Enter quantity",
                                                  floatingLabelBehavior:
                                                      FloatingLabelBehavior
                                                          .always,
                                                  suffixIcon: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 20),
                                                    child: Icon(
                                                      Icons.edit,
                                                      size: 30,
                                                    ),
                                                  ),
                                                ),
                                              )),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: FlatButton(
                                              onPressed: () {
                                                int quantity = int.parse(
                                                    quantityController.text);
                                                if (quantity > widget.data['product'][widget.index]['quantity']) {
                                                  if (quantity <=
                                                      widget.data['product']
                                                              [widget.index]
                                                          ['availableStock']) {
                                                    _counter = quantity-widget.data['product'][widget.index]['quantity']+1;
                                                    setState(() {
                                                      _countFlag = true;
                                                    });
                                                    Navigator.pop(context);
                                                  } else
                                                    Toast.show(
                                                        "Quantity should be less then ${widget.data['product'][widget.index]['availableStock']}",
                                                        context,
                                                        duration:
                                                            Toast.LENGTH_SHORT,
                                                        gravity: Toast.TOP);
                                                } else
                                                  Toast.show(
                                                      "Quantity should be greater then ${widget.data['product'][widget.index]['quantity']}",
                                                      context,
                                                      duration:
                                                          Toast.LENGTH_SHORT,
                                                      gravity: Toast.TOP);
                                              },
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.blue,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 20,
                                                            right: 20,
                                                            top: 10,
                                                            bottom: 10),
                                                    child: Text(
                                                      "Change",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  )),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          _countFlag ? "${_counter + widget.data['product'][widget.index]['quantity'] - 1}" : "ADD",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Roberto",
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            child: Icon(
                              Icons.add,
                              size: 20,
                              color: Colors.white,
                            ),
                            onTap: () {
                              if (_counter >= 0) {
                                if (_counter < widget.data['product'][widget.index]['availableStock']) {
                                  setState(() {
                                    _counter++;
                                    print(_counter);
                                    _countFlag = true;
                                  });
                                } else
                                  Toast.show(
                                      "Quantity should be less then ${widget.data['product'][widget.index]['availableStock']}",
                                      context,
                                      duration: Toast.LENGTH_SHORT,
                                      gravity: Toast.BOTTOM);
                              } else {
                                setState(() {
                                  _countFlag = false;
                                });
                              }
                            }),
                        GestureDetector(
                          child: Icon(
                            Icons.remove,
                            size: 20,
                            color: Colors.white,
                          ),
                          onTap: _decrement,
                        ),
                      ],
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (check == true) {
                        Toast.show("Item already added in your cart", context,
                            duration: Toast.LENGTH_SHORT, gravity: Toast.TOP);
                      } else {
                        Toast.show("Item added in cart", context,
                            duration: Toast.LENGTH_SHORT, gravity: Toast.TOP);
                        check = true;
                        addToCart(
                          widget.data['product'][widget.index]['_id'],
                          _countFlag ? _counter+widget.data['product'][widget.index]['quantity']-1 : widget.data['product'][widget.index]['quantity'],
                        );
                      }
                    });
                  },
                  child: Container(
                    height: 23,
                    child: Image.asset(
                      "assets/images2/4e2f4fae4dd36d9fe6ceccb20d21cad9b32dddf9.png",
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              "Min. Order ${widget.data['product'][widget.index]['quantity']}",
              style: TextStyle(
                color: Colors.red,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: "Roberto",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
