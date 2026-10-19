import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:e_commerce/utils/helpers/device_helpers.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class onboardingpage extends StatelessWidget {
  const onboardingpage(
      {super.key,
      required this.animation,
      required this.title,
      required this.subTitle});
  final String animation;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: USizes.defaultSpace,
          left: USizes.defaultSpace,
          top: UDeviceHelper.getAppBarHeight()),
      child: Column(
        children: [
          Lottie.asset(animation),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Text(
            subTitle,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
