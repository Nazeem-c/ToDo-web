import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/widgets.dart'; // Import the DateButton widget
import '../../colors.dart'; // Import your color constants

class Meeting {
  final String title;
  final String subtitle;
  final String timeStart;
  final String timeEnd;
  bool isDone;

  Meeting({
    required this.title,
    required this.subtitle,
    required this.timeStart,
    required this.timeEnd,
    this.isDone = false,
  });
}

class PlannerScreen extends StatefulWidget {
  @override
  _PlannerScreenState createState() => _PlannerScreenState();
}

class _PlannerScreenState extends State<PlannerScreen> {
  String _activeDate = "Today";

  final List<Meeting> meetings = [
    Meeting(
      title: "Meeting with client",
      subtitle: "John Doe from tarento",
      timeStart: "12.00",
      timeEnd: "14.00",
    ),
    Meeting(
      title: "Project Kickoff",
      subtitle: "Team A",
      timeStart: "15.00",
      timeEnd: "16.00",
    ),
    Meeting(
      title: "Budget Review",
      subtitle: "Finance Team",
      timeStart: "10.00",
      timeEnd: "11.30",
    ),
  ];

  final List<Meeting> meetingsDone = [
    Meeting(
      title: "Team Stand-up",
      subtitle: "Daily check-in with the team",
      timeStart: "09.00",
      timeEnd: "09.30",
      isDone: true,
    ),
  ];

  void _toggleMeeting(int index, {bool isDoneList = false}) {
    setState(() {
      Meeting meeting;
      if (isDoneList) {
        meeting = meetingsDone[index]; // Get the meeting from the done list
        meeting.isDone = false; // Mark it as not done
        meetings.add(meeting); // Move it back to the meetings list
        meetingsDone.removeAt(index); // Remove it from the done list
      } else {
        meeting = meetings[index]; // Get the meeting from the upcoming list
        meeting.isDone = true; // Mark it as done
        meetingsDone.add(meeting); // Move it to the done list
        meetings.removeAt(index); // Remove it from the upcoming list
      }
    });
  }

