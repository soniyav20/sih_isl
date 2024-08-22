import 'package:flutter/material.dart';
import 'package:sih/constants.dart';
import 'package:sih/screens/learn_pronunciation.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return 
     Drawer(
    child: ListView(
    padding: EdgeInsets.zero,
    children: <Widget>[
     DrawerHeader(
    decoration: BoxDecoration(
    color: primary,
    ),
    child: const Text(
    'Zenith ISL',
    style: TextStyle(
    color: Colors.white,
    fontSize: 24,
    ),
    ),
    ),
    ListTile(
    leading: const Icon(Icons.book),
    title: const Text('Learn Pronunciation'),
    onTap: () {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const LearnPronunciationPage()),
    );
    },
    ),

    ],
    ),
    )
    ;
  }
}
