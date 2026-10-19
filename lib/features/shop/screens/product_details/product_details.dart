import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/button/Elevated_button.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_thumbnail_and%20_slider.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'widgets/product_meta_data.dart' show UProductMetaData;

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Scaffold(
      /// body ................
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// product image with thumbnail
            UProductThumbnailAndSlider(),

            Padding(
              padding:UPadding.screenpadding,
              child: Column(
                children: [
                ///-----[Product Details] Details]--.--
                ///price , title , Stock , And Brand
                UProductMetaData(),
                  SizedBox(
                    height: USizes.spaceBtwSections,
                  ),
                ///Attributes
                UProductAtrributes(),
                SizedBox(
                  height: USizes.spaceBtwSections,
                ),

                ///Checkout  Button
                UElevetedButton(onPressed: () {}, child: Text("Checkout")),
                SizedBox(
                  height: USizes.spaceBtwSections,
                ),

                ///Discription
                USectionHeading(
                  title: "Discription",
                  showActionButton: false,
                ),
                SizedBox(
                  height: USizes.spaceBtwItems,
                ),
                ReadMoreText("This is a product of iphone 15 with 512 GB storage , This is a product of iphone 15 with 512 GB storage,This is a product of iphone 15 with 512 GB storage, This is a product of iphone 15 with 512 GB storage,This is a product of iphone 15 with 512 GB storage",
                  trimLines: 2, trimMode: TrimMode.Line,
                  trimCollapsedText: " Show more",
                  trimExpandedText: " Less",
                  moreStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w800),
                  lessStyle : TextStyle(fontSize: 14.0, fontWeight: FontWeight.w800),),

                SizedBox(
                  height: USizes.spaceBtwSections,
                )
              ],),
            )
          ],
        ),
      ),

      ///.......[Bottom Navigation]...........
       bottomNavigationBar: UBottomAddToCart(),
    );
  }
}
