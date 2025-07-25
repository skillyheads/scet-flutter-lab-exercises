import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      routes: {'/image_detail': (context) => ImageDetailScreen()},
    );
  }
}

class ImageWidget extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double width;
  const ImageWidget({
    Key? key,
    required this.imageUrl,
    this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return this.height != null
        ? Container(
            height: height,
            width: width,
            child: Image.asset(imageUrl, fit: BoxFit.cover),
          )
        : Container(
            width: width,
            child: Image.asset(imageUrl, fit: BoxFit.cover),
          );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  List<String> places = [
    'assets/images/image1.webp',
    'assets/images/image2.webp',
    'assets/images/image3.webp',
    'assets/images/image4.jpg',
    'assets/images/image5.jpg',
    'assets/images/image6.jpg',
    'assets/images/image7.jpg',
    'assets/images/image8.jpg',
    'assets/images/image9.jpg',
    'assets/images/image10.jpg',
    'assets/images/image11.jpg',
    'assets/images/image12.jpg',
    'assets/images/image13.jpg',
    'assets/images/image14.jpg',
    'assets/images/image15.jpg',
    'assets/images/image16.jpg',
    'assets/images/image17.jpg',
    'assets/images/image18.jpg',
    'assets/images/image19.jpg',
    'assets/images/image20.jpg',
  ];

  int getColumnCount(double width) {
    if (width > 750) {
      return 4; // Large screens
    } else if (width > 680) {
      return 3; // Medium screens
    } else {
      return 2; // Mobile screens
    }
  }

  bool isMobileScreen(double width) {
    return width <= 680;
  }

  void showImageDetail(String imagePath) {
    double screenWidth = MediaQuery.of(context).size.width;

    if (isMobileScreen(screenWidth)) {
      // Navigate to new screen on mobile
      Navigator.pushNamed(context, '/image_detail', arguments: imagePath);
    } else {
      // Show in dialog on larger screens
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: Stack(
              children: [
                Center(
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.8,
                      maxHeight: MediaQuery.of(context).size.height * 0.8,
                    ),
                    child: ImageWidget(
                      imageUrl: imagePath,
                      width: MediaQuery.of(context).size.width * 0.8,
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 20,
                  child: CircleAvatar(
                    backgroundColor: Colors.black54,
                    child: IconButton(
                      icon: Icon(Icons.close, color: Colors.white),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int columnCount = getColumnCount(screenWidth);

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
      body: GridView.builder(
        padding: EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columnCount,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: places.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => showImageDetail(places[index]),
            child: ImageWidget(
              imageUrl: places[index],
              height: 120,
              width: 120,
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

class ImageDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String imagePath =
        ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: Text('Image View')),
      body: Center(
        child: ImageWidget(
          imageUrl: imagePath,
          width: MediaQuery.of(context).size.width * 0.8,
        ),
      ),
    );
  }
}
