import 'package:e_commerce/common/widgets/custom_shapes/rounded_container.dart';
import 'package:e_commerce/common/widgets/images/rounded_image.dart';
import 'package:e_commerce/common/widgets/texts/brand_title_with_verify_icon.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UBrandCard extends StatelessWidget {
  const UBrandCard({
    super.key,
    this.showBorder= true,
  this.onTap, 
  }); 
final bool showBorder;
final VoidCallback ?onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: URoundedContainer(
      
          height: USizes.brandCardHeight,
          showBorder: showBorder,
          padding: EdgeInsets.all(USizes.sm),
          backgroundColor: Colors.transparent,
          child: Row(
            children: [
              ///Brand Image
              URoundedImage(imageUrL: UImages.AddidasIcon),
              SizedBox(
                width: USizes.spaceBtwItems / 2,
              ),
      
      /// Right portion
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                
                    ///Brand Name & Verify Icon
                    UBrandTitleWithVerifyIcon(
                      title: "Addidas",
                      brandTextsize: TextSizes.large,
                    ),
                
                    ///text
                    Text("172 Products" , style:  Theme.of(context).textTheme.labelMedium, overflow:TextOverflow.ellipsis,)
                  ],
                ),
              )
            ],
          )),
    );
  }
}
