import 'package:e_commerce/common/widgets/custom_shapes/rounded_container.dart';
import 'package:e_commerce/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce/common/widgets/images/rounded_image.dart';
import 'package:e_commerce/common/widgets/texts/brand_title_with_verify_icon.dart';
import 'package:e_commerce/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce/features/shop/screens/product_details/product_details.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:iconsax/iconsax.dart';

import '../../../style/shadow.dart';

class UProductCardVertical extends StatelessWidget {
  const  UProductCardVertical({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final dark = UHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () =>Get.to(()=>ProductDetailsScreen()),
      child: Container(

        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: UShadow.verticalProductsShadow,
          borderRadius: BorderRadius.circular(USizes.productImageRadius),
          color: dark ? UColors.darkGrey:UColors.white
        ),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             ///Thumbnail / Favourite Button  / Discount tag
        URoundedContainer(
      height: 180,
      padding: const EdgeInsets.all(USizes.sm),
      backgroundColor: dark ?UColors.dark : UColors.light,
      child: Stack(
      children: [
        /// thumbnail
      Center(child: URoundedImage(imageUrL: UImages.product2image,)),
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
      
             SizedBox(height: USizes.spaceBtwItems/2),

             ///product details
             Padding(
               padding: const EdgeInsets.only(left: USizes.sm),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [

                   ///product title
                   UProductTitleText(title: 'Blue Bata Shoes', smallsize: true,),
                   SizedBox(height: USizes.spaceBtwItems/2,),


               ///product brand
                   UBrandTitleWithVerifyIcon(title: 'Bata',),
                   /// Product Price & Add Button

                 ],
               ),
             ),

             Spacer(),

             /// product price and button
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween ,
               children: [

                 /// product price
                 UProductPriceText( price: "65",),

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
         ),
      ),
    );
  }
}




