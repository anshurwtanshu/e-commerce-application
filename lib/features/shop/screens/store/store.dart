import 'package:e_commerce/common/widgets/appbar/tabbar.dart';
import 'package:e_commerce/common/widgets/brands/brand_card.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/shop/screens/brand/all_brands.dart';
import 'package:e_commerce/features/shop/screens/store/widgets/category_tab.dart';
import 'package:e_commerce/features/shop/screens/store/widgets/store_primary_header.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);

    return DefaultTabController(
      length: 5,
      child: Scaffold(
          body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: 340,
              pinned: true,
              floating: false,
              flexibleSpace: SingleChildScrollView(
                child: Column(
                  children: [
                    ///Primary Header
                    UStorePrimaryHeader(
                      dark: dark,
                    ),
                    SizedBox(height: USizes.spaceBtwItems),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: USizes.defaultSpace),
                      child: Column(
                        children: [
                          /// Brand Heading
                          USectionHeading(
                            title: "Brands",
                            onPressed: ()=>Get.to(()=>BrandScreen()),
                          ),

                          /// Brand Card
                          SizedBox(
                            height: USizes.brandCardHeight,
                            child: ListView.separated(
                                separatorBuilder: (context, index) => SizedBox(
                                      width: USizes.spaceBtwItems,
                                    ),
                                itemCount: 10,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => SizedBox( width: USizes.brandCardWidth,child: UBrandCard())),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              bottom: UTabBar(
                tabs: [
                  Tab(child: Text("Sports")),
                  Tab(child: Text("Furniture")),
                  Tab(child: Text("Electronics")),
                  Tab(child: Text("Clothes")),
                  Tab(child: Text("Cosmetic")),
                ],
              ),
            )
          ];
        },
        body: TabBarView(children: [
          UCategoryTab(),
          UCategoryTab() ,
          UCategoryTab(),
          UCategoryTab(),
          UCategoryTab()
        ]),
      )),
    );
  }
}

