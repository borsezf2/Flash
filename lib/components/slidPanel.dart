import 'package:flash/components/FlashText.dart';
import 'package:flash/components/fastAccess.dart';
import 'package:flash/scoped_models/MainModel.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MySlidPanel extends StatefulWidget {
  @override
  _MySlidPanelState createState() => _MySlidPanelState();
}

class _MySlidPanelState extends State<MySlidPanel> {


  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (context1, child, MainModel)
    {
      return Container(
//      height: MediaQuery.of(context).size.height,
        width: MediaQuery
            .of(context)
            .size
            .width / 1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25),
              topLeft: Radius.circular(25)
          ),
//        color: Colors.blue,
        ),
        child: SlidingUpPanel(
          color: Color(0xfff44336),
          defaultPanelState: PanelState.OPEN,
          controller: MainModel.panelController,
          maxHeight: MediaQuery.of(context).size.height/1.85,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25),
              topLeft: Radius.circular(25)
          ),
          panel: Column(
            children: <Widget>[
              Icon(Icons.linear_scale, size: 30,),
              SizedBox(
//                height: MediaQuery.of(context).size.height/80,
              ),
              Container(
                height: MediaQuery.of(context).size.height/15,
//                 color: Colors.blue,
                child: NavBar(),

              ),
              Container(
                height: MediaQuery.of(context).size.height/2.35,
//                color: Colors.blue,
                child: FastAccess(),
              )
            ],
          ),

          collapsed: CollapseWidget(context),


        ),
      );
    });
  }
}


Widget NavBar(){
  return ScopedModelDescendant<MainModel>(
      builder: (context1, child, MainModel)
  {
    return TabBar(
      controller: MainModel.tabController,
      indicatorColor: Colors.white,
      indicatorWeight: 3,
      onTap: (index) {

        MainModel.ChangePage(index);
      },
      tabs: <Widget>[
        Tab(icon: Icon(Icons.history)),
        Tab(icon: Icon(Icons.favorite)),
      ],
    );
  });

}


Widget CollapseWidget(context){
  return ScopedModelDescendant<MainModel>(
      builder: (context1, child, MainModel)
  {

    if(MainModel.historyBox!=null && MainModel.historyBox.length>1){
      return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            color: Color(0xfff44336),

          ),
          height: MediaQuery
              .of(context)
              .size
              .height / 10,
          padding: EdgeInsets.only(right: 20, left: 10),
          child: Column(
            children: <Widget>[
              Icon(Icons.linear_scale, size: 30),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ItemCard(context,MainModel.historyBox.get(0)['flash'].toString(),MainModel,MainModel.historyBox.length-1),
                  ItemCard(context,MainModel.historyBox.get(1)['flash'].toString(),MainModel,MainModel.historyBox.length-2)
                ],
              ),
            ],
          )

      );
    }else{
      return Center();
    }


  });
}




Widget ItemCard(context,data,MainModel MainModel,index){
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
          height: MediaQuery.of(context).size.height / 14,
          width: MediaQuery.of(context).size.width / 2.5,
          child: Center(child: Text(data,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),))
      ),
    ),

  );
}


