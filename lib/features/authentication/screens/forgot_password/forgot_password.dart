import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/button/Elevated_button.dart';
import 'package:e_commerce/features/authentication/controllers/forgot_password/forgot_password_controller.dart';
import 'package:e_commerce/features/authentication/screens/forgot_password/reset_password.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:e_commerce/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:iconsax/iconsax.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller= Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenpadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              ///Title
        Text(UTexts.forgetPasswordTitle , style: Theme.of(context).textTheme.headlineMedium,),
              SizedBox(height: USizes.spaceBtwItems / 2),
              Text(UTexts.forgetPasswordSubTitle , style: Theme.of(context).textTheme.labelMedium,),
              SizedBox(height: USizes.spaceBtwSections *2),

              ///Form
              Column(
                children: [
                  ///Email
                  Form(
                    key: controller.ForgetPasswordFormKey,
                    child: TextFormField(
                      controller: controller.email,
                      validator: (value)=>UValidator.validateEmail(value),
                      decoration: InputDecoration(
                        labelText: UTexts.email,
                        prefixIcon: Icon(Iconsax.direct_right)
                      ),
                    ),
                  ),

                  SizedBox(height: USizes.spaceBtwItems ),
///Submit
                  UElevetedButton(onPressed: controller.sendPasswordResetEmail , child: Text(UTexts.submit))
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
