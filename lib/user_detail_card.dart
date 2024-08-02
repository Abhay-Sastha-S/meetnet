import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'user.dart';

class UserDetailCard extends StatelessWidget {
  final User user;

  UserDetailCard({required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
      ),
      child: Column(
        children: <Widget>[
          Text(user.name, style: Theme.of(context).textTheme.displayLarge),
          Text(user.profession, style: Theme.of(context).textTheme.titleLarge),
          Text(user.university, style: Theme.of(context).textTheme.bodyMedium),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: user.socialMedia.entries.map((entry) {
              return IconButton(
                icon: Icon(Icons.link, color: Theme.of(context).colorScheme.secondary),
                onPressed: () {
                  launch(entry.value);
                },
              );
            }).toList(),
          ),
          ElevatedButton(
            onPressed: () {
              // Handle connection request
            },
            child: Text('Connect'),
          ),
          // Add chat feature if connection is accepted
        ],
      ),
    );
  }
}
