import 'package:local_auth/local_auth.dart';

class AuthService{
   static final _auth=LocalAuthentication();
    static  Future<bool>canAuthenticate()async=>
        await _auth.canCheckBiometrics || await _auth.isDeviceSupported();

    static Future<bool>authenticate()async{
      try{
        if(!await canAuthenticate())return false;
        return await _auth.authenticate(localizedReason: "get into app");
      }catch(e){
        print("error $e");
        return false;
      }
    }
}