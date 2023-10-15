import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rajifmss/common/logoWithTitle.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height/2.3,
            child: LogoWithTitle(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,top: 40),
            child: Text("Error: kindly update your\n"
                "mobile number in your\n"
                "SSO ID",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),),
          )
        ],
      ),
    ));
  }
}
