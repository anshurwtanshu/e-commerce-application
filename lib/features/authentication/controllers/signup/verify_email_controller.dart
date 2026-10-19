import 'dart:async';
import 'package:e_commerce/data/repositeries/authentication_repository.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:e_commerce/utils/popups/snackbar_helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/screens/success_screen.dart';
class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

//Send Email Verification Link to User
  Future<void> sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmaiVerification();
      USnackBarHelpers.successSnackBar(title: " Email Sent",
          message: "Please Check your inbox and Verify your email ");
    } catch (e) {
      USnackBarHelpers.errorSnackBar(title: "Error", message: e.toString());
    }
  }

  void setTimerForAutoRedirect() {
    Timer.periodic(Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser!.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user!.emailVerified ?? false) {
        timer.cancel();
        Get.off(() =>
            SuccessScreen(
              title: UTexts.accountCreatedTitle,
              subTitle: UTexts.accountCreatedSubTitle,
              image: UImages.successfulPaymentIcon,
              onTap: () => AuthenticationRepository.instance.screenRedirect(),
            ));
      }
    },);
  }


}