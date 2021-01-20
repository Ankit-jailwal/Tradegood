import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class viewMore extends StatefulWidget {
  @override
  _viewMoreState createState() => _viewMoreState();
}

class _viewMoreState extends State<viewMore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(leading: Container(), title: Text('Modal With Page View')),
      body: Material(
          child: SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  title: Text('Edit'),
                  leading: Icon(Icons.edit),
                  onTap: () => Navigator.of(context).pop(),
                ),
                ListTile(
                  title: Text('Copy'),
                  leading: Icon(Icons.content_copy),
                  onTap: () => Navigator.of(context).pop(),
                ),
                ListTile(
                  title: Text('Cut'),
                  leading: Icon(Icons.content_cut),
                  onTap: () => Navigator.of(context).pop(),
                ),
                ListTile(
                  title: Text('Move'),
                  leading: Icon(Icons.folder_open),
                  onTap: () => Navigator.of(context).pop(),
                ),
                ListTile(
                  title: Text('Delete'),
                  leading: Icon(Icons.delete),
                  onTap: () => Navigator.of(context).pop(),
                )
              ],
            ),
          )));

  }
}
