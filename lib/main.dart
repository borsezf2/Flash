import 'package:flash/components/inputText.dart';
import 'package:flash/components/settings.dart';
import 'package:flash/components/slidPanel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'scoped_models/MainModel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async{


  runApp(MyApp());
}

class MyApp extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: MainModel(),
      child: MaterialApp(
        title: 'Flash',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  MainModel model ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    model = ScopedModel.of(context) ;
    model.initiateHive().then((value) => model.openBoxHive());
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xff263238),
      appBar: AppBar(
        title: Text("FLASH"),
        centerTitle: true,
        backgroundColor: Color(0xfff44336),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.settings),
              padding: EdgeInsets.only(right: 15),
              onPressed:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsPage()));
              }
          )
        ],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30)
        )),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              left: MediaQuery.of(context).size.width/22,
               top: MediaQuery.of(context).size.height/20,
                child: InputText()),
            Positioned(
                left: MediaQuery.of(context).size.width/3.8,
                top: MediaQuery.of(context).size.height/5,
                child: FlashButton(context)),
            Positioned(
                bottom: 0,
                child: MySlidPanel()),

          ],
        ),
      )
      );
  }
}
