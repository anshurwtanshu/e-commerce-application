import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/button/Elevated_button.dart';
import 'package:e_commerce/common/widgets/button/social_buttons.dart';
import 'package:e_commerce/common/widgets/login_signup/form_divider.dart';
import 'package:e_commerce/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:iconsax/iconsax.dart';

import '../../controllers/signup/signup_controller.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Padding(
        padding: UPadding.screenpadding,
/// form
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          ///----- [Header]--------
          Text(
          UTexts.signupTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
            SizedBox(
              height: USizes.spaceBtwSections,
            ),
            ///Divider
            Usignup(),
UFormDivider(title: UTexts.orSignupWith),
            SizedBox(
              height: USizes.spaceBtwSections,
            ),
             ///Footer
            USocialButton()
          ],
        ),


      )),
    );
  }
}

