import 'package:flash/components/FlashText.dart';
import 'package:flash/scoped_models/MainModel.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (context1, child, MainModel)
    {
      return Container(
          color: Color(0xfff44336),
          child: ListView.builder(
            itemCount: MainModel.historyBox==null?0:MainModel.historyBox.length,
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),

//            reverse: true,
            itemBuilder: (context, index) {
              index = MainModel.historyBox.length -1- index ;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: MainModel.historyBox.get(index)==null?null:ItemCard(context,MainModel.historyBox.get(index)['flash'].toString(),MainModel,index),
              );
            },

          )

      );
    });
  }


  Widget ItemCard(context,data,MainModel MainModel,index){
    print("index history = "+index.toString());

    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
      color: Color(0xff263238),
      child: InkWell(
        splashColor: Colors.yellowAccent,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        onTap: (){
          print("random text tapped");
          MainModel.MainFlashTextChange(data);
          Navigator.push(context, MaterialPageRoute(builder: (context)=>FlashText()));
        },


        child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Colors.transparent
            ),
            height: MediaQuery.of(context).size.height / 10,
            width: MediaQuery.of(context).size.width / 2,
            child: Center(child: Text(data,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),))
        ),
      ),

    );
  }


}


