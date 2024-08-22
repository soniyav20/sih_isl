import 'package:flutter/material.dart';
import 'package:sih/drawer.dart';
import 'package:sih/main.dart';

void main() => runApp(MyApp());


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // List of pages corresponding to each bottom navigation item
  final List<Widget> _pages = [
    FirstPage(),
    SecondPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(),

      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFFF7CF), Color(0xFFFFF7CF)], // Using the same color for a subtle effect
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Text('Zenith ISL'),

        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: Color(0xFFA28F2D)),
            onPressed: () {
              // Open additional options (e.g., Settings)
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ContactListPage()),
          );
        },
        child: Icon(Icons.video_call,color: Colors.white,),
      ),
    );
  }
}

// First page
class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Home Page Content',
        style: TextStyle(fontSize: 24, color: Color(0xFFA28F2D)),
      ),
    );
  }
}

// Second page
class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Settings Page Content',
        style: TextStyle(fontSize: 24, color: Color(0xFFA28F2D)),
      ),
    );
  }
}
