import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notification_app/notification_item.dart';

class App_Notification extends StatefulWidget {
  @override
  _App_NotificationState createState() => _App_NotificationState();
}

class _App_NotificationState extends State<App_Notification> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text("Notification"),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Container(
          child: ListView.builder(itemBuilder: (context,index){
            return Container(
              child: NotificationItem(),
            );
          },
          itemCount: 10,),

        ),
      ),
    );
  }
}
