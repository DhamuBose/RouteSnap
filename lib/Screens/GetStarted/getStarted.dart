import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:routesnap/Screens/LogIn/logIn.dart';


class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: isMobile ? double.infinity : 500,
                    height: isMobile ? 200 : 400,
                    child: Image.asset(
                      "assets/welcome.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: isMobile ? 40.0 : 40.0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "RouteSnap",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: isMobile ? 10.0 : 20.0),
                    child: Text(
                      "Get Started",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontFamily: 'FontMedium',
                        fontSize: isMobile ? 12 : 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: isMobile ? 60.0 : 40.0),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: isMobile ? 60.0 : 50.0,
                      width: isMobile ? double.infinity : 300.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: Colors.blueAccent,
                        ),
                        onPressed: () {
                          Navigator.push(context,MaterialPageRoute(builder: (context) => LoginScreen()));
                        },
                        child: const Text(
                          'Get Started',
                          style: TextStyle(
                            fontFamily: 'Fontblod',
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}