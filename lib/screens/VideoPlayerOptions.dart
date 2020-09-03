import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/conditionalVideoPLayerWidget.dart';
import '../widgets/DrawerWidget.dart';
import '../provider/DrawerOPtionProvider.dart';
import '../widgets/continousPlayerWidget.dart';

class VideoPlayerOptions extends StatefulWidget {
  @override
  _VideoPlayerOptionsState createState() => _VideoPlayerOptionsState();
}

class _VideoPlayerOptionsState extends State<VideoPlayerOptions> {
  DrawerOption drawerOption;

  Widget videoPlayerWidget(DrawerOption _drawerOption) {
    Widget videoPlayerWidget;
    if (_drawerOption == DrawerOption.CONTINOUS_PLAYER) {
      videoPlayerWidget = ContinuousVideoPlayer();
    } else   if (_drawerOption == DrawerOption.CONDITIONAL_PLAYER) {
      videoPlayerWidget = ConditionalVideoPLayerWidget();
    }else {
      
      videoPlayerWidget = Container();

    }
    return videoPlayerWidget;
  }

  @override
  Widget build(BuildContext context) {
    drawerOption = Provider.of<DrawerOptionProvider>(context).drawerOption;
    return Scaffold(
      drawer: Drawer(
        child: DrawerWidget(),
      ),
      appBar: AppBar(
        title: Text("Video Player"),
      ),
      body: videoPlayerWidget(drawerOption),
    );
  }
}
