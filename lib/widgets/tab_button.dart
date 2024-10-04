import 'package:flutter/material.dart';
import '../../colors.dart';

class TabButton extends StatefulWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onPressed;

  const TabButton({
    Key? key,
    required this.icon,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  @override
  _TabButtonState createState() => _TabButtonState();
}

class _TabButtonState extends State<TabButton> {
  bool _isHovered = false; // Track hover state

  @override
  Widget build(BuildContext context) {
    // Scale factor for the hover effect
    final double scale = _isHovered ? 1.2 : 1.0;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: Transform.scale(
          scale: scale,
          child: IconButton(
            icon: Icon(
              widget.icon,
              size: 24,
              color: _isHovered || widget.isSelected
                  ? AppColors.primary // Change color on hover or if selected
                  : AppColors.accent, // Default color
            ),
            onPressed: widget.onPressed,
            splashColor: Colors.transparent, // Remove splash color
            highlightColor: Colors.transparent, // Remove highlight color
            hoverColor: Colors.transparent, // Remove hover color
          ),
        ),
      ),
    );
  }
}
