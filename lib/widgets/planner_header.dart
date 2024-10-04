import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/widgets.dart';
import '../../colors.dart';

class PlannerHeader extends StatelessWidget {
  final String activeDate;
  final Function(String) onDateChanged;

  const PlannerHeader({
    Key? key,
    required this.activeDate,
    required this.onDateChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    String prevDate = DateFormat('dd MMM').format(today.subtract(Duration(days: 1)));
    String nextDate = DateFormat('dd MMM').format(today.add(Duration(days: 1)));
    String currentDate = "Today";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Planner',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DateButton(
              date: prevDate,
              onTap: () => onDateChanged(prevDate),
              isActive: activeDate == prevDate,
            ),
            const SizedBox(width: 8),
            DateButton(
              date: currentDate,
              onTap: () => onDateChanged(currentDate),
              isActive: activeDate == currentDate,
            ),
            const SizedBox(width: 8),
            DateButton(
              date: nextDate,
              onTap: () => onDateChanged(nextDate),
              isActive: activeDate == nextDate,
            ),
          ],
        ),
      ],
    );
  }
}