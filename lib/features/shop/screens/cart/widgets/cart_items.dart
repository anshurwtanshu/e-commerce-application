import 'package:e_commerce/common/widgets/products/cart/cart_item.dart';
import 'package:e_commerce/common/widgets/products/cart/product_quantity_with_add_and_remove.dart';
import 'package:e_commerce/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class UcartItems extends StatelessWidget {
  const UcartItems({
    this.showAddRemoveButtons= true,
    super.key, required bool dark,
  });

final bool showAddRemoveButtons;
  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
        separatorBuilder: (context, index)=>SizedBox(height: USizes.spaceBtwItems,),
        itemCount: 2,
        itemBuilder: (context, index) {
          return Column(
            children: [
              /// cart Item
              UCartItem(dark:  dark),
            if(showAddRemoveButtons)  SizedBox(height: USizes.spaceBtwItems,),
              /// price , Counter Buttons
           if(showAddRemoveButtons)Row(
                children: [

                  ///Extra Space
                  SizedBox(width: 70.0,),

                  ///Quantity Buttons
                  UProductQuantityWithAddandRemove(),
                  Spacer(),

                  ///Product Price
                  UProductPriceText(price: "323")
                ],
              )

            ],
          );
        }

    );
  }
}