  // Method to show dialog for adding a new meeting
  void _showAddMeetingDialog() {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController subtitleController = TextEditingController();
    final TextEditingController timeStartController = TextEditingController();
    final TextEditingController timeEndController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(left: 400.0, right: 400.0),
          child: Container(
            width: 300,
            child: Dialog(
              backgroundColor: Colors.white, // Change background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0), // Rounded corners
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add New Meeting',
                      style: GoogleFonts.urbanist(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue, // Custom title color
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        labelText: 'Title',
                        labelStyle: GoogleFonts.urbanist(
                            color: const Color.fromARGB(
                                255, 92, 92, 92)), // Label color
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 109, 109,
                                  109)), // Change this to your desired color
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: BorderSide(
                              color: Colors.blue), // Color when focused
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: BorderSide(
                              color: Colors.blue), // Color when enabled
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: BorderSide(
                              color: Colors.grey), // Color when disabled
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: subtitleController,
                      decoration: InputDecoration(
                        labelText: 'Subtitle',
                        labelStyle: GoogleFonts.urbanist(
                            color: const Color.fromARGB(
                                255, 92, 92, 92)), // Label color
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 109, 109,
                                  109)), // Change this to your desired color
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: BorderSide(
                              color: Colors.blue), // Color when focused
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: BorderSide(
                              color: Colors.blue), // Color when enabled
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: BorderSide(
                              color: Colors.grey), // Color when disabled
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: timeStartController,
                      decoration: InputDecoration(
                        labelText: 'Start Time (HH.MM)',
                        labelStyle: GoogleFonts.urbanist(
                            color: const Color.fromARGB(
                                255, 92, 92, 92)), // Label color
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 109, 109,
                                  109)), // Change this to your desired color
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: BorderSide(
                              color: Colors.blue), // Color when focused
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: BorderSide(
                              color: Colors.blue), // Color when enabled
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: BorderSide(
                              color: Colors.grey), // Color when disabled
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: timeEndController,
                      decoration: InputDecoration(
                        labelText: 'End Time (HH.MM)',
                        labelStyle: GoogleFonts.urbanist(
                            color: const Color.fromARGB(
                                255, 92, 92, 92)), // Label color
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                              color: const Color.fromARGB(255, 109, 109,
                                  109)), // Change this to your desired color
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                              color: Colors.blue), // Color when focused
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide:const BorderSide(
                              color: Colors.blue), // Color when enabled
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                              color: Colors.grey), // Color when disabled
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            // Validate and add the meeting to the list
                            final String title = titleController.text;
                            final String subtitle = subtitleController.text;
                            final String timeStart = timeStartController.text;
                            final String timeEnd = timeEndController.text;

                            if (title.isNotEmpty &&
                                subtitle.isNotEmpty &&
                                timeStart.isNotEmpty &&
                                timeEnd.isNotEmpty) {
                              setState(() {
                                meetings.add(Meeting(
                                  title: title,
                                  subtitle: subtitle,
                                  timeStart: timeStart,
                                  timeEnd: timeEnd,
                                ));
                              });
                            }
                          },
                          child: Text(
                            'Add',
                            style: GoogleFonts.urbanist(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue), // Custom button color
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Cancel',
                            style: GoogleFonts.urbanist(
                                fontWeight: FontWeight.bold,
                                color:
                                    Colors.red), // Custom cancel button color
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    String prevDate =
        DateFormat('dd MMM').format(today.subtract(Duration(days: 1)));
    String nextDate = DateFormat('dd MMM').format(today.add(Duration(days: 1)));
    String currentDate = "Today";

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(48.0),
        color: AppColors.secondaryBackground,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DateButton(
                  date: prevDate,
                  onTap: () => _onDateClicked(prevDate),
                  isActive: _activeDate == prevDate,
                ),
                const SizedBox(width: 8),
                DateButton(
                  date: currentDate,
                  onTap: () => _onDateClicked(currentDate),
                  isActive: _activeDate == currentDate,
                ),
                const SizedBox(width: 8),
                DateButton(
                  date: nextDate,
                  onTap: () => _onDateClicked(nextDate),
                  isActive: _activeDate == nextDate,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const SmallCircle(color: Colors.blue, size: 8.0),
                        const SizedBox(width: 4, height: 4),
                        Text(
                          "Work",
                          style: GoogleFonts.urbanist(
                            fontSize: 20,
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    ...meetings.asMap().entries.map((entry) {
                      int index = entry.key;
                      Meeting meeting = entry.value;
                      return Column(
                        children: [
                          MeetingCard(
                            title: meeting.title,
                            subtitle: meeting.subtitle,
                            timeStart: meeting.timeStart,
                            timeEnd: meeting.timeEnd,
                            tickColor: Colors.blue,
                            tickbgColor:
                                const Color.fromARGB(255, 205, 232, 255),
                            borderColor: Colors.blue,
                            timeColor: Colors.blue,
                            isDone: meeting.isDone,
                            onTick: () => _toggleMeeting(index),
                          ),
                          const SizedBox(height: 16),
                        ],
                      );
                    }).toList(),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Text(
                          "------------------",
                          style: GoogleFonts.urbanist(
                            fontSize: 16,
                            color: const Color.fromARGB(96, 0, 0, 0),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          "Done",
                          style: GoogleFonts.urbanist(
                            fontSize: 16,
                            color: const Color.fromARGB(96, 0, 0, 0),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          "-------------------",
                          style: GoogleFonts.urbanist(
                            fontSize: 16,
                            color: const Color.fromARGB(96, 0, 0, 0),
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    ...meetingsDone.asMap().entries.map((entry) {
                      int index = entry.key;
                      Meeting meeting = entry.value;
                      return Column(
                        children: [
                          MeetingCard(
                            title: meeting.title,
                            subtitle: meeting.subtitle,
                            timeStart: meeting.timeStart,
                            timeEnd: meeting.timeEnd,
                            tickColor: const Color.fromARGB(255, 255, 255, 255),
                            tickbgColor: const Color.fromARGB(255, 94, 197, 97),
                            borderColor: Colors.green,
                            timeColor: Colors.green,
                            isDone: true,
                            backgroundColor:
                                const Color.fromARGB(255, 198, 252, 200),
                            onTick: () =>
                                _toggleMeeting(index, isDoneList: true),
                          ),
                          const SizedBox(height: 16),
                        ],
                      );
                    }).toList(),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: Color.fromARGB(
                                255, 190, 190, 190), // Border color
                            width: 0.0, // Border width
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 24.0),
                        child: Container(
                          width: 330,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Completed :",
                                        style: GoogleFonts.urbanist(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w800),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        "${meetingsDone.length}/${meetings.length + meetingsDone.length}",
                                        style: GoogleFonts.urbanist(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.orange),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.blue,
                                      shape: BoxShape.circle,
                                    ),
                                    child: IconButton(
                                      onPressed: _showAddMeetingDialog,
                                      icon:
                                          Icon(Icons.add, color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Add Task",
                                    style: GoogleFonts.urbanist(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onDateClicked(String date) {
    setState(() {
      _activeDate = date;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('You clicked on $date')),
    );
  }
}
