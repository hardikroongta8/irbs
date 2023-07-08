import 'package:flutter/material.dart';
import 'package:irbs/src/widgets/bookinghistory/booking_tile.dart';

import '../globals/colors.dart';
import '../globals/styles.dart';

class BookingHistory extends StatefulWidget {
  const BookingHistory({Key? key}) : super(key: key);

  @override
  State<BookingHistory> createState() => _BookingHistoryState();
}

class _BookingHistoryState extends State<BookingHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themes.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'IRBS',
          style: appBarStyle,
        ),
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/irbs/onboarding');
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 11.0),
                child: Image.asset(
                  'assets/question_circle.png',
                  package: 'irbs',
                  height: 24,
                  width: 24,
                ),
              ))
        ],
        backgroundColor: Themes.tileColor,
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16, 20, 16, 10),
              child: Text(
                'Booking History',
                style: TextStyle(
                    package: 'irbs',
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: Themes.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Text(
                'Current Bookings',
                style: roomTypeStyle,
              ),
            ),
            BookingTile(
              current: true,
              startTime: '8:00 AM',
              roomName: 'Coding Club Room',
              endTime: '9:00PM',
              date: '21st April',
              status: 0,
            ),
            BookingTile(
              current: true,
              startTime: '8:00 AM',
              roomName: 'Coding Club Room',
              endTime: '9:00PM',
              date: '21st April',
              status: 2,
            ),
            BookingTile(
              current: true,
              startTime: '8:00 AM',
              roomName: 'Coding Club Room',
              endTime: '9:00PM',
              date: '21st April',
              status: 1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Text(
                'Past Bookings',
                style: roomTypeStyle,
              ),
            ),
            BookingTile(
              current: false,
              startTime: '8:00 AM',
              roomName: 'Coding Club Room',
              endTime: '9:00PM',
              date: '21st April',
              status: 1,
            ),
            BookingTile(
              current: false,
              startTime: '8:00 AM',
              roomName: 'Coding Club Room',
              endTime: '9:00PM',
              date: '21st April',
              status: 2,
            ),
            BookingTile(
              current: false,
              startTime: '8:00 AM',
              roomName: 'Coding Club Room',
              endTime: '9:00PM',
              date: '21st April',
              status: 1,
            ),
            BookingTile(
              current: false,
              startTime: '8:00 AM',
              roomName: 'Coding Club Room',
              endTime: '9:00PM',
              date: '21st April',
              status: 2,
            ),
          ],
        ),
      ),
    );
  }
}