import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce/common/widgets/images/rounded_image.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UProductThumbnailAndSlider extends StatelessWidget {
  const UProductThumbnailAndSlider({
    super.key,

  });


  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Container(
      color: dark ? UColors.darkerGrey : UColors.light,
      child: Stack(
        children: [
          /// image thumbnail
          SizedBox(
            height: 400,
            child: Padding(
              padding:
              const EdgeInsets.all(USizes.productImageRadius * 2),
              child: Center(
                  child:
                  Image(image: AssetImage(UImages.product4image))),
            ),
          ),

          ///image Slider
          Positioned(
            left: USizes.defaultSpace,
            right: 0,
            bottom: 30,
            child: SizedBox(
              height: 80.0,
              child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    width: USizes.spaceBtwItems,
                  ),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) => URoundedImage(
                      width: 80,
                      backgroundColor:
                      dark ? UColors.dark : UColors.white,
                      padding: EdgeInsets.all(USizes.sm),
                      border: Border.all(color: UColors.primary),
                      imageUrL: UImages.product5image)),
            ),
          ),
          /// [AppBar] - Back Arrow & Favourite Button
          UAppBar(
            showBackArrow: true,
            actions: [
              UCircularIcon(icon: Iconsax.heart5, color: Colors.red),

            ],
          ),
        ],
      ),
    );
  }
}
