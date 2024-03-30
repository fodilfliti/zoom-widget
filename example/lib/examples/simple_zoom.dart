import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:zoom_widget/zoom_widget.dart';

class SimpleZoom extends StatefulWidget {
  SimpleZoom({Key? key}) : super(key: key);

  @override
  State<SimpleZoom> createState() => _SimpleZoomState();
}

class _SimpleZoomState extends State<SimpleZoom> {
  late void Function(Offset offset, {bool forceInitZoom, double? scale})
      myMethod;
  double x = 0;
  double y = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('simple zoom'),
      ),
      body: Stack(
        children: [
          Zoom(
              builder: (BuildContext context, methodFromChild) {
                myMethod = methodFromChild;
              },
              onPositionUpdate: (p0) {
                setState(() {
                  x = p0.dx;
                  y = p0.dy;
                });
              },
              maxZoomHeight: 3000,
              maxZoomWidth: 3000,
              initPosition: Offset(
                200,
                200,
              ),
              child: Center(
                child: Text('Happy zoom!'),
              )),
          Positioned(
              bottom: 20,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  myMethod(
                    Offset(
                      -1420,
                      -1420,
                    ),
                    //forceInitZoom: true,
                  );
                },
                child: Container(
                  color: Colors.black,
                  padding: EdgeInsets.all(8),
                  child: Icon(
                    Icons.golf_course,
                    color: Colors.white,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
