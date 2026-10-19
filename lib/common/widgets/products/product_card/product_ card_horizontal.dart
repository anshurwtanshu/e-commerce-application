import 'package:e_commerce/common/widgets/custom_shapes/rounded_container.dart';
import 'package:e_commerce/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce/common/widgets/images/rounded_image.dart';
import 'package:e_commerce/common/widgets/texts/brand_title_with_verify_icon.dart';
import 'package:e_commerce/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UProductCardHorizontal extends StatelessWidget {
  const UProductCardHorizontal({
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Container(
      width: 310,
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(USizes.productImageRadius),
        color: dark ? UColors.darkerGrey : UColors.light,
      ),
      child: Row(
        children: [
          /// Left Portion
          URoundedContainer(
            height: 120,
            padding: EdgeInsets.all(USizes.md),
            backgroundColor: dark ? UColors.dark : UColors.light,
            child: Stack(
              children: [
                ///Thumbnail
                SizedBox(
                    width: 100,
                    height: 120,
                    child: URoundedImage(imageUrL: UImages.product4image )),
                ///Discount Tag
                Positioned(top: 12.0,
                  child: URoundedContainer(
                    radius: USizes.sm,
                    backgroundColor: UColors.yellow.withValues(alpha: 0.8),
                    padding: const EdgeInsets.symmetric(horizontal: USizes.sm, vertical: USizes.xs),
                    child: Text("20%" , style: Theme.of(context).textTheme.labelLarge!.apply(color: UColors.black),),
                  ),
                ),

                /// Favourite Button
                Positioned(
                  right: 0,
                  top: 0,
                  child: UCircularIcon(icon:Iconsax.heart5, color: Colors.red),
                )
              ],
            ),
          ),
          /// RIGHT PORTION
SizedBox(
  width: 176.0,

  child: Padding(
    padding: const EdgeInsets.only(left: USizes.md , top:  USizes.md),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// product title
            UProductTitleText(title: "Blue Bata Shoes" , smallsize:  true ,),
            SizedBox(height: USizes.spaceBtwItems/2,),
            /// product brand
            UBrandTitleWithVerifyIcon(title: "Bata"),
          ],
        ),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
  Flexible(child: UProductPriceText(price: "65")),
            ///Add Button
            Container(
                width: USizes.iconLg*1.2,
                height: USizes.iconLg*1.2,
                decoration: BoxDecoration(
                    color: UColors.primary,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(USizes.cardRadiusMd),
                        bottomRight: Radius.circular(USizes.productImageRadius)
                    )
                ),

                child : Icon(Iconsax.add , color: UColors.white,)


            )
          ],
        )
      ],
    )
  ),
)

        ],
      ),
    );
  }
}
