import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Images')),
        body: Column(
          children: [
            ImageWidget(
              imageUrl: 'assets/images/jwb.jpg',
              height: 200.0,
              width: 300.0,
            ),
            SizedBox(height: 20),
            ImageWidget(
              imageUrl: 'assets/images/kpj.png',
              height: 200.0,
              width: 300.0,
            ),
          ],
        ),
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;

  const ImageWidget({
    Key? key,
    required this.imageUrl,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Image.asset(imageUrl, fit: BoxFit.cover),
    );
  }
}
