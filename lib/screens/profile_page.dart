import 'package:flutter/material.dart';
import '../constants.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isPrivacyEnabled = false;
  bool _isNotificationsEnabled = true;
  bool _isLocationEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Settings'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: secondary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: primary,
                  child: const Icon(Icons.person, size: 40, color: Colors.white),
                ),
                const SizedBox(width: 16.0),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Name',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'your.email@example.com',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.lock, color: primary),
            title: const Text('Change Password'),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
            onTap: () {
              // Navigate to change password page
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications, color: primary),
            title: const Text('Notifications'),
            trailing: Switch(
              value: _isNotificationsEnabled,
              onChanged: (bool value) {
                setState(() {
                  _isNotificationsEnabled = value;
                });
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.volume_up, color: primary),
            title: const Text('Sounds & Vibration'),
            trailing: Switch(
              value: true,
              onChanged: (bool value) {},
            ),
          ),
          ListTile(
            leading: Icon(Icons.location_on, color: primary),
            title: const Text('Location Access'),
            trailing: Switch(
              value: _isLocationEnabled,
              onChanged: (bool value) {
                setState(() {
                  _isLocationEnabled = value;
                });
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.video_call, color: primary),
            title: const Text('Video Quality'),
            trailing: const Text('High', style: TextStyle(color: Colors.grey)),
            onTap: () {
              // Open video quality settings
            },
          ),
          ListTile(
            leading: Icon(Icons.privacy_tip, color: primary),
            title: const Text('Privacy'),
            trailing: Switch(
              value: _isPrivacyEnabled,
              onChanged: (bool value) {
                setState(() {
                  _isPrivacyEnabled = value;
                });
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.language, color: primary),
            title: const Text('Language'),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
            onTap: () {
              // Navigate to language settings
            },
          ),
          ListTile(
            leading: Icon(Icons.help, color: primary),
            title: const Text('Help & Support'),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
            onTap: () {
              // Navigate to help and support
            },
          ),
          ListTile(
            leading: Icon(Icons.info, color: primary),
            title: const Text('About'),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
            onTap: () {
              // Navigate to about page
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: primary,
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
            child: const Text('Log Out', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
