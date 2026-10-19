import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/brands/brand_card.dart';
import 'package:e_commerce/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import 'brand_products.dart';

class BrandScreen extends StatelessWidget {
  const BrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
         title: Text("Brand" , style: Theme.of(context).textTheme.headlineSmall,),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenpadding,
          child: Column(
            children: [
              /// Text Brands
        USectionHeading(title: "Brands" , showActionButton: false),
              SizedBox(height: USizes.spaceBtwItems,),

                /// List of Brands
               GridViewLayout(itemCount: 10, itemBuilder: (context , index)=>UBrandCard(onTap:()=>Get.to(()=>BrandProductsScreen(),),), mainAxisCount: 70)
            ],
          ),
        ),
      ),
    );
  }
}
