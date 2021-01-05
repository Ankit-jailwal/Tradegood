import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: CircleAvatar(
              backgroundColor: Colors.black12,
              radius: 45,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Image.asset(
                    "assets/images2/fab7aa80f5a873babf8ce033863e11ae0ddb8547.png"),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Center(
              child: Text(
            "Upload your photo",
          )),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20,right: 20),
            child: TextField(
              decoration: InputDecoration(
                labelText: "First Name",
                labelStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                ),
              ), //Obscure logic
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20,right: 20),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Last Name",
                labelStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                ),
              ), //Obscure logic
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20,right: 20),
            child: TextField(
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
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20,right: 20),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Email Address",
                labelStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                ),
              ), //Obscure logic
            ),
          ),
          Align(
            alignment: FractionalOffset.bottomRight,
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
                      Image.asset("assets/images2/df7c67b66f4bb8b85e02ef7cd0fd57fb237b519a.png",height: 25,),
                      Text("Edit",style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w800),),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
