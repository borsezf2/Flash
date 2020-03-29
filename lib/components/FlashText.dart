import 'dart:async';
import 'dart:math';

import 'package:flash/scoped_models/MainModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:marquee/marquee.dart';
class FlashText extends StatefulWidget {
  @override
  _FlashTextState createState() => _FlashTextState();
}

class _FlashTextState extends State<FlashText> {

  MainModel model ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
//      DeviceOrientation.landscapeRight,
    ]);
    model = ScopedModel.of(context) ;
    Timer(Duration(seconds: 3), () {
      print("Yeah, this line is printed after 3 seconds");
      model.ChangeFlag(1);
    });
  }



  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    model.ChangeFlag(0);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }
  @override
  Widget build(BuildContext context) {


    return ScopedModelDescendant<MainModel>(
        builder: (context1, child, MainModel)
    {
      return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height/1,
          width: MediaQuery.of(context).size.width*2,
          color: MainModel.backgroundColor,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[

              Container(
                child: Center(
                  child: MainModel.flag==0?Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: Text(MainModel.MainFlashText,style: TextStyle(fontSize: 300,color: MainModel.textColor,fontWeight: FontWeight.bold,)),
                  )
                      :
                  Marquee(
                    text: MainModel.MainFlashText,style: TextStyle(fontSize: 300,color: MainModel.textColor,fontWeight: FontWeight.bold,),
                    scrollAxis: Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    blankSpace: 500.0,
                    velocity: 250.0,
                    pauseAfterRound: Duration(milliseconds: 400),
                    startPadding: 100.0,
//                accelerationDuration: Duration(milliseconds: 10),
                    accelerationCurve: Curves.linear,
//                decelerationDuration: Duration(milliseconds: 100),
                    decelerationCurve: Curves.easeOut,
                  ),
                ),
              ),

            ],

          ),
          )

      );
    });
  }
}
