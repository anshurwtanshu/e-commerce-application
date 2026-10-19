 import 'package:e_commerce/common/widgets/chips/choice_chip.dart';
import 'package:e_commerce/common/widgets/custom_shapes/rounded_container.dart';
import 'package:e_commerce/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UProductAtrributes extends StatelessWidget {
  const UProductAtrributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Column(
        children: [

          /// Selected Attributes Pricing and Description
          URoundedContainer(
            padding: EdgeInsets.all(USizes.md),
            backgroundColor: dark ? UColors.darkGrey : UColors.grey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// Title, Price & Stock
                Row(

                  /// [Text] - Variation Heading
                  children: [
                    USectionHeading(
                      title: "Variation", showActionButton: false,),
                    SizedBox(width: USizes.spaceBtwItems,),
                    Column(
                      children: [

                        /// Price, Sale Price, Actual Price
                        Row(
                          children: [

                            ///[TExt Price]
                            UProductTitleText(
                              title: "price : ", smallsize: true,),

                            /// [Actual Price]
                            Text("250", style: Theme
                                .of(context)
                                .textTheme
                                .titleSmall!
                                .apply(
                                decoration: TextDecoration.lineThrough),),
                            SizedBox(width: USizes.spaceBtwItems,),

                            ///Sale Price
                            UProductPriceText(price: "200",)
                          ],
                        ),

                        ///Stock Status
                        Row(
                          children: [
                            UProductTitleText(
                              title: "Stock : ", smallsize: true,),
                            Text("In Stock", style: Theme
                                .of(context)
                                .textTheme
                                .titleMedium),
                          ],
                        )
                      ],
                    )
                  ],


                ),

                /// Attribute Description
                UProductTitleText(
                  title: "This Product is iphone 11 with 512GB",
                  smallsize: true,
                  maxLines: 4,)
              ],
            ),
          ),
          SizedBox(height: USizes.spaceBtwItems,),

          ///Attributes
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              USectionHeading(title: "Colors", showActionButton: false),
              SizedBox(height: USizes.spaceBtwItems / 2),
             Wrap(
               spacing: USizes.sm,
               children: [
                 UChoiceChip(
                 text: "Red",
                 selected: true,
                 onSelected: (value) {},
               ),
                 UChoiceChip(
                   text: "Orange",
                   selected: false,
                   onSelected: (value) {},
                 ),
                 UChoiceChip(
                   text: "Yellow",
                   selected: false,
                   onSelected: (value) {},
                 ),
               ],
             )
            ],
          ),
          ///Sizes
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              USectionHeading(title: "Sizes", showActionButton: false),
              SizedBox(height: USizes.spaceBtwItems / 2),
              Wrap(
                spacing: USizes.sm,
                children: [
                  UChoiceChip(
                    text: "Small",
                    selected: true,
                    onSelected: (value) {},
                  ),
                  UChoiceChip(
                    text: "Medium",
                    selected: false,
                    onSelected: (value) {},
                  ),
                  UChoiceChip(
                    text: "Large",
                    selected: false,
                    onSelected: (value) {},
                  ),
                ],
              )
            ],
          )
        ]
    );
  }
}

