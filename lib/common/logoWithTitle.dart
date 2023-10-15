import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'appColor.dart';

class LogoWithTitle extends StatelessWidget {
  const LogoWithTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColor.white_color,
      body:
      Container(
        //color: Colors.orange,
        height: MediaQuery.of(context).size.height/2.3,
        child: Column(
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
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 30,right: 30),
                      child:
                      Image(
                          image: AssetImage("assets/images/SplashLogo.png"))),
                  SizedBox(height: 20,),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height/10,
                    color: AppColor.blue_color,
                    child: Center(child: Text(
                      "RajIFMS",style: TextStyle(
                        color: AppColor.white_color,fontWeight: FontWeight.bold,fontSize: 30),)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
