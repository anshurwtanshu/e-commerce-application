import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/button/Elevated_button.dart';
import 'package:e_commerce/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:e_commerce/features/shop/screens/checkout/checkout.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Scaffold(
      ///........[AppBar]........
      appBar: UAppBar(showBackArrow: true, title: Text("Cart" , style: Theme.of(context).textTheme.headlineMedium ),),
      ///........[Body]..........
      body: Padding(
        padding: UPadding.screenpadding,
        child: UcartItems(dark: dark),
      ),

      ///.......[Bottom Navigation]......
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(USizes.defaultSpace),
        child: UElevetedButton(
            onPressed: ()=>Get.to(()=>CheckoutScreen()), child: Text("Checkout \$263527")),
      ),
    );
  }
}



