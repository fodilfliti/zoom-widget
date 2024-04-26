import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:zoom_widget/zoom_widget.dart';

class SimpleZoom extends StatefulWidget {
  SimpleZoom({Key? key}) : super(key: key);

  @override
  State<SimpleZoom> createState() => _SimpleZoomState();
}

class _SimpleZoomState extends State<SimpleZoom> {
  late void Function(Offset offset,
      {bool forceInitZoom,
      double? scale,
      bool? useReferenceFocalPoint,
      bool? skipInit}) myMethod;
  double x = 0;
  double y = 0;
  double scale = 0;
  double x2 = 0;
  double y2 = 0;
  double scale2 = 0;

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
              onScaleUpdate: (p0, p1) => scale = p1,
              maxZoomHeight: 3000,
              maxZoomWidth: 3000,
              initPosition: Offset(
                200,
                200,
              ),
              child: Center(
                child: Text(
                  'Happy zoom!',
                  style: TextStyle(fontSize: 60),
                ),
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
          Positioned(
              bottom: 150,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  x2 = x;
                  y2 = y;
                  scale2 = scale;
                },
                child: Container(
                  color: Colors.black,
                  padding: EdgeInsets.all(8),
                  child: Icon(
                    Icons.save,
                    color: Colors.white,
                  ),
                ),
              )),
          Positioned(
              bottom: 80,
              right: 20,
              child: GestureDetector(
                onTap: () async {
                  myMethod(
                    Offset(
                      0,
                      0,
                    ),
                    scale: scale2,
                    forceInitZoom: true,
                  );
                  await Future.delayed(Durations.medium1);
                  myMethod(
                      Offset(
                        x2,
                        y2,
                      ),
                      // scale: scale2,
                      forceInitZoom: false,
                      skipInit: true,
                      useReferenceFocalPoint: true);
                },
                child: Container(
                  color: Colors.black,
                  padding: EdgeInsets.all(8),
                  child: Icon(
                    Icons.map,
                    color: Colors.white,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
