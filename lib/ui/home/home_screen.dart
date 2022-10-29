import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
          appBar: AppBar(
            title: Text("Test Demo"),
            actions: [],
          ),
          body: SizedBox(
            height: 100.0.h,
            width: 100.0.w,
          )),
    );
  }
}
