import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CardDetailScreen extends StatelessWidget {
  final String title;
  final String subtitle;
  final String timing;

  CardDetailScreen({required this.title, required this.subtitle, required this.timing});

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text('Bus Details')),
    body: Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Custom vertical tracking line with three dots and bus stop text
              CustomPaint(
                size: Size(20, 200), // Adjust the size as needed
                painter: TrackingLinePainter(),
              ),
              SizedBox(width: 20), // Add spacing between the line and text
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Title: $title'),
                  Text('Subtitle: $subtitle'),
                  Text('Timing: $timing'),
                  SizedBox(height: 10), // Add spacing between the timing and tracking line
                  Text('Bus Stop Name'), // Replace with the actual bus stop name
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80,right: 200),
            child: Text("Transport Fees",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("Common Transport Fees ",style: TextStyle(fontSize: 20),),
                    SizedBox(width: 80,height: 50),
                    Text("Rs: 20,000",style: TextStyle(fontSize: 15),),
                    // Text("B8/Bharathi Nagar -"),
                    // Text("Rs: 12,500"),
                  ],
                ),
                Row(
                  children: [
                    Text("B8/Bharathi Nagar ",style: TextStyle(fontSize: 20),),
                    SizedBox(width:135,height: 50),
                    Text("Rs: 12,500",style: TextStyle(fontSize: 15),),
                  ],
                ),
                Row(
                  children: [
                    Text("Total Fee",style: TextStyle(fontSize: 20),),
                    SizedBox(width:225,height: 50),
                    Text("Rs: 32,500",style: TextStyle(fontSize: 15,color: Colors.red),),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    child: Text('Pay',style: TextStyle(color: Colors.white),),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent,
                    ),
                    onPressed: _launchURLApp
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
}

class TrackingLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue // Change the color as needed
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10; // Increase the line size

    final double centerX = size.width / 2;

    // Draw a vertical line on the left side of the canvas
    canvas.drawLine(Offset(centerX, 0), Offset(centerX, size.height), paint);

    // Draw three dots
    canvas.drawCircle(Offset(centerX, size.height / 6), 10, paint);
    canvas.drawCircle(Offset(centerX, size.height / 2), 10, paint);
    canvas.drawCircle(Offset(centerX, 5 * size.height / 6), 10, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
_launchURLApp() async {
  var url = Uri.parse("https://www.geeksforgeeks.org/");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}


