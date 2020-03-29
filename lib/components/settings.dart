import 'package:flash/scoped_models/MainModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:scoped_model/scoped_model.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {


  Color selectedBg = null;
  Color selectedText = null;
  MainModel model;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     model = ScopedModel.of(context);

  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  showColorSnakebar(){
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: new Text("color changed to ${model.backgroundColor.toString()} + ${model.textColor.toString()}")
    ));
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (context1, child, MainModel)
    {
      print("Height = "+MediaQuery.of(context).size.height.toString());
      return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("FLASH"),
          centerTitle: true,
          backgroundColor: Color(0xfff44336),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)
          )),
        ),
        body: SingleChildScrollView(
          child: MediaQuery.of(context).size.height>750?Long_Main_Widget(context, MainModel):
          Container(
            height: MediaQuery.of(context).size.height*1.3,
//              color: Colors.yellowAccent,
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Positioned(
                      left: 20,
                      top: 20,
                      child: Text("Background Color of Flash", style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),)),
                  Positioned(
                    left: 0,
                    top:  MediaQuery.of(context).size.height/16,
                    child: Container(
//                color: Colors.black38,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height / 2.6,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: MaterialColorPicker(
                          allowShades: false,
                          circleSize: 35,
                          onColorChange: (Color color) {
                            // Handle color changes
                            MainModel.ChangeBgColor(color);
                            setState(() {
                              selectedBg = color ;
                            });
                          },
                          onMainColorChange: (color){
                            setState(() {
                              selectedBg = color ;
                            });
                            MainModel.ChangeBgColor(color);
                            showColorSnakebar();
                          },
                          selectedColor: selectedBg
                      ),
                    ),
                  ),


                  Positioned(
                      left: 20,
                      top:  MediaQuery.of(context).size.height/2.2,
                      child: Text("Text Color", style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),)),
                  Positioned(
                    left: 0,
                    top: MediaQuery.of(context).size.height/2.05,
                    child: Container(
//                color: Colors.black38,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height / 2.6,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: MaterialColorPicker(
                          allowShades: false,
                          circleSize: 35,
                          onColorChange: (Color color) {
                            // Handle color changes
                            MainModel.ChangeTextColor(color);
                            setState(() {
                              selectedText = color ;
                            });
                          },
                          onMainColorChange: (color){
                            setState(() {
                              selectedText = color ;
                            });
                            MainModel.ChangeTextColor(color);
                            showColorSnakebar();
                          },

                          selectedColor: selectedText
                      ),
                    ),
                  ),


                  Positioned(
                      left: 20,
                      top: MediaQuery.of(context).size.height/1.1,
                      child: Text("Defaults Color", style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),)),
                  Positioned(
                    top: MediaQuery.of(context).size.height/1.03,
                    child: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RaisedButton(
                            child: Text("Black and White", style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),),
                            onPressed: () {

                              MainModel.ChangeBgColor(Colors.black);
                              MainModel.ChangeTextColor(Colors.white);
                              showColorSnakebar();
                            },
                            splashColor: Colors.white,
                            elevation: 20,
                            padding: EdgeInsets.only(
                                left: 20, right: 20, top: 20, bottom: 20),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(15))),
                            color: Colors.black,
                          ),
                          RaisedButton(
                            child: Text("White and Black", style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),),
                            onPressed: () {
                              MainModel.ChangeBgColor(Colors.white);
                              MainModel.ChangeTextColor(Colors.black);
                              showColorSnakebar();
                            },
                            splashColor: Colors.black,
                            elevation: 20,
                            padding: EdgeInsets.only(
                                left: 20, right: 20, top: 20, bottom: 20),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(15))),
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),


                  Positioned(
                    top: MediaQuery.of(context).size.height/0.9,
                    left: MediaQuery.of(context).size.width/50,
                    child: RaisedButton(
                      child: Text("💛 Add to Favorite", style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),),
                      onPressed: () {

                        show_addFav(context,MainModel);

                      },
                      onLongPress: (){
                        show_delete(context, MainModel);
                      },
                      splashColor: Colors.yellowAccent,
                      elevation: 20,
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 20, bottom: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(15))),
                      color: Colors.red[800],
                    ),
                  ),


                  Positioned(
                    top: MediaQuery.of(context).size.height/0.9,
                    left: MediaQuery.of(context).size.width/1.7,
                    child: RaisedButton(
                      child: Text("Clear All History", style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),),
                      onPressed: () {

                        MainModel.Delete_All_history();
                        _scaffoldKey.currentState.showSnackBar(new SnackBar(
                            content: new Text("All History cleared")
                        ));
                      },
                      splashColor: Colors.white,
                      elevation: 20,
                      padding: EdgeInsets.only(
                          left: 15, right: 15, top: 22, bottom: 22),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(15))),
                      color: Colors.blue[800],
                    ),
                  ),

                ],
              )
          ),
        ),
      );
    });
  }

  TextEditingController textController = new TextEditingController();


  show_addFav(context,MainModel MainModel){
    showDialog(context: context ,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15))
        ),
        height:MediaQuery.of(context).size.height/4,
        width: MediaQuery.of(context).size.height/1.2,
        child: Material(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20,),

                    Text("Add to Favorite List",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(
                        controller: textController,
                        decoration: InputDecoration(hintText: "Write here"),
                      ),
                    ),
                    SizedBox(height: 10,),
                    RaisedButton(
                      child: Text("❤", style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),),
                      onPressed: () {
                        MainModel.Add_to_fav(textController.text);

                        Navigator.pop(context);
                      },
                      splashColor: Colors.white,
                      elevation: 20,
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 20, bottom: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(15))),
                      color: Colors.blue[100],
                    ),
                  ],
                )
            )
        ),
        margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/8,vertical: MediaQuery.of(context).size.height/3.5),
      ),
    );
  }

  Widget Long_Main_Widget(context,MainModel){
    return Container(
        height: MediaQuery.of(context).size.height,
//              color: Colors.yellowAccent,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
                left: 20,
                top: MediaQuery.of(context).size.height/18,
                child: Text("Background Color of Flash", style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold),)),
            Positioned(
              left: 0,
              top:  MediaQuery.of(context).size.height/12,
              child: Container(
//                color: Colors.black38,
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 2.6,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: MaterialColorPicker(
                    allowShades: false,
                    circleSize: 35,
                    onColorChange: (Color color) {
                      // Handle color changes
                      MainModel.ChangeBgColor(color);
                      setState(() {
                        selectedBg = color ;
                      });
                    },
                    onMainColorChange: (color){
                      setState(() {
                        selectedBg = color ;
                      });
                      MainModel.ChangeBgColor(color);
                      showColorSnakebar();
                    },
                    selectedColor: selectedBg
                ),
              ),
            ),


            Positioned(
                left: 20,
                top:  MediaQuery.of(context).size.height/3.3,
                child: Text("Text Color", style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold),)),
            Positioned(
              left: 0,
              top: MediaQuery.of(context).size.height/3.05,
              child: Container(
//                color: Colors.black38,
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 2.6,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: MaterialColorPicker(
                    allowShades: false,
                    circleSize: 35,
                    onColorChange: (Color color) {
                      // Handle color changes
                      MainModel.ChangeTextColor(color);
                      setState(() {
                        selectedText = color ;
                      });
                    },
                    onMainColorChange: (color){
                      setState(() {
                        selectedText = color ;
                      });
                      MainModel.ChangeTextColor(color);
                      showColorSnakebar();
                    },

                    selectedColor: selectedText
                ),
              ),
            ),


            Positioned(
                left: 20,
                top: MediaQuery.of(context).size.height/1.8,
                child: Text("Defaults Color", style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold),)),
            Positioned(
              top: MediaQuery.of(context).size.height/1.65,
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      child: Text("Black and White", style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),),
                      onPressed: () {

                        MainModel.ChangeBgColor(Colors.black);
                        MainModel.ChangeTextColor(Colors.white);
                        showColorSnakebar();
                      },
                      splashColor: Colors.white,
                      elevation: 20,
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 20, bottom: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(15))),
                      color: Colors.black,
                    ),
                    RaisedButton(
                      child: Text("White and Black", style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),),
                      onPressed: () {
                        MainModel.ChangeBgColor(Colors.white);
                        MainModel.ChangeTextColor(Colors.black);
                        showColorSnakebar();
                      },
                      splashColor: Colors.black,
                      elevation: 20,
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 20, bottom: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(15))),
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),


            Positioned(
              top: MediaQuery.of(context).size.height/1.4,
              left: MediaQuery.of(context).size.width/50,
              child: RaisedButton(
                child: Text("💛 Add to Favorite", style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),),
                onPressed: () {

                  show_addFav(context,MainModel);

                },
                onLongPress: (){
                  show_delete(context, MainModel);
                },
                splashColor: Colors.yellowAccent,
                elevation: 20,
                padding: EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(15))),
                color: Colors.red[800],
              ),
            ),


            Positioned(
              top: MediaQuery.of(context).size.height/1.4,
              left: MediaQuery.of(context).size.width/1.7,
              child: RaisedButton(
                child: Text("Clear All History", style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),),
                onPressed: () {

                  MainModel.Delete_All_history();
                  _scaffoldKey.currentState.showSnackBar(new SnackBar(
                      content: new Text("All History cleared")
                  ));
                },
                splashColor: Colors.white,
                elevation: 20,
                padding: EdgeInsets.only(
                    left: 15, right: 15, top: 22, bottom: 22),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(15))),
                color: Colors.blue[800],
              ),
            ),

          ],
        )
    );
  }
}



show_delete(context,MainModel MainModel){
  showDialog(context: context ,
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15))
      ),
      height: 200,
      width: 300,
      child: Material(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 00,),

                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text("Delete All favorites ?",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                  SizedBox(height: 60),

                  RaisedButton(
                    child: Text("💩", style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),),
                    onPressed: () {

                      MainModel.Delete_All_fav();
                      Navigator.pop(context);
                    },
                    splashColor: Colors.white,
                    elevation: 20,
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 20, bottom: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(15))),
                    color: Colors.blue[100],
                  ),
                ],
              )
          )
      ),
      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/8,vertical: MediaQuery.of(context).size.height/3.5),
    ),
  );
}



