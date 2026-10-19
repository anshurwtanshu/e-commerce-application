import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/button/Elevated_button.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:e_commerce/utils/helpers/device_helpers.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {

  const SuccessScreen({super.key, required this.title, required this.subTitle, required this.image, required this.onTap});
final String title , subTitle , image;
final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(
      ),

body: SingleChildScrollView(
  child: Padding(
    padding: UPadding.screenpadding,
    child: Column(
      children: [
        ///image
        Image.asset(image, height: UDeviceHelper.getScreenWidth(context)*0.6),
        SizedBox(height: USizes. spaceBtwItems),
        ///Subtitle
        ///
        ///Title
        Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
        SizedBox(height: USizes. spaceBtwItems),
        ///Subtitle
        Text(subTitle, style: Theme.of(context).textTheme.bodySmall, textAlign: TextAlign.center,),
        SizedBox(height: USizes. spaceBtwItems),
        ///continue
        UElevetedButton(onPressed:onTap, child: Text(UTexts.uContinue))
      ],
    ),
  ),
),
    );
  }
}
