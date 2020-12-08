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
        ],
      ),
    );
  }
}
