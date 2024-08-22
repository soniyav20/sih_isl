import 'package:flutter/material.dart';
import 'package:sih/constants.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back_outlined,color: Colors.white,),onPressed: (){Navigator.pop(context);},),
        title: const Text('Notifications',style: TextStyle(color: Colors.white),),
        backgroundColor: primary,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            NotificationTile(
              icon: Icons.notifications,
              title: 'Baby Crying Alert',
              description: 'Alert: Baby is crying. Please check immediately.',
              time: '5 minutes ago',
            ),
            NotificationTile(
              icon: Icons.fireplace,
              title: 'Fire Accident Alert',
              description: 'Alert: Possible fire detected. Evacuate immediately.',
              time: '10 minutes ago',
            ),
            NotificationTile(
              icon: Icons.phone_in_talk,
              title: 'Recognized Voice Alert',
              description: 'Alert: A recognized voice has been detected.',
              time: '20 minutes ago',
            ),
            NotificationTile(
              icon: Icons.error,
              title: 'System Error',
              description: 'Alert: There was an error with the system.',
              time: '30 minutes ago',
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String time;

  const NotificationTile({super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 2,

      child: ListTile(

        leading: Icon(
          icon,
          color: primary,
          size: 40,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: primary,
          ),
        ),
        subtitle: Text(description),
        trailing: Text(
          time,
          style: TextStyle(
            color: Colors.grey[600],
          ),
        ),
      ),
    );
  }
}
