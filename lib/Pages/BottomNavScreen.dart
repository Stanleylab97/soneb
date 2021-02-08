import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sonebpay/Pages/BillsScreen.dart';
import 'package:sonebpay/Pages/Panne.dart';
import 'package:sonebpay/Pages/Unpaid.dart';

import 'DashboardScreen.dart';
import 'Settings.dart';

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final List _screens = [
    UnpaidBills(),
    //BillsScreen(),
    DashboardScreen(),
    //PanneDeclaration(),
    Settings()
  ];

  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: [
          Icons.list,
          // Icons.info,
          Icons.home,
          // Icons.bug_report,
          Icons.settings
        ]
            .asMap()
            .map((key, value) => MapEntry(
                  key,
                  BottomNavigationBarItem(
                    title: Text(''),
                    icon: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6.0, horizontal: 16.0),
                      decoration: BoxDecoration(
                        color: _currentIndex == key
                            ? Color.fromRGBO(0, 91, 171, 1)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Icon(value),
                    ),
                  ),
                ))
            .values
            .toList(),
      ),
    );
  }
}
