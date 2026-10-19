import 'package:e_commerce/common/widgets/button/Elevated_button.dart';
import 'package:e_commerce/features/authentication/screens/signup/widgets/privacy_policy_checkbox.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/texts.dart' show UTexts;
import '../../../controllers/signup/signup_controller.dart';

class Usignup extends StatelessWidget {
  const Usignup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignUpController.instance;
    return

        /// -----[Form]-----------
        Form(
      key: controller.signUpFormKey,
      child: Column(
        children: [
          ///    first name and last name
          Row(
            children: [
              ///First Name
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      UValidator.validateEmptyText("First Name", value),
                  decoration: InputDecoration(
                      labelText: UTexts.firstName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              SizedBox(
                width: USizes.spaceBtwInputFields,
              ),

              /// LAst Name
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      UValidator.validateEmptyText("Last Name", value),
                  decoration: InputDecoration(
                      labelText: UTexts.lastName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              )
            ],
          ),

          SizedBox(
            height: USizes.spaceBtwInputFields,
          ),

          ///Email
          TextFormField(
            controller: controller.email,
            validator: (value) => UValidator.validateEmail(value),
            decoration: InputDecoration(
                labelText: UTexts.email,
                prefixIcon: Icon(Iconsax.direct_right)),
          ),

          /// Phone Number
          SizedBox(
            height: USizes.spaceBtwInputFields,
          ),
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => UValidator.validatePhoneNumber(value),
            decoration: InputDecoration(
              labelText: UTexts.phoneNumber,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          SizedBox(
            height: USizes.spaceBtwInputFields,
          ),

          /// password
          Obx(
            () => TextFormField(
              obscureText: controller.isPasswordVisible.value,
              controller: controller.password,
              validator: (value) => UValidator.validatePassword(value),
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: UTexts.password,
                suffixIcon: IconButton(
                    onPressed: () => controller.isPasswordVisible.value =
                        !controller.isPasswordVisible.value,
                    icon: Icon(controller.isPasswordVisible.value
                        ? Iconsax.eye
                        : Iconsax.eye_slash)),
              ),
            ),
          ),

          /// privacy policy checkbox
          SizedBox(
            height: USizes.spaceBtwInputFields / 2,
          ),

          UPrivacyPolicyCheckbox(),

          ///Create Account
          UElevetedButton(
              onPressed: controller.registerUser,
              child: Text(UTexts.createAccount)),

          SizedBox(
            height: USizes.spaceBtwItems,
          ),
        ],
      ),
    );

    ///----- [Divider] -------

    /// -----[Footer] ---------
  }
}
