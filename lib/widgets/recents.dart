import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class RecentActivities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.call, color: primary),
          title: Text('Video Call with John Doe'),
          subtitle: Text('Today, 10:30 AM'),
        ),
        ListTile(
          leading: Icon(Icons.message, color: primary),
          title: Text('Call from Jane Smith'),
          subtitle: Text('Yesterday, 4:15 PM'),
        ),
        ListTile(
          leading: Icon(Icons.notification_important, color: primary),
          title: Text('Alert: Baby Crying'),
          subtitle: Text('2 days ago, 9:00 AM'),
        ),
      ],
    );
  }
}

class FavoriteContacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(3, (index) {
        return Column(
          children: [
            CircleAvatar(
              backgroundColor: secondary,
              child: Icon(Icons.person, color: primary),
            ),
            SizedBox(height: 8),
            Text(
              'Contact $index',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: primary,
              ),
            ),
          ],
        );
      }),
    );
  }
}
