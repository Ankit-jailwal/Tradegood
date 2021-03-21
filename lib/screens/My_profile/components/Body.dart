import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tradegood/API/authentication.dart';
import 'package:tradegood/API/getUserInfo.dart';
import 'package:tradegood/API/editUserInfo.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';
import 'package:tradegood/API/updateProfilePicture.dart';

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
        print(pickedFile.path);
        widget._image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
  String name1="";
  String email1="";
  var nameController = TextEditingController(text: "");
  var emailController = TextEditingController(text: "");
  Future<void> getController(String name,String email) {
      name1=name;
      email1=email;
      nameController=TextEditingController(text: name1);
      emailController=TextEditingController(text: email);
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getUserInfo(),
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          getController(snapshot.data['user']['name'],snapshot.data["user"]['email'].toString());
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
                    //initialValue: snapshot.data['user']['email'],
                    //enabled: false,
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: "Email Address",
                      labelStyle: TextStyle(
                        color: Colors.black,
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
                    initialValue: snapshot.data['user']['phoneNumber'].toString(),
                    enabled: false,
                    decoration: InputDecoration(
                      labelText: "Phone Number",
                      labelStyle: TextStyle(
                        color: Colors.black,
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
                      initialValue: snapshot.data['user']['address']!=null?snapshot.data['user']['address']:"No address found",
                    enabled: false,
                    decoration: InputDecoration(
                      labelText: "Address",
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
                      final editiedEmail=emailController.text;
                      FocusScope.of(context).requestFocus(FocusNode());
                      updateProfilePicture(widget._image,snapshot.data['user']['name']);
                      editUserInfo(editedName,editiedEmail);
                      Toast.show("User information successfully saved", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top:15.0),
                      child: Container(
                        width: 120,
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
                              Text("Save", style: TextStyle(fontSize: 18,
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
