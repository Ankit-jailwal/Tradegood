import 'package:flutter/material.dart';
import 'package:tradegood/size_config.dart';
import '../../../size_config.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:tradegood/API/getAdditionalDetails.dart';
import 'package:tradegood/API/getUserInfo.dart';
import 'package:toast/toast.dart';

class Body extends StatefulWidget {
  var userName;
  File _image;
  Body(this.userName);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final picker = ImagePicker();
  var pickedFile=null;
  Future getImage() async {
    pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        widget._image = File(pickedFile.path);
      } else {
      }
    });
  }
String choice="GST No.*";
  var addresscontroller = TextEditingController();
  final TextEditingController GSTcontroller = TextEditingController(text: '');
  var  Certificatecontroller = TextEditingController();
  String address1;
  String certificate1;
  Future<void> getController(String address,String certificate) {
    address1=address;
    certificate1=certificate;
    addresscontroller=TextEditingController(text: address1);
    Certificatecontroller=TextEditingController(text: certificate1);
  }
int _value = 1;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getUserInfo(),
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          getController(snapshot.data['user']['address'],snapshot.data['user']['certificateNumber']);
          return Form(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: pickedFile == null
                        ? snapshot.data['user']['certificate']==null?Image.asset(
                      'assets/images/pick.jpg',
                    ):Image.network(
                      snapshot.data['user']['certificate'],
                    )
                        : Image.file(widget._image),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: SizeConfig.screenWidth * 0.77,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(color: Colors.grey)
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 8,
                              right: 8,
                              top: 4,
                              bottom: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [

                              DropdownButton(
                                  value: _value,
                                  iconSize: 0,
                                  underline: Container(
                                      color: Colors.transparent),
                                  dropdownColor: Colors.white,
                                  focusColor: Colors.transparent,
                                  items: [
                                    DropdownMenuItem(
                                      child: Text("GST Certificate",
                                        overflow: TextOverflow.visible,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          height: 1.171875,
                                          fontSize: 18.0,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w800,
                                          color: Colors.black,
                                          /* letterSpacing: 0.0, */
                                        ),),
                                      value: 1,
                                    ),
                                    DropdownMenuItem(
                                      child: Text("Udhyam Aadhar",
                                        overflow: TextOverflow.visible,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          height: 1.171875,
                                          fontSize: 18.0,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w800,
                                          color: Colors.black,
                                          /* letterSpacing: 0.0, */
                                        ),),
                                      value: 2,
                                    ),
                                    DropdownMenuItem(
                                      child: Text(
                                        "Shop & Establishment licence",
                                        overflow: TextOverflow.visible,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          height: 1.171875,
                                          fontSize: 18.0,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w800,
                                          color: Colors.black,
                                          /* letterSpacing: 0.0, */
                                        ),),
                                      value: 3,
                                    ),
                                    DropdownMenuItem(
                                      child: Text("Trade certificate/Licence",
                                        overflow: TextOverflow.visible,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          height: 1.171875,
                                          fontSize: 18.0,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w800,
                                          color: Colors.black,
                                          /* letterSpacing: 0.0, */
                                        ),),
                                      value: 4,
                                    ),
                                    DropdownMenuItem(
                                      child: Text("FSSAI Registration",
                                        overflow: TextOverflow.visible,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          height: 1.171875,
                                          fontSize: 18.0,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w800,
                                          color: Colors.black,
                                          /* letterSpacing: 0.0, */
                                        ),),
                                      value: 5,
                                    ),
                                    DropdownMenuItem(
                                      child: Text("Drug Licence",
                                        overflow: TextOverflow.visible,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          height: 1.171875,
                                          fontSize: 18.0,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w800,
                                          color: Colors.black,
                                          /* letterSpacing: 0.0, */
                                        ),),
                                      value: 6,
                                    ),
                                  ],
                                  onChanged: (value) {
                                    print(value);
                                    setState(() {
                                      _value = value;
                                    });
                                  }
                              ),
                              Icon(Icons.arrow_drop_down_outlined,
                                color: Colors.grey, size: 30,),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          getImage();
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Container(
                            width: 55.0,
                            height: 55.0,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(211, 1, 90, 207),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceEvenly,
                                children: [
                                  Icon(Icons.cloud_upload, color: Colors.white,
                                    size: 30,),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: addresscontroller,
                    decoration: InputDecoration(
                      labelText: "Full Address*",
                      hintText: "Enter your Address",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Icon(Icons.my_location, size: 30,),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: Certificatecontroller,
                    decoration: InputDecoration(
                      labelText: "Certificate Number*",
                      hintText: "Enter your Certificate Number",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Icon(Icons.insert_drive_file_rounded, size: 30,),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(25)),
                SizedBox(height: getProportionateScreenHeight(20)),
                FlatButton(
                  onPressed: () async {
                    if (addresscontroller.text != null && Certificatecontroller.text !=null &&
                        (widget._image != null || snapshot.data['user']['certificate'] !=null)) {
                      final response = await updateAdditionalDetails(
                          addresscontroller.text, widget._image==null?null:widget._image,
                          widget.userName, Certificatecontroller.text);
                      if (response['message'] != null) {
                        Toast.show(response['message'], context,
                            duration: Toast.LENGTH_LONG, gravity: Toast.TOP);
                      }
                      else
                        Toast.show("Something went wrong", context,
                            duration: Toast.LENGTH_SHORT, gravity: Toast.TOP);
                    }
                    else
                      Toast.show("Please enter valid details", context,
                          duration: Toast.LENGTH_SHORT, gravity: Toast.TOP);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      width: 140.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(211, 1, 90, 207),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.edit, color: Colors.white,),
                            Text(
                              '''Save''',
                              overflow: TextOverflow.visible,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                height: 1.171875,
                                fontSize: 18.0,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 255, 255, 255),
                                /* letterSpacing: 0.0, */
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(25)),
              ],
            ),
          );
        }
        return Center(child: CircularProgressIndicator());
      }
    );
  }


}
