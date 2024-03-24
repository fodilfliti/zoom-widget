import 'package:flutter/material.dart';
import 'package:zoom_widget/zoom_widget.dart';

class InitTotalZoomOut extends StatelessWidget {
  const InitTotalZoomOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Init total zoom'),
      ),
      body: Zoom(
        initTotalZoomOut: false,
        initPosition: Offset(100, 100),
        builder: (BuildContext context, methodFromChild) {},
        child: Center(
          child: FlutterLogo(
            size: 1000,
          ),
        ),
      ),
    );
  }
}
