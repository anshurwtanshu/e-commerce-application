import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/products/cart/cart_counter_icon.dart';
import 'package:e_commerce/common/widgets/textfields/search_bar.dart';
import 'package:e_commerce/common/widgets/custom_shapes/primary_header_controller.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class UStorePrimaryHeader extends StatelessWidget {
  const UStorePrimaryHeader({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: USizes.storePrimaryHeaderHeight + 10,
        ),

        /// primary Header Container
        ///
        UPrimaryHeaderContainer(
            height: USizes.storePrimaryHeaderHeight,
            child:UAppBar(
              title: Text("Store", style: Theme.of(context).textTheme.headlineMedium!.apply(color: UColors.white),),
              actions: [
                UcartCounterIcon(dark: dark,)
              ],
            )
        ),
        /// Search Bar
        USearch_Bar(),

      ],
    );
  }
}
