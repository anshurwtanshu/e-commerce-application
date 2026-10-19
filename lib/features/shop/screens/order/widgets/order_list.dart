import 'package:e_commerce/common/widgets/custom_shapes/rounded_container.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UOrderListItems extends StatelessWidget {
  const UOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
              height: USizes.spaceBtwItems,
            ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return URoundedContainer(
            showBorder: true,
            backgroundColor: dark ? UColors.dark : UColors.light,
            padding: EdgeInsets.all(USizes.md),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// 1.........Row
                Row(
                  children: [
                    /// ship icon
                    Icon(Iconsax.ship),
                    SizedBox(
                      width: USizes.spaceBtwItems / 2,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// title
                          Text(
                            "processing",
                            style: Theme.of(context).textTheme.bodyLarge!.apply(
                                color: UColors.primary, fontSizeDelta: 1),
                          ),

                          /// Date
                          Text("01  Jan 2027",
                              style: Theme.of(context).textTheme.headlineSmall),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Iconsax.arrow_right_34,
                          size: USizes.iconSm,
                        ))
                  ],
                ),

                /// 2........Row
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          /// Tag Icon
                          Icon(Iconsax.tag),
                          SizedBox(
                            width: USizes.spaceBtwItems / 2,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ///order
                                Text("Order",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium),

                                /// order value
                                Text(" 46543",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          /// calender Icon
                          Icon(Iconsax.calendar),
                          SizedBox(
                            width: USizes.spaceBtwItems / 2,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /// Shipping Date
                                Text("Shipping Date ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium),

                                /// Date
                                Text("06 jan 2026",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}
