import 'package:e_commerce/common/widgets/texts/brand_title_text.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UBrandTitleWithVerifyIcon extends StatelessWidget {
  const UBrandTitleWithVerifyIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textcolor,
    this.iconColor = UColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextsize = TextSizes.small,
  });
  final String title;
  final int maxLines;
  final Color? textcolor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextsize;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: UBrandTitleText(
            title: title,
            maxLines: maxLines,
            textAlign: textAlign,
            brandTextSize: brandTextsize,
            color: textcolor,
          ),
        ),
        SizedBox(width: USizes.xs),
        Icon(
          Iconsax.verify5,
          color: UColors.primary,
          size: USizes.iconXs,
        )
      ],
    );
  }
}

class Textsizes {}
