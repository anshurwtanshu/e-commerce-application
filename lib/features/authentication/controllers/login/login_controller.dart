import 'package:e_commerce/data/repositeries/authentication_repository.dart';
import 'package:e_commerce/utils/constants/keys.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/snackbar_helpers.dart';
import '../../../personalization /controllers/user_controller.dart';

class LoginController extends GetxController{
  static LoginController get instance => Get.find();


///Variables
  final _userController = Get.put(UserController());
final email = TextEditingController();
final password = TextEditingController();
RxBool isPasswordVisible = false.obs;
RxBool rememberMe = false.obs;
final loginFormKey = GlobalKey<FormState>();

final localStorage = GetStorage();

@override
void onInit() {
   email.text= localStorage.read(Ukeys.rememberMeEmail)?? "";
   password.text= localStorage.read(Ukeys.rememberMePassword)??"";
   super.onInit();
}
  /// Function to login the user with email and password
Future<void>loginWithEmailAndPassword() async{
  try{
// start Loading
  UFullScreenLoader.openLoadingDialog("Logging you in ...");

  //Check Internet Connectivity
  final isConnected = await NetworkManager.instance.isConnected();
if(!isConnected){
  UFullScreenLoader.stopLoading();
  USnackBarHelpers.warningSnackBar(title: "No Internet Connection");
return;
}


// Form Validation
if(!loginFormKey.currentState!.validate()){
  UFullScreenLoader.stopLoading();
  return;
}
// Save Data if remember me is checked
if(rememberMe.value){
localStorage.write(Ukeys.rememberMeEmail, email.text.trim());
localStorage.write(Ukeys.rememberMePassword, password.text.trim());
}

//Login User with Email and Password
  await AuthenticationRepository.instance.LoginWithEmailAndPassword(email.text.trim(), password.text.trim());
//stop Loading
UFullScreenLoader.stopLoading();
//Redirect
  AuthenticationRepository.instance.screenRedirect();
  }catch(e){
UFullScreenLoader.stopLoading();
USnackBarHelpers.errorSnackBar(title: "Login Failed" , message: e.toString());
  }
}


/// Google Sign In Authentication
Future<void>googleSignIn() async{

  try{
// start loading
  UFullScreenLoader.openLoadingDialog("Logging You in ....");

  //Check Internet Connectivity
  final isConnected = await NetworkManager.instance.isConnected();
  if(!isConnected){
    UFullScreenLoader.stopLoading();
    USnackBarHelpers.warningSnackBar(title: "No Internet Connection");
    return;
  }
  // Google Authentication
    UserCredential userCredential = await AuthenticationRepository.instance.SignInWithGoogle();

// save user Record
    await _userController.SaveUserRecord(userCredential);

  // Stop Loading
    UFullScreenLoader.stopLoading();

    // Redirect
    AuthenticationRepository.instance.screenRedirect();
  }catch(e){
// Stop Loading
  UFullScreenLoader.stopLoading();
  // Error Snack-bar
    USnackBarHelpers.errorSnackBar(title: "Login Failed" , message: e.toString());
  }
}
}