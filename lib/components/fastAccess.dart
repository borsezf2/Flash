import 'package:flash/components/FavPage.dart';
import 'package:flash/components/HistoryPage.dart';
import 'package:flash/scoped_models/MainModel.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class FastAccess extends StatefulWidget {
  @override
  _FastAccessState createState() => _FastAccessState();
}

class _FastAccessState extends State<FastAccess> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (context1, child, MainModel)
    {
      return Container(
        height: MediaQuery.of(context).size.height / 10,
        width: MediaQuery.of(context).size.width / 1,
        color: Colors.white,
        child: TabBarView(
          controller: MainModel.tabController,
          children: <Widget>[
            HistoryPage(),
            FavPage(),
          ],
        ),
      );
    });
  }
}


