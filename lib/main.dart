import 'package:flutter/material.dart';

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
      home: ContactListPage(),
    );
  }
}

class ContactListPage extends StatelessWidget {
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
        title: Text('Video Call'),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/profile.jpg'), // Dummy profile image
            ),
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
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/contact.jpg'), // Dummy contact image
                    ),
                    title: Text('Contact Name $index'), // Replace with contact's name
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
                        // Initiate video call
                      },
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
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'call',
            backgroundColor: Color(0xFFA28F2D),
            child: Icon(Icons.video_call, color: Colors.white),
            onPressed: () {
              // Initiate a new video call
            },
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            heroTag: 'options',
            backgroundColor: Color(0xFFA28F2D),
            child: Icon(Icons.more_horiz, color: Colors.white),
            onPressed: () {
              // Open additional options (e.g., Settings)
            },
          ),
        ],
      ),
    );
  }
}
