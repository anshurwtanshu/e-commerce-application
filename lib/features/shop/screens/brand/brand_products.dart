 import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/brands/brand_card.dart';
import 'package:e_commerce/common/widgets/products/sortable_products.dart';
import 'package:e_commerce/features/shop/screens/all_products/all_products.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BrandProductsScreen extends StatelessWidget {
   const BrandProductsScreen({super.key});

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: UAppBar(
         showBackArrow: true,
         title: Text("Addidas" , style: Theme.of(context).textTheme.headlineSmall,),
       ),
       body: SingleChildScrollView(
         child: Padding(padding: UPadding.screenpadding,
         child: Column(children: [
           ///brand
UBrandCard(),

           SizedBox(height: USizes.spaceBtwSections,),
           /// brand products
           USortableProducts(),
         ],),),
       ),
     );
   }
 }
