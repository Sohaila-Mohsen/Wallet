import 'dart:async';

import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:wallet/views/get_start.dart';
import 'package:wallet/views/history_page.dart';

import '../sp_helper/cache_helper.dart';



class SplachScreen extends StatefulWidget {
  @override
  _SplachScreenState createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {

  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Center(child: Lottie.asset("assets/lottie/total.json"),),
      ),

    );
  }

  startTime() async {
    var duration = new Duration(seconds: 10);
    return new Timer(duration, route);
  }

  route() {
    var isFirst = SharedPreferencesHelper.getData(key: 'isFirst');
    if (isFirst == null)
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> GetStart()), (route) => false);
    else
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> HistoryPage()), (route) => false);
  }


}