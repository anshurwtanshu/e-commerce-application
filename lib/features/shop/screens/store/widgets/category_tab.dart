import 'package:e_commerce/common/widgets/brands/brand_showcase.dart';
import 'package:e_commerce/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class UCategoryTab extends StatelessWidget {
  const UCategoryTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(USizes.defaultSpace),
          child: Column(
            children: [
              /// Brand Showcase 1
              UBrandShowcase(images: [
                UImages.product5image,
                UImages.product2image,
                UImages.product4image
              ]),
              /// Brand Showcase 2
              UBrandShowcase(images: [
                UImages.product5image,
                UImages.product2image,
                UImages.product4image
              ]),
              SizedBox(
                height: USizes.spaceBtwItems,
              ),

              /// You might like Section Heading
              USectionHeading(title: "you might like", onPressed: () {}),

              /// Grid Layout Product
              GridViewLayout( itemCount: 4,
                  itemBuilder: (context, index){
                    return UProductCardVertical();
                  }
              ),
              SizedBox(height: USizes.spaceBtwItems,)

            ],
          ),
        ),
      ],
    );
  }
}
