

import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/button/Elevated_button.dart';
import 'package:e_commerce/features/authentication/controllers/forgot_password/forgot_password_controller.dart';
import 'package:e_commerce/features/authentication/screens/login/login.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:e_commerce/utils/helpers/device_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart' show GetNavigation;

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});
final String email ;
  @override
  Widget build(BuildContext context) {
    final controller = ForgetPasswordController.instance;
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,
      actions: [
        IconButton(onPressed: ()=> Get.offAll(()=>LoginScreen()), icon: Icon(CupertinoIcons.clear ))
      ],
      ),
      body: SingleChildScrollView(
        child: Padding(

          padding: UPadding.screenpadding,
          child: Column(
            children: [
              ///image
              Image.asset(UImages.mailSentImage , height: UDeviceHelper.getScreenWidth(context) *0.6,),
              SizedBox(height: USizes.spaceBtwItems),
              /// Title
              Text(UTexts.resetPasswordTitle ,style: Theme.of(context).textTheme.headlineMedium),
              SizedBox(height: USizes.spaceBtwItems),
              ///Email
              Text(email,style: Theme.of(context).textTheme.bodyMedium),
              SizedBox(height: USizes.spaceBtwItems),
              ///SubTitle
              Text(UTexts.resetPasswordSubTitle ,style: Theme.of(context).textTheme.bodySmall, textAlign: TextAlign.center,) ,
              SizedBox(height: USizes.spaceBtwSections),

              ///done
              UElevetedButton(onPressed: ()=> Get.offAll(()=>LoginScreen()), child: Text(UTexts.done)),
/// Reset Email
              SizedBox(
                  width:UDeviceHelper.getScreenWidth(context),
                  child: TextButton(onPressed:controller.resendPasswordResetEmail, child: Text(UTexts.resendEmail)))

            ],

          ),
        ),
      ),
    );
  }
}
