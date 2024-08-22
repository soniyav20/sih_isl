import 'package:flutter/material.dart';
import 'package:sih/constants.dart';
import 'package:sih/screens/contacts_list_page.dart';
import 'package:sih/screens/home_page.dart';
import 'package:sih/screens/profile_page.dart';
import 'package:sih/widgets/nav_bar_item.dart';



class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
      HomePage(),
     ContactListPage(),
    const ProfilePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: secondary,
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: CustomBottomNavBarItem(
              icon: Icons.home,
              isSelected: _selectedIndex == 0,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: CustomBottomNavBarItem(
              icon: Icons.video_call_sharp,
              isSelected: _selectedIndex == 1,
            ),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: CustomBottomNavBarItem(
              icon: Icons.person,
              isSelected: _selectedIndex == 2,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),


    );
  }
}



