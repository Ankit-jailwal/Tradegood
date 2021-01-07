import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tradegood/API/getUserInfo.dart';
import 'package:tradegood/API/editUserInfo.dart';
import 'package:image_picker/image_picker.dart';

class Body extends StatefulWidget{
  File _image;
  bool imgFlag=false;
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        widget._image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getUserInfo(),
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),

                SizedBox(
                  height: 5,
                ),
                 GestureDetector(
                   onTap: (){
                     getImage();
                   },
                   child: Center(
                    child: widget._image == null
                        ?snapshot.data['user']['profilePicture']==null?CircleAvatar(
                      backgroundColor: Colors.black12,
                      radius: 45,
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Image.asset(
                            "assets/images2/fab7aa80f5a873babf8ce033863e11ae0ddb8547.png")
                      ),
                    ):Container(
                      height: 90,
                      width: 90,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(45),
                          child: Image.network(snapshot.data['user']['profilePicture'],fit: BoxFit.fill,)),):Container(
                      height: 90,
                      width: 90,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(45),
                        child: Image.file(widget._image,fit: BoxFit.fill,)),),
                ),
                 )
                ,
                Center(
                    child: Text(
                      "Upload your photo",
                    )),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    //initialValue: snapshot.data['user']['name'],
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: "Name",
                      labelStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                      ),
                    ), //Obscure logic
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    controller: phoneController,
                    //initialValue: snapshot.data['user']['phoneNumber'].toString(),
                    decoration: InputDecoration(
                      labelText: "Phone No.",
                      labelStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                      ),
                    ), //Obscure logic
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    initialValue: snapshot.data['user']['email'],
                    enabled: false,
                    decoration: InputDecoration(
                      labelText: "Email Address",
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ), //Obscure logic
                  ),
                ),


                Align(
                  alignment: FractionalOffset.bottomRight,
                  child: FlatButton(
                    onPressed: (){
                      final editedName=nameController.text;
                      final editiedPhone=phoneController.text;
                      print(editiedPhone);
                      print(editedName);
                      editUserInfo(editedName,editiedPhone
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        width: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.blue,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset(
                                "assets/images2/df7c67b66f4bb8b85e02ef7cd0fd57fb237b519a.png",
                                height: 25,),
                              Text("Edit", style: TextStyle(fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }
        return Center(child: Container(child: CircularProgressIndicator()));
      }
    );
  }
}
