import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';

class YourOnRingCallBack extends StatefulWidget {
  const YourOnRingCallBack({super.key});

  @override
  State<YourOnRingCallBack> createState() => _YourOnRingCallBackState();
}

class _YourOnRingCallBackState extends State<YourOnRingCallBack> {
  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
        onWillPop: () async {

      return false;
    },
      child: Scaffold(
        body: InkWell(
          onTap: ()
          async {
            await Alarm.stop(42);
            Navigator.pop(context);

          },
          child: const Center(
            child: Text("check alarm "),
          ),
        ),
      ),
    );
  }
}
