import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Names List App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: NamesListScreen(),
    );
  }
}

class NamesListScreen extends StatefulWidget {
  @override
  _NamesListScreenState createState() => _NamesListScreenState();
}

class _NamesListScreenState extends State<NamesListScreen> {
  bool _isListVisible = false;

  final List<String> _names = [
    'Alice Johnson',
    'Bob Smith',
    'Charlie Brown',
    'Diana Prince',
    'Edward Norton',
    'Fiona Green',
    'George Wilson',
    'Hannah Davis',
    'Ian Miller',
    'Julia Roberts',
  ];

  void _showList() {
    setState(() {
      _isListVisible = true;
    });
  }

  void _hideList() {
    setState(() {
      _isListVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Names List')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  key: Key('show_button'),
                  onPressed: _showList,
                  child: Text('Show Names'),
                ),
                ElevatedButton(
                  key: Key('hide_button'),
                  onPressed: _hideList,
                  child: Text('Hide Names'),
                ),
              ],
            ),
            SizedBox(height: 20),
            if (_isListVisible)
              Expanded(
                child: ListView.builder(
                  key: Key('names_list'),
                  itemCount: _names.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 4),
                      child: ListTile(
                        leading: CircleAvatar(child: Text('${index + 1}')),
                        title: Text(_names[index]),
                        subtitle: Text('Person ${index + 1}'),
                      ),
                    );
                  },
                ),
              ),
            if (!_isListVisible)
              Expanded(
                child: Center(
                  child: Text(
                    'Click "Show Names" to display the list',
                    key: Key('empty_message'),
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
