import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:imconcept/pages/home/widgets/ArchitectInterieurPage.dart';
import 'package:imconcept/pages/home/widgets/DevisPage.dart';
import 'package:imconcept/pages/home/widgets/ProfilPage.dart';
import 'header.dart'; // Ensure you have this import correctly set up
import 'package:imconcept/pages/home/home.dart';


class RendezVousPage extends StatefulWidget {
  @override
  _RendezVousPageState createState() => _RendezVousPageState();
}

class _RendezVousPageState extends State<RendezVousPage> {
  int _selectedIndex = 2; // Ensure this index corresponds to the current page
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  String _description = '';
  CalendarFormat _calendarFormat = CalendarFormat.month;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to different pages based on the index
    switch (index) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ArchitectInterieurPage(),
          ),
        );
        break;
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DevisPage(),
          ),
        );
        break;
      case 2:
      // Current page
        break;
      case 3:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProfilPage(),
          ),
        );
        break;
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Color(0xFFF4BE36), // Yellow color
              onPrimary: Colors.black, // Text color on the primary color
              onSurface: Colors.black, // Text color on the dialog background
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Color(0xFFF4BE36), // Yellow color
              onPrimary: Colors.black, // Text color on the primary color
              onSurface: Colors.black, // Text color on the dialog background
            ),
          ),
          child: child!,
        );
      },
    );
    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  void _sendRequest() {
    // Add logic to send appointment data
    if (_selectedDate != null && _selectedTime != null && _description.isNotEmpty) {
      final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
      final DateFormat timeFormat = DateFormat('HH:mm');
      final String formattedDate = dateFormat.format(_selectedDate!);
      final String formattedTime = timeFormat.format(DateTime(
        _selectedDate!.year,
        _selectedDate!.month,
        _selectedDate!.day,
        _selectedTime!.hour,
        _selectedTime!.minute,
      ));

      print('Date: $formattedDate');
      print('Time: $formattedTime');
      print('Description: $_description');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Veuillez remplir tous les champs.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 16.0),
          // Expanded content
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFF6F8FF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 29.0),
                    // Agenda
                    Text(
                      'Agenda',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Calendar
                    TableCalendar(
                      focusedDay: _selectedDate ?? DateTime.now(),
                      firstDay: DateTime(2000),
                      lastDay: DateTime(2101),
                      calendarFormat: _calendarFormat,
                      onFormatChanged: (format) {
                        setState(() {
                          _calendarFormat = format;
                        });
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          _selectedDate = selectedDay;
                        });
                      },
                      selectedDayPredicate: (day) {
                        return isSameDay(_selectedDate, day);
                      },
                      calendarStyle: CalendarStyle(
                        selectedDecoration: BoxDecoration(
                          color: Color(0xFFF4BE36), // Yellow color
                          shape: BoxShape.circle,
                        ),
                        todayDecoration: BoxDecoration(
                          color: Color(0xFFB4B2B2), // Another shade of yellow for "Today"
                          shape: BoxShape.circle,
                        ),
                        selectedTextStyle: TextStyle(color: Colors.black),
                        todayTextStyle: TextStyle(color: Colors.black),
                        defaultDecoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        weekendDecoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        defaultTextStyle: TextStyle(color: Colors.black),
                        weekendTextStyle: TextStyle(color: Colors.black),
                      ),
                      daysOfWeekStyle: DaysOfWeekStyle(
                        weekdayStyle: TextStyle(color: Colors.black),
                        weekendStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    GestureDetector(
                      onTap: () => _selectTime(context),
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _selectedTime != null
                                  ? _selectedTime!.format(context)
                                  : 'Choisissez une heure',
                              style: TextStyle(fontSize: 16, color: Colors.black),
                            ),
                            Icon(Icons.access_time),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    // Description
                    Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Entrez une description',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      maxLines: 4,
                      onChanged: (value) {
                        setState(() {
                          _description = value;
                        });
                      },
                    ),
                    const SizedBox(height: 24.0),
                    // Button
                    Center(
                      child: ElevatedButton(
                        onPressed: _sendRequest,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF4BE36),
                          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Envoyer',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
        },
        backgroundColor: const Color(0xFFF4BE36),
        child: const Icon(Icons.home, color: Colors.black),
      ),
      bottomNavigationBar: CurvedNavigationBar(

         items: [
      CurvedNavigationBarItem(
      child: Icon(Icons.work_rounded),
      label: 'Project',
    ),
    CurvedNavigationBarItem(
    child: Icon(Icons.request_quote_rounded),
    label: 'Devis',
    ),
    CurvedNavigationBarItem(
    child: Icon(Icons.event_rounded),
    label: 'Rendez-vous',
    ),
    CurvedNavigationBarItem(
    child: Icon(Icons.person_rounded),
    label: 'Profil',
    ),
    ],
        index: _selectedIndex,
        height: 60.0,
        backgroundColor: const Color(0xFFF4BE36),
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        onTap: _onItemTapped,
      ),
    );
  }
}
