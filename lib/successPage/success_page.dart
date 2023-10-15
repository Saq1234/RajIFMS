import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rajifmss/common/appColor.dart';
import 'package:rajifmss/common/logoWithTitle.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: AppColor.white_color,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height/2.3,
            child: LogoWithTitle(),
          ),
          SizedBox(height: 15,),
          Container(
            height: MediaQuery.of(context).size.height/6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.lightgreen_color
            ),
            child:  Container(
              margin: EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height/8,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.light_up_green_color,
              ),
            ),
          ),
          SizedBox(height: 20,),
          Text("Verified",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
          Text("Successfully",style: TextStyle(fontSize:18,fontWeight: FontWeight.normal),),
          SizedBox(height: 20,),

          Container(
            margin: EdgeInsets.only(left: 20,right: 20),
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: AppColor.light_up_green_color
            ),
          ),
          SizedBox(height: 20,),
          Text("Your Authentication for mobile\napplication is successful.",style: TextStyle(fontSize:24,fontWeight: FontWeight.normal),textAlign: TextAlign.center,),


        ],
      ),
    ));
  }
}
