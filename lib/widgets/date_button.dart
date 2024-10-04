import 'package:flutter/material.dart';
import '../../colors.dart';
import 'package:google_fonts/google_fonts.dart';

class DateButton extends StatelessWidget {
  final String date;
  final VoidCallback onTap;
  final bool isActive; // New parameter to determine if the button is active

  const DateButton({
    Key? key,
    required this.date,
    required this.onTap,
    this.isActive = false, // Default value is false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click, // Change mouse cursor to pointer
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), // Padding for each date button
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), // Rounded corners
            // color: isActive ? AppColors.primary.withOpacity(0.2) : Colors.transparent, // Optional: Add background color when active
          ),
          child: Text(
            date,
            style: GoogleFonts.urbanist(
              fontSize: 28, // Adjust size as needed
              color: isActive ? AppColors.primary : Colors.grey, // Change color based on isActive
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal, // Use bold weight
            ),
          ),
        ),
      ),
    );
  }
}
