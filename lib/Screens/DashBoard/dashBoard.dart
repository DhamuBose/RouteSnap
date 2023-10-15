import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:routesnap/Screens/LogIn/logIn.dart';

import '../CardDetailsScreen/CardDetailsScreen.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  late User? _user;

  List<String> cardTitles = [
    'Bus No 123',
    'Bus No 52',
    'Bus No 56',
    'Bus No 78',
    'Bus No 90',
    'Bus No 40',
    'Bus No 33',
    'Bus No 56',
    'Bus No 79',
    'Bus No 17',
  ];

  List<String> cardSubtitles = [
    'Bharathi Nagar',
    'Vetri Nagar',
    'Parvathi Nagar',
    'Kulam',
    'Bharathi Nagar',
    'Krishna Nagar',
    'Vetri Nagar',
    'Mannivakkam',
    'Mudichur',
    'Kulam',
  ];

  List<String> cardTimings = [
    '10:00 AM',
    '11:15 AM',
    '12:30 PM',
    '1:45 PM',
    '3:00 PM',
    '4:15 PM',
    '5:30 PM',
    '6:45 PM',
    '8:00 PM',
    '9:15 PM',
  ];
  void _onCardTapped(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CardDetailScreen(
          title: cardTitles[index],
          subtitle: cardSubtitles[index],
          timing: cardTimings[index],
        ),
      ),
    );
  }

  void _showSignOutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Sign Out"),
          content: Text("Are you sure you want to sign out?"),
          actions: [
            TextButton(
              onPressed: () {
                // User confirmed sign out, perform sign out action here
                FirebaseAuth.instance.signOut();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text("Sign Out"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _user = FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Column(
            children: [
              // Header Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    // Icon in the left top corner
                    Icon(
                      Icons.location_on_outlined, // You can change the icon to the one you prefer
                      size: 30,
                    ),
                    SizedBox(width: 10), // Add some space between the icon and text
                    // Text
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 45),
                          child: Text(
                            'Sit20it017',
                            style: TextStyle(fontSize: 21),
                          ),
                        ),
                        Text(
                          'B8/Bharathina...',
                          style: TextStyle(fontSize: 19),
                        ),
                      ],
                    ),
                    Spacer(),
                    // Circular avatar image in the top-right corner
                    GestureDetector(
                      onTap: _showSignOutDialog, // Show the sign-out confirmation dialog
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(_user?.photoURL ?? ''),
                        radius: 25,
                      ),
                    ),
                  ],
                ),
              ),
              // List of Cards
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  onTap: () => _onCardTapped(index), // Add onTap to navigate to CardDetailScreen
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage('https://lh3.googleusercontent.com/-zx48IIBt8Ns/Vbz1a_rfZyI/AAAAAAAAaSw/-i93v_QEpTk/s1024-Ic42/DSC03129.JPG'), // Replace with the image URL
                  ),
                  title: Text(cardTitles[index]),
                  subtitle: Text(cardSubtitles[index]),
                  trailing: Text('Timing: ${cardTimings[index]}'),
                ),
              );
            },
          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
