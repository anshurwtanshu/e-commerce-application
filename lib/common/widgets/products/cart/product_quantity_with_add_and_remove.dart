import 'package:e_commerce/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UProductQuantityWithAddandRemove extends StatelessWidget {
  const UProductQuantityWithAddandRemove({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        ///Increment Button
        UCircularIcon(
          icon: Iconsax.minus , width: 32, height: 32,
          size: USizes.iconSm,
          color: dark? UColors.white:UColors.black,
          backgroundColor: dark? UColors.darkGrey:UColors.light,
        ),
        SizedBox( width: USizes.spaceBtwItems,),
        ///counter Text
        Text(
          "2" , style: Theme.of(context).textTheme.titleSmall,),
        SizedBox( width: USizes.spaceBtwItems,),
        /// Decrement Button
        UCircularIcon(
          icon: Iconsax.add , width: 32, height: 32,
          size: USizes.iconSm,
          color: UColors.white,
          backgroundColor: UColors.primary,
        )
      ],
    );
  }
}
