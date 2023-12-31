import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rajifmss/authenticationPage/authentication_page.dart';
import '../common/appColor.dart';
import '../common/logoWithTitle.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
            backgroundColor: AppColor.white_color,
            body:Column(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height/2.3,

                    child: LogoWithTitle()),
                SizedBox(height: MediaQuery.of(context).size.height/4,),
                GestureDetector(
                  onTap: ()=>Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) =>  AuthenticationPage())),
                  child: Container(
                    margin: EdgeInsets.only(left: 20,right: 20),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height/9,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: AppColor.blue_color

                    ),
                    child: Center(child: Text("Let's Get Started",style:
                    TextStyle(color: AppColor.white_color,fontSize: 30,fontWeight: FontWeight.bold),)),),
                )
              ],
            )
        ));
  }
}
