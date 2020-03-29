import 'package:flash/components/FlashText.dart';
import 'package:flutter/material.dart';
import 'package:flash/scoped_models/MainModel.dart';
import 'package:scoped_model/scoped_model.dart';


class InputText extends StatefulWidget {
  @override
  _InputTextState createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {




  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (context1, child, MainModel)
    {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xfff44336),
        ),
        height: MediaQuery.of(context).size.height / 10,
        width: MediaQuery.of(context).size.width / 1.1,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 8, bottom: 8, right: 15, left: 15),
            child: TextField(
              controller: textController,
              onTap: (){
                print("text field tapped");
                MainModel.panelController.close();
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.white)
                  ),
                  labelText: "Input FLASH",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.white, width: 1.5)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.black, width: 1.5)
                  ),
                  labelStyle: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15)
              ),
              style: TextStyle(fontSize: 20, color: Colors.white),
              cursorColor: Colors.white,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    });
  }



}
TextEditingController textController = new TextEditingController();

Widget FlashButton(context){
  return ScopedModelDescendant<MainModel>(
      builder: (context1, child, MainModel)
      {
        return RaisedButton(
            color: Color(0xfff44336),
            child: Text("FLASH", style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15),),
            splashColor: Colors.yellowAccent,
            padding: EdgeInsets.only(left: 70, right: 70, bottom: 20, top: 20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))
            ),
            onPressed: () {
              print("flash pressed");
              MainModel.MainFlashTextChange(textController.text);
              MainModel.Add_to_history(textController.text);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>FlashText()));
            }
        );
      });
}