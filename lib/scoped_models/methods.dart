import 'dart:math';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
mixin Methods on Model {

  PanelController panelController = new PanelController();
  TabController tabController = new TabController(length: 2,vsync: AnimatedListState());
  int selectedIndex = 0;
  String MainFlashText = "initial";

  Color backgroundColor = Colors.white ;
  Color textColor = Colors.black;




  ChangePage(index){
    selectedIndex = index;
    tabController.animateTo(index,duration: Duration(milliseconds: 100), curve: Cubic(1, 1, 1, 1));
    notifyListeners();
  }

  double PI = pi ;
  RotatePi(){
    PI = -PI;
    notifyListeners();
  }

  MainFlashTextChange(String text){
    MainFlashText = text.replaceAll(" ", "  ");
    notifyListeners();
  }


  ChangeBgColor(Color newColor){
    backgroundColor = newColor;
    notifyListeners();
  }

  ChangeTextColor(Color newColor){
    textColor = newColor;
    notifyListeners();
  }

  int flag = 0;
  ChangeFlag(f){
    flag = f;
    notifyListeners();
  }


  //**********************************************************************

  Box historyBox ;
  Box favBox ;

  Future initiateHive()async{
    final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
  }

  openBoxHive()async{

     historyBox = await Hive.openBox('history');
     favBox = await Hive.openBox('fav');

     notifyListeners();

     for(int i=0;i<historyBox.length;i++){
       print("Hive history at ${i}= "+ historyBox.get(i).toString());

     }
  }

  Add_to_history(String data)async{

    await historyBox.add(
        {"flash":data}
        ).then((value) {
          print(" value added to history = "+value.toString());
          notifyListeners();
    });


  }

  Add_to_fav(String data)async{

    await favBox.add(
        {"flash":data}
    ).then((value) {
      print(" value added to fav = "+value.toString());
      notifyListeners();
    });


  }



  Delete_All_history()async{

    await historyBox.clear().then((value) => notifyListeners());

  }

  Delete_All_fav()async{

    await favBox.clear().then((value) => notifyListeners());

  }

}
