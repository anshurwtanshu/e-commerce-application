import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/custom_shapes/rounded_container.dart';
import 'package:e_commerce/common/widgets/images/circular_image.dart';
import 'package:e_commerce/common/widgets/texts/brand_title_with_verify_icon.dart';
import 'package:e_commerce/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class UProductMetaData extends StatelessWidget {
  const UProductMetaData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// Sale Tag, Sale price, Actual Price And Share Button
        Row(
          children: [
            URoundedContainer(
              radius: USizes.sm,
              backgroundColor: UColors.yellow.withValues(alpha: 0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: USizes.sm, vertical: USizes.xs),
              child: Text(
                "20%",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: UColors.black),
              ),
            ),
            SizedBox(width: USizes.spaceBtwItems),
            ///sale price
            Text(
              "\$250",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            SizedBox(width: USizes.spaceBtwItems),

            ///Actual Price
            UProductPriceText(
              price: "150",
              isLarge: true,
            ),
            Spacer(),

            ///Share Button
            IconButton(onPressed: () {}, icon: Icon(Icons.share)),
          ],
        ),
        SizedBox(height: USizes.spaceBtwItems/1.5,),

        ///product title
        UProductTitleText(title: "Apple iphone 11"),
        SizedBox(height: USizes.spaceBtwItems/1.5,),

        /// product status
        Row(
          children: [
            UProductTitleText(title: "Status"),
            SizedBox(width: USizes.spaceBtwItems,),
            Text("In  Stock" , style: Theme.of(context).textTheme.titleMedium,)
          ],
        ),
        SizedBox(height: USizes.spaceBtwItems/1.5,),

        /// Product Brand Image With Title
        Row(
          children: [
            ///Brand Image
            UCircularImage(
              padding: 0,
              image: UImages.product4image , width: 32.0 ,height: 32.0,),
            SizedBox(width: USizes.spaceBtwItems,),
            ///Brand Title
            UBrandTitleWithVerifyIcon(title: "Apple")
          ],
        )
      ],
    );
  }
}
