import 'package:flutter/material.dart';
import 'package:sih/screens/video_call_screen.dart';

import '../constants.dart';

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

  ContactListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration:  BoxDecoration(
            gradient: LinearGradient(
              colors: [secondary, secondary],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: const Text('Zenith ISL Calls'),

        centerTitle: true,
        actions: [
          IconButton(
            icon:  Icon(Icons.person, color: primary),
            onPressed: () {
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon:  Icon(Icons.search, color: primary),
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
              itemCount: _randomNames.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: ListTile(
                    leading: Container(
                      width: 50.0,
                      height: 50,
                      decoration: BoxDecoration(
                        color:  secondary,
                        borderRadius: const BorderRadius.all( Radius.circular(50.0)),
                        border: Border.all(
                          color:  primary,
                          width: 1.0,
                        ),
                      ),
                    ),

                    title: Text(_randomNames[index]),
                    subtitle: Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: index % 2 == 0 ? Colors.green : Colors.red,
                          size: 12,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          index % 2 == 0 ? 'Online' : 'Offline',
                          style: TextStyle(
                            color: index % 2 == 0 ? Colors.green : Colors.red,
                          ),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon:  Icon(Icons.videocam, color: primary),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => VideoCallPage(name: _randomNames[index],)),
                        );                      },
                    ),
                    onTap: () {
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
