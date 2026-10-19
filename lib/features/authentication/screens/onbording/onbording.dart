import 'package:e_commerce/common/widgets/button/Elevated_button.dart';
import 'package:e_commerce/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:e_commerce/features/authentication/screens/onbording/widgets/onBoardingNextButton.dart';
import 'package:e_commerce/features/authentication/screens/onbording/widgets/onboardingDot_Navogation.dart';
import 'package:e_commerce/features/authentication/screens/onbording/widgets/onboarding_Skip.dart';
import 'package:e_commerce/features/authentication/screens/onbording/widgets/onboarding_page.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:e_commerce/utils/helpers/device_helpers.dart';
import 'package:flutter/cupertino.dart' as controller;
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(OnBoardingController());

    return Scaffold(
        body: Stack(
      children: [

        //Scrollable Page
        PageView(
controller: controller.pageController,
          onPageChanged: controller.updatePageIndicator,
          children: [
            onboardingpage(
              animation: UImages.onbording1Animation,
              title: UTexts.onBoardingTitle1,
              subTitle: UTexts.onBoardingSubTitle1,
            ),
            onboardingpage(
              animation: UImages.onbording2Animation,
              title: UTexts.onBoardingTitle2,
              subTitle: UTexts.onBoardingSubTitle2,
            ),
            onboardingpage(
              animation: UImages.onbording3Animation,
              title: UTexts.onBoardingTitle3,
              subTitle: UTexts.onBoardingSubTitle3,
            ),
          ],
        ),
        // Indicators

        onBoardingDotNavigation(),
        //Bottom Button
        onboardingNextButton(),
        //Skip Button
        onBoardingSkipButton()
      ],
    ));
  }
}


