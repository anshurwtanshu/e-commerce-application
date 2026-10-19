
import 'package:e_commerce/common/widgets/button/Elevated_button.dart';
import 'package:e_commerce/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class onboardingNextButton extends StatelessWidget {
  const onboardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final controller  = OnBoardingController.instance ;

    return Positioned(
        bottom: USizes.spaceBtwItems*4,
        child: UElevetedButton(
          onPressed: controller.nextPage,
          child: Obx(()=> Text( controller.CurrentIndex.value==2 ? "Get Started ": "Next")),));
  }
}