// screen_home.dart
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import 'screens.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  int _selectedIndex = 0;

  final List<Widget> _tabs = [
    PlannerScreen(),
    ListScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Sidebar(
            selectedIndex: _selectedIndex,
            onTabSelected: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          MainContent(content: _tabs[_selectedIndex]),
        ],
      ),
    );
  }
}
