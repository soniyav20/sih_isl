import 'package:flutter/material.dart';
import 'package:sih/screens/notifications_page.dart';
import 'package:sih/screens/video_call_screen.dart';
import 'package:sih/widgets/drawer.dart';

import '../constants.dart';

class ContactListPage extends StatelessWidget {

  ContactListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const HomeDrawer(),
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
        actions: [IconButton(onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  const NotificationsPage()),
          );
        }, icon: const Icon(Icons.notifications))],

        centerTitle: true,
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
              itemCount: names.length,
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

                    title: Text(names[index]),
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
                          MaterialPageRoute(builder: (context) => VideoCallPage(name: names[index],)),
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
