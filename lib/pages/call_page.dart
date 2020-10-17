import 'dart:ui';

import 'package:agora_group_calling/widgets/app_bar.dart';
import 'package:agora_group_calling/widgets/call_function.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:native_screenshot/native_screenshot.dart';


class CallPage extends StatefulWidget {
  final String channelName;
  final ClientRole role;
  CallPage(this.channelName, this.role);
  @override
  _CallPageState createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
    backgroundColor: Color.fromRGBO(132, 174, 0,0.5),
    title: Text('welcome to '+ widget.channelName),
    elevation: 10,
    leading: CircleAvatar(
      backgroundImage: AssetImage('assets/profile_pic.png'),
        radius: 10,
        backgroundColor: Color.fromRGBO(255, 104, 220, 1),
    ),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.image), 
        onPressed: (){_capturePng();}
      )
    ],
        ),
        body: Stack(
    // fit: StackFit.expand,
    children: <Widget>[
      VideoCall(widget.channelName, widget.role),
      Positioned(
        bottom: 10,
        left: 60,
        child: StatusBar(),
      ),
    ],
        ),
        
      );
  }
  Future<void> _capturePng() async {
    String path = await NativeScreenshot.takeScreenshot();
    print(path);
  }
}