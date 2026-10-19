import 'package:e_commerce/common/widgets/custom_shapes/circular_container.dart';
import 'package:e_commerce/common/widgets/image_text/vertical%20_image_text.dart';
import 'package:e_commerce/features/shop/screens/sub_category/sub_category.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UHomeCategories extends StatelessWidget {
  const UHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: USizes.spaceBtwSections),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            UTexts.popularCategories,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: UColors.white),
          ),
          SizedBox(
            height: USizes.spaceBtwItems ,
          ),

          SizedBox(
            height: 90,

            /// category listview
            child: ListView.separated(
              separatorBuilder: (context, index)=>SizedBox(width: USizes.spaceBtwItems,),
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return UVerticalImageText(title: 'Sports Categories', image:UImages.bagsIcon, textColor: UColors.white, onTap: ()=>Get.to(()=>SubCategoryScreen()),);
                }),
          )

        ],
      ),
    );
  }
}

