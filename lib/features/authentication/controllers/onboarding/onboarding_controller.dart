import 'package:e_commerce/features/authentication/screens/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  final storage = GetStorage();

//Variables
  final pageController = PageController();
  RxInt CurrentIndex = 0.obs;

  /// Update current index when page scroll
  void updatePageIndicator(index) {
    CurrentIndex.value = index ;
  }

  ///Jump to specific dot selected page
  void dotNavigationClick(index) {
    CurrentIndex.value = index ;
    pageController.jumpToPage(index);
  }

  /// Update current index and jump to the next page
  void nextPage() {
    if(CurrentIndex.value==2){
      storage.write("isFirstTIme", false);
      Get.offAll(()=>LoginScreen());
    }
    CurrentIndex.value ++;
    pageController.jumpToPage(CurrentIndex.value);
  }
  /// Update current index and jump to the last
  void skipPage() {
    CurrentIndex.value= 2;
    pageController.jumpToPage(CurrentIndex.value);
  }


}