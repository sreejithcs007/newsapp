import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tasknews/core/constants/animationconstant.dart';

import '../categoryscreen/view/newsview.dart';

class StartingPage extends StatefulWidget{
  @override
  State<StartingPage> createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {

  @override
  void initState() {
   Timer(Duration(seconds: 5), () {
     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>NewsView()), (route) => false);
   });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(AnimationConstant.animation),
      ),
    );
  }
}