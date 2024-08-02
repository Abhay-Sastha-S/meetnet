import 'package:flutter/material.dart';
import 'user_detail_card.dart';
import 'user.dart';

class EventDetailsScreen extends StatelessWidget {
  final List<User> users = [
    User(
      name: 'John Doe',
      profession: 'Engineer',
      university: 'MIT',
      photoUrls: [
        'https://randomuser.me/api/portraits/men/1.jpg',
        'https://randomuser.me/api/portraits/men/2.jpg',
        'https://randomuser.me/api/portraits/men/3.jpg',
      ],
      socialMedia: {'LinkedIn': 'https://linkedin.com/in/johndoe'},
    ),
    User(
      name: 'Jane Smith',
      profession: 'Doctor',
      university: 'Harvard',
      photoUrls: [
        'https://randomuser.me/api/portraits/women/1.jpg',
        'https://randomuser.me/api/portraits/women/2.jpg',
        'https://randomuser.me/api/portraits/women/3.jpg',
      ],
      socialMedia: {'LinkedIn': 'https://linkedin.com/in/janesmith'},
    ),
    User(
      name: 'Alice Johnson',
      profession: 'Designer',
      university: 'Parsons',
      photoUrls: [
        'https://randomuser.me/api/portraits/women/2.jpg',
        'https://randomuser.me/api/portraits/women/3.jpg',
        'https://randomuser.me/api/portraits/women/4.jpg',
      ],
      socialMedia: {'LinkedIn': 'https://linkedin.com/in/alicejohnson'},
    ),
    User(
      name: 'Bob Brown',
      profession: 'Developer',
      university: 'Stanford',
      photoUrls: [
        'https://randomuser.me/api/portraits/men/2.jpg',
        'https://randomuser.me/api/portraits/men/3.jpg',
        'https://randomuser.me/api/portraits/men/4.jpg',
      ],
      socialMedia: {'LinkedIn': 'https://linkedin.com/in/bobbrown'},
    ),
    User(
      name: 'Charlie Black',
      profession: 'Lawyer',
      university: 'Yale',
      photoUrls: [
        'https://randomuser.me/api/portraits/men/3.jpg',
        'https://randomuser.me/api/portraits/men/4.jpg',
        'https://randomuser.me/api/portraits/men/5.jpg',
      ],
      socialMedia: {'LinkedIn': 'https://linkedin.com/in/charlieblack'},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Details'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => UserDetailCard(user: user),
                isScrollControlled: true,
              );
            },
            child: CircleAvatar(
              backgroundImage: NetworkImage(user.photoUrls[1]),
            ),
          );
        },
      ),
    );
  }
}
