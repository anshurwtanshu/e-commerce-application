import 'dart:io';

import 'package:e_commerce/data/repositeries/authentication_repository.dart';
import 'package:e_commerce/features/authentication/models/user_model.dart';
import 'package:e_commerce/features/authentication/screens/login/login.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../data/repositeries/user/user_repository.dart';
import '../../../utils/constants/apis.dart';
import '../../../utils/constants/keys.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/snackbar_helpers.dart';
import '../screens /edit_profile/widgets/re_authenticate_user_form.dart';
import 'package:dio/dio.dart'as dio;
class UserController extends GetxController{
  static UserController get instance =>Get.find();


  ///Variables
  final _userRepository = Get.put(UserRepository());
Rx<UserModel> user  = UserModel.empty().obs;
RxBool profileLoading = false.obs;
RxBool isProfileUploading= false.obs;

  /// Re-Authenticate Form Variables
  final email= TextEditingController();
  final password= TextEditingController();
  final reAuthenticateFormKey = GlobalKey<FormState>();
RxBool isPasswordVisible = false.obs;

@override
void onInit() {
  fetchUserDetails();
  super.onInit();
}



/// function to save user record
Future<void> SaveUserRecord(UserCredential userCredential) async{
  try{
    // First update RX Variable and then check if user data is already stored. If not then store
 await fetchUserDetails();
 if(user.value.id.isEmpty){
   // Convert Full Name to FirstName & LastName
   final nameParts= UserModel.nameParts(userCredential.user!.displayName);
   final username = "${userCredential.user!.displayName}4564625576";

// create User Model
   UserModel userModel = UserModel(
       id: userCredential.user!.uid,
       firstName: nameParts[0],
       lastName: nameParts.length>1?nameParts.sublist(1).join(""):"",
       username: username,
       email: userCredential.user!.email??"",
       phoneNumber: userCredential.user!.phoneNumber??"",
       profilePicture:userCredential.user!.photoURL??"");

// save user Record
   await _userRepository.saveUserRecord(userModel);
 }
// Convert Full Name to FirstName & LastName
final nameParts= UserModel.nameParts(userCredential.user!.displayName);
final username = "${userCredential.user!.displayName}4564625576";

// create User Model
UserModel userModel = UserModel(
    id: userCredential.user!.uid,
    firstName: nameParts[0],
    lastName: nameParts.length>1?nameParts.sublist(1).join(""):"",
    username: username,
    email: userCredential.user!.email??"",
    phoneNumber: userCredential.user!.phoneNumber??"",
    profilePicture:userCredential.user!.photoURL??"");

// save user Record
 await _userRepository.saveUserRecord(userModel);



  }catch(e){
 USnackBarHelpers.warningSnackBar(title: "Data not Saved" , message:"Something went wrong while saving user data. Please try again." );
  }
}

/// Function to fetch user details
Future<void> fetchUserDetails() async {
try{
    profileLoading.value = true;
     UserModel user = await _userRepository.fetchUserDetails();
    this.user.value = user;
}catch(e){
user(UserModel.empty());
}finally{
  profileLoading.value= false;
}

}
  /// [Popup] - Popup To Delete Account Confirmation

  Future<void> deleteAccountWarningPopup() async {
    Get.defaultDialog(
      title: "Close Account",
      middleText:
      "Are you sure you want to close your account? This action cannot be undone.",
      textCancel: "Cancel",
      textConfirm: "Continue",
      onCancel: () {},
      onConfirm: () {
        Get.back(); // Close the popup
        deleteUserAccount(); // Start account deletion flow
      },
    );
  }

  /// Delete Account
Future<void>deleteUserAccount() async{
  try{
// start loading
  UFullScreenLoader.openLoadingDialog("Processing...");
  // Re-Authentication User
    final authRepository = AuthenticationRepository.instance;
    final provider = authRepository.currentUser!.providerData.map((e)=>e.providerId).first;
    // If Google Provider
    if(provider=="google.com"){
 await authRepository.SignInWithGoogle();

 await authRepository.deleteAccount();
 UFullScreenLoader.stopLoading();
 Get.offAll(()=>LoginScreen());
// if Email/ Password Provider
    }else if (provider== "password"){
UFullScreenLoader.stopLoading();
Get.to(()=>ReAuthenticateUserForm());
    }
  }catch(e){
    UFullScreenLoader.stopLoading();
USnackBarHelpers.errorSnackBar(title: "Error" ,message: e.toString());
  }
}
///ReAuthentication User With Email And Password
Future<void>reAuthenticateUser()async{
  try{
    // start loading
    UFullScreenLoader.openLoadingDialog("Processing...");
    // check internet connectivity
    bool isConnected = await NetworkManager.instance.isConnected();
    if(!isConnected){
      UFullScreenLoader.stopLoading();
      return;
    }

    // Form Validation
    if(!reAuthenticateFormKey.currentState!.validate()){
      UFullScreenLoader.stopLoading();
      return;
    }
    // Re-Authenticate User with email and password
await AuthenticationRepository.instance. reAuthenticateUserWithEmailAndPassword(email.text.trim(), password.text.trim());
    // Delete Account
    await AuthenticationRepository.instance.deleteAccount();

    //Stop loading
    UFullScreenLoader.stopLoading();
    // Redirect 
    Get.offAll(()=>LoginScreen());
    } catch(e){
    //Stop loading
    UFullScreenLoader.stopLoading();
    USnackBarHelpers.successSnackBar(title: "Failed" , message: e.toString());
  }
}
/// Update User Profile Picture
Future<void>updateUserProfilePicture()async{
  try{

//start loading
  isProfileUploading.value= true;

    // Pick Image From Gallery
   XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery , maxHeight: 512 ,maxWidth: 512);
   if(image== null)return;

// Convert XFile to File
  File file = File(image.path);

    // delete user current profile picture
if(user.value.profilePicture.isNotEmpty){
  await _userRepository.deleteProfilePicture(user.value.publicId);
}


// Upload profile Picture To Cloudinary
dio.Response response = await _userRepository.uploadImage(file);
if(response.statusCode==200){


  // Get Data
final data = response.data;
final imageUrl = data["url"];
final publicId = data["public_id"];


//update profile picture from firestore
await _userRepository.updateSingleField({"profilePicture":imageUrl, "publicId":publicId});
user.value.profilePicture = imageUrl;
user.value.publicId= publicId;

user.refresh();


// success message
USnackBarHelpers.successSnackBar(title: "Congratulations" , message: "Profile Picture updated Successfully");
}else {
  throw"Failed to upload profile picture . Please try again";
}
  }catch(e) {
    USnackBarHelpers.errorSnackBar(title: "Failed!", message: e.toString());
  }finally{
    isProfileUploading.value= false;

  }
}




}