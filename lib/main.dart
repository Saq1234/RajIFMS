import 'dart:async';
import 'package:flutter/material.dart';
import 'common/appColor.dart';
import 'landingPage/landing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState(){
    startTime();
  }

  startTime() async {
    Timer(
        const Duration(seconds: 3),
            () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LandingPage())));

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      backgroundColor: AppColor.white_color,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height/5,
                width: MediaQuery.of(context).size.width/5,
                decoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(0.5),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(100),
                      bottomRight: Radius.circular(100),
                    )
                ),
              ),
              RotatedBox(
                quarterTurns: -3,
                child: Container(
                  height: MediaQuery.of(context).size.height/5,
                  width: MediaQuery.of(context).size.width/5,
                  decoration: BoxDecoration(
                      color: Colors.blueAccent.withOpacity(0.5),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(100),
                        bottomRight: Radius.circular(100),
                      )
                  ),
                ),
              )
            ],),
          SizedBox(
            height: MediaQuery.of(context).size.height/5,
          ),
          Container(
              margin: EdgeInsets.only(left: 30,right: 30),
              child:
              Image(
                  image: AssetImage("assets/images/SplashLogo.png"))),
          SizedBox(height: MediaQuery.of(context).size.height/4),
          Center(
            child: CircularProgressIndicator(
              color: AppColor.blue_color,
            ),
          ),

        ],
      ),

    ));
  }
}
