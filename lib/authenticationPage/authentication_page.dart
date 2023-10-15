import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../common/appColor.dart';
import '../common/logoWithTitle.dart';
import '../verifiedMobilePage/verified_mobile.dart';
import 'authService.dart';
class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  bool hideContinue=false;

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
                SizedBox(height:20,),
                hideContinue==false?
                GestureDetector(
                  onTap: ()async{
                    bool isAuthenticated = await AuthService.authenticate();
                    if (isAuthenticated) {
                      // ignore: use_build_context_synchronously
                      setState(() {
                        hideContinue=true;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Authentication Success.'),),);

                    } else {
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Authentication failed.'),
                        ),
                      );
                    }
                  },
                  child: Image(image: AssetImage("assets/images/fingure_print_image.png"),
                  height: MediaQuery.of(context).size.height/10,),
                ):GestureDetector(
                  onTap: ()async{

                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Authentication Success Please Continue.'),
                        ),
                      );
                      },
                  child: Image(image: AssetImage("assets/images/fingure_print_image.png"),
                    height: MediaQuery.of(context).size.height/10,),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      "The app will send on SMS to verify\n "
                        "your number.Please ensure you\n dont click"
                        "back button or move\n away from this screen during the verification process",
                      style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                  ),
                ),
                Visibility(
                  visible: hideContinue,
                  child: GestureDetector(
                     onTap: ()=>Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => const VerifiedMobile())),
                    child: Container(
                      margin: EdgeInsets.only(left: 20,right: 20,top: 30),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height/12,
                      decoration: BoxDecoration(
                          //borderRadius: BorderRadius.circular(100),
                          color: Colors.blue
                      ),
                      child: Center(child: Text("Continue",style:
                      TextStyle(color: AppColor.white_color,fontSize: 30,fontWeight: FontWeight.bold),)),),
                  ),
                )
              ],
            )
        ));
  }
}
