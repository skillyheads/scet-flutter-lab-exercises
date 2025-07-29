import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Container Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AnimatedContainerDemo(),
    );
  }
}

class AnimatedContainerDemo extends StatefulWidget {
  const AnimatedContainerDemo({super.key});

  @override
  _AnimatedContainerDemoState createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  double _width = 100;
  double _height = 100;
  Color _color = Colors.blue;
  BorderRadius _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated Container')),
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          decoration: BoxDecoration(color: _color, borderRadius: _borderRadius),
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _width = _width == 100 ? 200 : 100;
            _height = _height == 100 ? 200 : 100;
            _color = _color == Colors.blue ? Colors.red : Colors.blue;
            _borderRadius = _borderRadius == BorderRadius.circular(8)
                ? BorderRadius.circular(50)
                : BorderRadius.circular(8);
          });
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
