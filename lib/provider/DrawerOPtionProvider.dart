import 'package:flutter/cupertino.dart';

enum DrawerOption { CONTINOUS_PLAYER, CONDITIONAL_PLAYER }

class DrawerOptionProvider with ChangeNotifier {
  DrawerOption _drawerOption = DrawerOption.CONTINOUS_PLAYER;

  DrawerOption get drawerOption {
    return _drawerOption;
  }

  void updateDrawerOption(DrawerOption drawerOption) {
    _drawerOption = drawerOption;
    notifyListeners();
  }
}
