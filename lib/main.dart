import 'package:flutter/material.dart';
import 'package:sih/drawer.dart';
import 'package:sih/home_page.dart';
import 'package:sih/the_webm.dart';
import 'package:sih/video_call_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xFFA28F2D), // Primary color for the theme
        scaffoldBackgroundColor: Colors.white, // Background color for the app
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white, // Light theme for AppBar
          elevation: 0,
          iconTheme: IconThemeData(color: Color(0xFFA28F2D)),
          titleTextStyle: TextStyle(
            color: Color(0xFFA28F2D),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color(0xFFA28F2D),
        ),
      ),
      home: HomePage(),
    );
  }
}

class ContactListPage extends StatelessWidget {
  final List<String> _randomNames = [
    "Alice",
    "Bob",
    "Charlie",
    "David",
    "Eve",
    "Frank",
    "Grace",
    "Hannah",
    "Ivy",
    "Jack",
    "Kara",
    "Leo",
    "Mona",
    "Nina",
    "Oscar",
    "Paul",
    "Quincy",
    "Rita",
    "Steve",
    "Tina",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text('Zenith ISL Calls'),

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
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Color(0xFFA28F2D)),
                hintText: 'Search Contacts',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          // Contact List
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Replace with actual number of contacts
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: ListTile(
                    leading: Container(
                      width: 50.0,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF7CF),

                        borderRadius: BorderRadius.all( Radius.circular(50.0)),
                        border: Border.all(
                          color: Color(0xFFA28F2D),
                          width: 1.0,
                        ),
                      ),
                    ),

                      title: Text(_randomNames[index]), // Replace with contact's name
                    subtitle: Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: index % 2 == 0 ? Colors.green : Colors.red,
                          size: 12,
                        ),
                        SizedBox(width: 4),
                        Text(
                          index % 2 == 0 ? 'Online' : 'Offline',
                          style: TextStyle(
                            color: index % 2 == 0 ? Colors.green : Colors.red,
                          ),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.videocam, color: Color(0xFFA28F2D)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => VideoCallPage(name: _randomNames[index],)),
                        );                      },
                    ),
                    onTap: () {
                      // Navigate to contact details or call screen
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),

    );
  }
}
