import 'package:e_commerce/features/authentication/models/user_model.dart';
import 'package:e_commerce/utils/helpers/network_manager.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:e_commerce/utils/popups/snackbar_helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/repositeries/authentication_repository.dart';
import '../../../../data/repositeries/user/user_repository.dart';
import '../../../../data/repositeries/user/user_repository.dart' as _userRepository;
import '../../screens/signup/verify_email.dart';
class SignUpController extends GetxController{
  static SignUpController get instance => Get.find();


  ///variables
  final signUpFormKey = GlobalKey<FormState>();
  RxBool isPasswordVisible = true.obs;
  RxBool privacyPolicy = true.obs;

  final firstName= TextEditingController();
  final lastName= TextEditingController();
  final email= TextEditingController();
  final phoneNumber= TextEditingController();
  final password= TextEditingController();






  /// Function to register the user with email and  password
  Future<void>registerUser()async{
    try {

// check internet connectivity
bool isConnected = await NetworkManager.instance.isConnected();
if(!isConnected) {
  UFullScreenLoader.stopLoading();
  USnackBarHelpers.warningSnackBar(title: "No Internet Connection");
  return;
}
//check privacy policy
      if(!privacyPolicy.value){
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(title: "Accept Privacy Policy", message: "In order to create account, you must have to read and accept the Privacy Policy & Terms of Use");
      }
      //Form Validation
      if (!signUpFormKey.currentState!.validate()) {
        return;
      }
// page is loading
        UFullScreenLoader.openLoadingDialog(" page is laoding ...");

      //Register with user using Firebase Authentication
       UserCredential userCredential = await AuthenticationRepository.instance.registerUser(email.text.trim(), password.text.trim());

      // create  user model
      UserModel userModel= UserModel(
          id:userCredential.user!.uid,
          firstName: firstName.text,
          lastName: lastName.text,
          username: "${firstName.text}${lastName.text}356465",
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture:"",
      );
      // save user Record
final userRepository = Get.put(UserRepository());
await userRepository.saveUserRecord(userModel);

// success message
USnackBarHelpers.successSnackBar(title: "Congratulations" , message: "your Account has been created! Verify email to continue");
// stop loading
    UFullScreenLoader.stopLoading();
    // redirect to verify email
      Get.to(()=>VerifyEmailScreen(email: email.text,));

    } catch(e){
      // stop loading
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(title: "Error" , message: e.toString());
    }

  }
}