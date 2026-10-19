import 'package:e_commerce/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:e_commerce/common/widgets/textfields/search_bar.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/shop/controller/home/home_controller.dart';
import 'package:e_commerce/features/shop/screens/all_products/all_products.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/home_categories.dart';
import 'package:e_commerce/common/widgets/custom_shapes/primary_header_controller.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/promo_Slider.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    bool dark = UHelperFunctions.isDarkMode(context);

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          ///Upper Part
          Stack(
              children: [
            /// Total Height +20
            SizedBox(
              height: USizes.homePrimaryHeaderHeight + 10,
            ),

            /// primary Header Container
            ///
            UPrimaryHeaderContainer(
                height: USizes.homePrimaryHeaderHeight,
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///App Bar
                UHomeAppbar(dark: dark),
                SizedBox(
                  height: USizes.spaceBtwSections,
                ),

                UHomeCategories()
              ],
            )),

            /// Search Bar
            USearch_Bar()
          ]),

          ///Lower Part

          /// cards using carouselSlider

          Padding(
            padding: const EdgeInsets.all(USizes.defaultSpace),
            child: Column(children: [
              ///Banners
              UPromoSlider(
                banners: [
                  UImages.homeBanner1,
                  UImages.homeBanner2,
                  UImages.homeBanner3,
                  UImages.homeBanner4,
                  UImages.homeBanner5
                ],
              ),

              ///section Heading
              const SizedBox(
                height: USizes.spaceBtwSections,
              ),
              USectionHeading(
                title: 'Popular Products',
                onPressed: ()=>Get.to(()=>AllProductsScreen()),
              ),
              const SizedBox(
                height: USizes.spaceBtwItems,
              ),

              ///Vertical Product Card
              GridViewLayout(
                itemCount: 10,
                mainAxisCount: 288,
                itemBuilder: (context, index) {
                  return UProductCardVertical();
                },
              )
            ]),
          )
        ],
      ),
    ));
  }
}
