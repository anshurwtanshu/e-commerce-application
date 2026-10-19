import 'package:e_commerce/common/style/shadow.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/texts.dart' show UTexts;

class USearch_Bar extends StatelessWidget {
  const USearch_Bar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool dark = UHelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: 0,
      right: USizes.spaceBtwSections,
      left: USizes.spaceBtwSections,
      child: Container(
        height: USizes.searchBarHeight,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(USizes.borderRadiusLg),
            color: dark ? UColors.dark : UColors.light,
            boxShadow: UShadow.searchBarShadow),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: USizes.md),
          child: Row(
            children: [
              /// SEARCH ICON
              Icon(
                Iconsax.search_normal,
                color: UColors.darkerGrey,
              ),
              SizedBox(
                width: USizes.spaceBtwItems,
              ),

              /// SEARCHBAR TITLE
              Text(
                UTexts.searchBarTitle,
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}
