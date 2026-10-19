import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/button/Elevated_button.dart';
import 'package:e_commerce/common/widgets/custom_shapes/rounded_container.dart';
import 'package:e_commerce/common/widgets/screens/success_screen.dart';
import 'package:e_commerce/common/widgets/textfields/promo_code.dart';
import 'package:e_commerce/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:e_commerce/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:e_commerce/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:e_commerce/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:e_commerce/utils/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return  Scaffold(
      ///..........[AppBar].......
      appBar: AppBar(automaticallyImplyLeading: false,
        title: Text("Order Review" , style: Theme.of(context).textTheme.headlineSmall),),
      ///.......[Body].......
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenpadding,
          child: Column(
            children: [
             /// Items
              UcartItems(showAddRemoveButtons: false, dark: dark,),
              SizedBox(height: USizes.spaceBtwItems,),
              ///promo code - TextField
              UPromoCodeField(),
SizedBox(height: USizes.spaceBtwSections,),
              ///Billing Section
              URoundedContainer(
                showBorder:true,
                padding :EdgeInsets.all(USizes.md),
                backgroundColor: Colors.transparent,
child: Column(
  children: [
    ///Amount
    UBillingAmountSection(),
    SizedBox(height: USizes.spaceBtwItems,),
    /// Payment
    UBillingPaymentSection(),
    SizedBox(height: USizes.spaceBtwItems,),
    ///Address
    UBillingAddressSection(),
  ]
),
              )
            ],
          ),
        ), 
      ),
      /// Bottom Navigation Bar
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(USizes.defaultSpace),
        child: UElevetedButton(
            onPressed: ()=>Get.to(()=>SuccessScreen(title: "payment Success", subTitle: "Your items will be shipped Soon!", image: UImages.successfulPaymentIcon, onTap:()=>Get.offAll(()=>NavigationMenu()))),
            child: Text("Checkout \$263527")),
      ),
    );
  }
}


