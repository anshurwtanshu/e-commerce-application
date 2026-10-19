import 'package:e_commerce/features/personalization%20/controllers/user_controller.dart';
import 'package:e_commerce/utils/helpers/network_manager.dart';
import 'package:e_commerce/utils/navigation_menu.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:e_commerce/utils/popups/snackbar_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/repositeries/user/user_repository.dart';
class ChangeNameController extends GetxController
{
  static ChangeNameController get instance => Get.find();
/// Variables
  ///
  final _userController = UserController.instance;
  final _userRepository = UserRepository.instance;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final updateUserFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  void initializeNames() {
    firstNameController.text = _userController.user.value.firstName;
    lastNameController.text = _userController.user.value.lastName;

  }
  Future<void>updateUserName() async{
    try{

// start Loading
UFullScreenLoader.openLoadingDialog("We are updating your information....");
// Check Internet Connectivity
    bool isConnected = await NetworkManager.instance.isConnected();
    if(!isConnected){
      UFullScreenLoader.stopLoading();
      return;
    }
    // Form Validation
      if(!updateUserFormKey.currentState!.validate()){
        UFullScreenLoader.stopLoading();
        return;
      }
      //Update User Name From fire Store
      Map<String , dynamic>map={"firstName":firstNameController.text , "lastName":lastNameController.text};
      await _userRepository.updateSingleField(map);

      // Update User orm Rx User
      _userController.user.value.firstName=firstNameController.text;
      _userController.user.value.lastName=lastNameController.text;

      // Stop loading
      UFullScreenLoader.stopLoading();

      //Redirect
      Get.offAll(()=>NavigationMenu());

      //Success Message
      USnackBarHelpers.successSnackBar(title: "update Name Failed!" , message:"Your Name has been  Updated");



    }catch(e){
      // Stop loading
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(title: "Update Name Failed!" , message: e.toString());
    }
  }

}
