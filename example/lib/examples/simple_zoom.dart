import 'package:flutter/material.dart';
import 'package:zoom_widget/zoom_widget.dart';

class SimpleZoom extends StatelessWidget {
  SimpleZoom({Key? key}) : super(key: key);
  late void Function(Offset offset) myMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom zoom'),
      ),
      body: Stack(
        children: [
          Zoom(
              builder: (BuildContext context, methodFromChild) {
                myMethod = methodFromChild;
              },
              maxZoomHeight: 3000,
              maxZoomWidth: 3000,
              initPosition: Offset(200, 200),
              child: Center(
                child: Text('Happy zoom!'),
              )),
          Positioned(
              bottom: 200,
              right: 100,
              child: GestureDetector(
                onTap: () {
                  myMethod(Offset(-200, -200));
                },
                child: Container(
                  color: Colors.black,
                  padding: EdgeInsets.all(8),
                  child: Icon(
                    Icons.center_focus_strong,
                    color: Colors.white,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
