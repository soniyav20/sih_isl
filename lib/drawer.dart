import 'package:flutter/material.dart';
import 'package:sih/learn_pronunciation.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
     Drawer(
    child: ListView(
    padding: EdgeInsets.zero,
    children: <Widget>[
    DrawerHeader(
    decoration: BoxDecoration(
    color: Color(0xFFA28F2D),
    ),
    child: Text(
    'Zenith ISL',
    style: TextStyle(
    color: Colors.white,
    fontSize: 24,
    ),
    ),
    ),
    ListTile(
    leading: Icon(Icons.book),
    title: Text('Learn Pronunciation'),
    onTap: () {
// Navigate to Learn Pronunciation Page
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => LearnPronunciationPage()),
    );
    },
    ),
// Add more options here if needed
    ],
    ),
    )
    ;
  }
}
