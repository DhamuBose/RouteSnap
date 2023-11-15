import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../AuthService/AuthService.dart';
import '../DashBoard/dashBoard.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _otpController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 600;

            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                        children: [
                          Positioned(
                            top: 50,
                            left: 0,
                            right: 200,
                            child: Image.asset(
                              'assets/logo.png',
                              width: isMobile ? 100 : 140,
                              height: isMobile ? 100 : 120,
                            ),
                          ),
                          Text("Bus Tracking Application",style: TextStyle(
                            fontSize: 20,fontWeight: FontWeight.w200,
                          ),),
                        ],
                      ),
                    ),
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 180),
                          Center(
                            child: Image.asset("assets/banner.png"),
                          ),

                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 50,left: 150,bottom: 5),
                                child: Text(
                                  "Login",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'FontMedium',
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: _isLoading
                                    ? CircularProgressIndicator(
                                  color: Colors.black,
                                )
                                    : RawMaterialButton(
                                  elevation: 0.0,
                                  onPressed: () async {
                                    setState(() {
                                      _isLoading = true;
                                    });
                                    var user = (await AuthService().signInWithGoogle());
                                    if (user != null) {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => DashBoard()),
                                      );
                                    } else {
                                      print("Sign in failed");
                                    }
                                    setState(() {
                                      _isLoading = false;
                                    });
                                  },
                                  fillColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    side: BorderSide(color: Colors.grey),
                                  ),
                                  constraints: BoxConstraints(
                                    minWidth: isMobile ? 300.0 : 350.0,
                                    minHeight: 60.0,
                                  ),
                                  child: Center(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image.asset(
                                          'assets/gicon.png',
                                          height: isMobile ? 30.0 : 30.0,
                                          width: isMobile ? 30.0 : 30.0,
                                        ),
                                        SizedBox(width: 10.0),
                                        Text(
                                          'Sign in with Google',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: isMobile ? 14.0 : 17.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}