// sidebar.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../colors.dart';
import '../widgets/widgets.dart';

class Sidebar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;

  const Sidebar({
    Key? key,
    required this.selectedIndex,
    required this.onTabSelected,
  }) : super(key: key);

  String _getCurrentTime() {
    final DateTime now = DateTime.now();
    return DateFormat('HH:mm').format(now);
  }

  String _getCurrentDate() {
    final DateTime now = DateTime.now();
    return DateFormat('d MMM').format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      color: AppColors.background,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Image.asset(
              'assets/logo.png',
              width: 35,
              height: 35,
            ),
          ),
          const SizedBox(height: 20),
          const Spacer(),
          // Generate TabButtons using the tabs map
          ...List.generate(3, (index) {
            return TabButton(
              icon: _getTabIcon(index),
              isSelected: selectedIndex == index,
              onPressed: () => onTabSelected(index),
            );
          }),
          const Spacer(),
          // Current time and date at the bottom
          Padding(
            padding: const EdgeInsets.only(bottom: 32.0),
            child: Column(
              children: [
                Text(
                  _getCurrentTime(),
                  style: GoogleFonts.urbanist(
                    fontSize: 22,
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  _getCurrentDate(),
                  style: GoogleFonts.urbanist(
                    fontSize: 16,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  IconData _getTabIcon(int index) {
    switch (index) {
      case 0:
        return Icons.calendar_today;
      case 1:
        return Icons.list;
      case 2:
        return Icons.settings;
      default:
        return Icons.error; // Default icon
    }
  }
}
