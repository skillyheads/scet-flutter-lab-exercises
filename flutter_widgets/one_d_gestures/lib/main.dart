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

  List<String> places = [
    'Jallianwala Bagh, Amritsar',
    'Kaalapani Jail, Andaman',
    'Calcutta (Kolkata)',
    'Varanasi',
    'Tirupati',
    'Haridwar',
    'Rishikesh',
    'Vrindavan',
    'Rameshwaram',
    'Kedarnath',
    'Badrinath',
    'Dwarka',
    'Puri (Jagannath Temple)',
    'Mathura',
    'Ayodhya',
    'Ujjain',
    'Pushkar',
    'Somnath',
    'Madurai (Meenakshi Temple)',
    'Kanchipuram',
    'Chidambaram',
  ];

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

      body: ListView.builder(
        itemCount: places.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("You have tapped on ${places[index]}"),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade300, width: 0.5),
                ),
              ),
              child: Text(
                places[index],
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.left,
              ),
            ),
          );
        },
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
