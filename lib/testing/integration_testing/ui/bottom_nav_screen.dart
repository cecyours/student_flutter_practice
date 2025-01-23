import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maulesh_flutter_practice/testing/integration_testing/ui/profile_screen.dart';
import 'package:maulesh_flutter_practice/testing/integration_testing/ui/setting_screen.dart';
import '../../../topics/firebase/email_auth/homescreen.dart';

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    SettingsScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome To Goa Singham'),
        actions: [
          IconButton(
              key: Key('SettingButton'),
              onPressed: (){
            _onItemTapped(1);
          }, icon: Icon(Icons.settings))
        ],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        activeColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            key: Key('settings'),
            icon: Icon(CupertinoIcons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            key: Key('profileButton'),
            icon: Icon(CupertinoIcons.profile_circled),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}