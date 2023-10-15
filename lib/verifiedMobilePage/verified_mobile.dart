import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_number/mobile_number.dart';
import 'package:rajifmss/common/appColor.dart';
import 'package:rajifmss/common/logoWithTitle.dart';
import 'package:rajifmss/successPage/success_page.dart';

class VerifiedMobile extends StatefulWidget {
  const VerifiedMobile({Key? key}) : super(key: key);

  @override
  State<VerifiedMobile> createState() => _VerifiedMobileState();
}

class _VerifiedMobileState extends State<VerifiedMobile> {
  List<SimCard> simCard = <SimCard>[];
  String _mobileNumber = '';

  @override
  void initState() {
    MobileNumber.listenPhonePermission((isPermissionGranted) {
      if (isPermissionGranted) {
        initMobileNumberState();
      } else {}
    });

    initMobileNumberState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initMobileNumberState() async {
    if (!await MobileNumber.hasPhonePermission) {
      await MobileNumber.requestPhonePermission;
      return;
    }
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      _mobileNumber = (await MobileNumber.mobileNumber)!;
      simCard = (await MobileNumber.getSimCards)!;
      print("kaa${simCard[0].number}");
    } on PlatformException catch (e) {
      debugPrint("Failed to get mobile number because of '${e.message}'");
    }
    if(!mounted) return;
    setState(() {
      print("${simCard.map((e) => e.number).toList()}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: AppColor.lightgrey_color.withOpacity(0.7),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height/2.3,
            child: LogoWithTitle(),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.chevron_left,size: 50,),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Let's get your *mobile\n number verified",
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),textAlign: TextAlign.start,),
                    Text("*Mobile number should be updated in SSO ID",style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),)
                  ],
                ),
              )
            ],
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 20,left: 20,right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25)
                ),
                color: AppColor.white_color,),
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Text("Please select your SIM",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20
                  ),),
                  Text("Please select your registered mobile\nnumber from sim below",style: TextStyle(fontWeight: FontWeight.normal,
                  ),textAlign: TextAlign.center,),
                  Container(
                    margin: EdgeInsets.only(left: 20,right: 20,top: 10),
                    height: MediaQuery.of(context).size.height/12,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColor.lightgrey_color)
                    ),
                    child: Row(
                      children: [
                        Container(
                          width:50,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColor.lightgrey_color)
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:simCard
                              .map((e) => Text(" ${e.displayName} - ${e.number} "))
                              .toList(),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Image(image: AssetImage("assets/images/sim_image.png"),width: 35,),
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //   margin: EdgeInsets.only(left: 20,right: 20,top: 10),
                  //   height: MediaQuery.of(context).size.height/12,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(20),
                  //     border: Border.all(color: AppColor.lightgrey_color)
                  //   ),
                  //   child: Row(
                  //     children: [
                  //       Container(
                  //         width:50,
                  //         margin: EdgeInsets.all(10),
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(100),
                  //           border: Border.all(color: AppColor.lightgrey_color)
                  //         ),
                  //       ),
                  //       Column(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           Text("SIM 1",style: TextStyle(fontWeight: FontWeight.bold),),
                  //           SizedBox(height: 5,),
                  //           Text("JIO",style: TextStyle(fontWeight: FontWeight.normal),),
                  //         ],
                  //       ),
                  //       Spacer(),
                  //       Padding(
                  //         padding: const EdgeInsets.only(right: 10),
                  //         child: Image(image: AssetImage("assets/images/sim_image.png"),width: 35,),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Spacer(),

                  GestureDetector(
                    onTap: ()=>Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const SuccessPage())),
                    child: Container(
                      height: MediaQuery.of(context).size.height/12,
                      margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
                      decoration: BoxDecoration(
                        color: AppColor.blue_color,
                      ),
                      child: Center(child: Text("Continue",style: TextStyle(
                          fontWeight: FontWeight.bold,color: AppColor.white_color,fontSize: 24),)),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }


}
