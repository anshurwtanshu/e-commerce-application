import 'package:e_commerce/features/shop/screens/cart/cart.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:iconsax/iconsax.dart';

class UcartCounterIcon extends StatelessWidget {
  const UcartCounterIcon({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {

    bool dark =UHelperFunctions.isDarkMode(context);

    return Stack(
      children: [
        IconButton(
          onPressed: ()=>Get.to(()=>CartScreen()),
          icon: const Icon(Iconsax.shopping_bag),
          color: UColors.light,
        ),
        Positioned(
          right: 6.0,
          child: Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
                color: dark ? UColors.dark : UColors.light,
                shape: BoxShape.circle),
            child: Center(
              child: Text(
                "2",
                style: Theme.of(context).textTheme.labelLarge!.apply(
                    fontSizeFactor: 0.8,
                    color: dark ? UColors.light : UColors.dark),
              ),
            ),
          ),
        )
      ],
    );
  }
}

