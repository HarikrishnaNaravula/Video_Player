import 'package:flutter/material.dart';
import 'DrawerOptionWidget.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
 
    return ListView(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        DrawerOptionWidget(
          optionNumber: "1",
          optionName: "Continuous Player",
          ctxt: context,
        ),
        DrawerOptionWidget(
          optionNumber: "2",
          optionName: "Conditional Player",
          ctxt: context,
        ),
      ],
    );
  }
}
