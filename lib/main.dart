import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'provider/DrawerOPtionProvider.dart';
import './screens/VideoPlayerOptions.dart';

void main() {
 WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_){  runApp(
    CustomVideoPlayer(),
  );
});}

class CustomVideoPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctxt) => DrawerOptionProvider(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
        home: VideoPlayerOptions(),
      ),
    );
  }
}
