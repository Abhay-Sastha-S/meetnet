import 'package:flutter/material.dart';

class EventSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Event'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/eventDetails');
              },
              child: Text('Enter Event Code'),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle nearby connection
              },
              child: Text('Connect Nearby'),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle create new event
              },
              child: Text('Create New Event'),
            ),
          ],
        ),
      ),
    );
  }
}
