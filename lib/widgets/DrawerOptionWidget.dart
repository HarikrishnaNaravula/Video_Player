import 'package:flutter/material.dart';
import '../provider/DrawerOPtionProvider.dart';
import 'package:provider/provider.dart';

class DrawerOptionWidget extends StatelessWidget {
  final String optionNumber;
  final String optionName;
  final BuildContext ctxt;
  const DrawerOptionWidget({
    Key key,
    this.optionNumber,
    this.optionName,
    this.ctxt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final provider =  Provider.of<DrawerOptionProvider>(context);
    return ListTile(
      onTap: () {
        if (optionNumber == "1") {
          provider.updateDrawerOption(DrawerOption.CONTINOUS_PLAYER);
          Navigator.pop(ctxt);
        } else if (optionNumber == "2") {
          provider.updateDrawerOption(DrawerOption.CONDITIONAL_PLAYER);
           Navigator.pop(ctxt);
        }
      },
      leading: CircleAvatar(
        child: Center(
          child: Text(
            optionNumber,
          ),
        ),
      ),
      title: Text(
        optionName,
      ),
    );
  }
}
