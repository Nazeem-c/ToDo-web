import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../colors.dart';

class MeetingCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String timeStart;
  final String timeEnd;
  final Color tickColor;  
  final Color tickbgColor;      
  final Color borderColor;    
  final Color timeColor; 
  final Color backgroundColor; 
  final bool isDone; // New property
  final VoidCallback onTick; // Callback for tick button

  const MeetingCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.timeStart,
    required this.timeEnd,
    this.tickColor = Colors.blue,
    this.borderColor = Colors.blue,
    this.timeColor = Colors.blue,
    this.backgroundColor = AppColors.background,
    this.tickbgColor = const Color.fromARGB(255, 168, 247, 171),
    this.isDone = false,
    required this.onTick, // Initialize callback
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 300,
          ),
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border(
              left: BorderSide(
                color: borderColor,
                width: 4.0,
              ),
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(2.0),
              bottomLeft: Radius.circular(2.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 8.0, right: 8.0, bottom: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: tickbgColor,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: IconButton(
                    onPressed: onTick, // Call the passed function
                    icon: Icon(
                      isDone ? Icons.check : Icons.check_box_outline_blank,
                      color: tickColor,
                      size: 24,
                    ),
                    tooltip: 'Tick',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.urbanist(
                          fontSize: 16,
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w700,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        subtitle,
                        style: GoogleFonts.urbanist(
                          fontSize: 14,
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Text(
                            "$timeStart -",
                            style: GoogleFonts.urbanist(
                              fontSize: 14,
                              color: timeColor,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            " $timeEnd",
                            style: GoogleFonts.urbanist(
                              fontSize: 14,
                              color: timeColor,
                              fontWeight: FontWeight.w800,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
