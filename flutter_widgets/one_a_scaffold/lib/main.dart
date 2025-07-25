import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Incredible India', style: TextStyle(color: Colors.teal)),
        centerTitle: true,
        actions: [Icon(Icons.search)],
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(title: Text('Visit')),
            ListTile(title: Text('Enquire')),
          ],
        ),
      ),

      body: Center(
        child: Text('Gods Own Country', style: TextStyle(fontSize: 20)),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'explore'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'history'),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.bookmark),
      ),
    );
  }
}
