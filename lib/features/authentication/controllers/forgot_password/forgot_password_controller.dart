import 'package:e_commerce/data/repositeries/authentication_repository.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:e_commerce/utils/popups/snackbar_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../utils/helpers/network_manager.dart';
import '../../screens/forgot_password/reset_password.dart';
class ForgetPasswordController extends GetxController {
static ForgetPasswordController get instance => Get.find();

///Variables
final email = TextEditingController();
final ForgetPasswordFormKey = GlobalKey<FormState>();

/// Send Email to Forget Password
Future<void>sendPasswordResetEmail() async{
  try{
    //start loading
    UFullScreenLoader.openLoadingDialog("Processing Your request ");


    //Check Internet Connectivity

    bool isConnected = await NetworkManager.instance.isConnected();
    if(!isConnected){
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.warningSnackBar(title: " NO Internet Connection");
      return;
    }
    //Form Validation
    if(!ForgetPasswordFormKey.currentState!.validate()){
      UFullScreenLoader.stopLoading();
      return;
    }
    //Send Email To Reset Password
AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());
    // stop loading
    UFullScreenLoader.stopLoading();
    //Success Message
    USnackBarHelpers.successSnackBar(title: "Email sent"  , message: "Email Link Sent to Reset your Password");

  }catch(e){
UFullScreenLoader.stopLoading();
USnackBarHelpers.errorSnackBar(title: "Failed Forget password" , message: e.toString());
  }
}
Future<void>resendPasswordResetEmail() async{
  try{
    //start loading
    UFullScreenLoader.openLoadingDialog("Processing Your request ");


    //Check Internet Connectivity

    bool isConnected = await NetworkManager.instance.isConnected();
    if(!isConnected){
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.warningSnackBar(title: " No Internet Connection");
      return;
    }
    //Send Email To Reset Password
    AuthenticationRepository.instance.sendPasswordResetEmail(email.text);
    // stop loading
    UFullScreenLoader.stopLoading();
    //Success Message
    USnackBarHelpers.successSnackBar(title: "Email sent"  , message: "Email Link Sent to Reset your Password");

  }catch(e){
    UFullScreenLoader.stopLoading();
    USnackBarHelpers.errorSnackBar(title: "Failed Forget password" , message: e.toString());
  }
}

}
