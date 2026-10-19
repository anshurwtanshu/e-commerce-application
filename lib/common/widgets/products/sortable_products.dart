import 'package:e_commerce/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class USortableProducts extends StatelessWidget {
  const USortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Filter Field
        DropdownButtonFormField(
          decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) {},
          items: [
            "Name",
            "Lower Price",
            "Higher Price",
            "Sale",
            "Newest "
          ].map(
                (filter) {
              return DropdownMenuItem(child: Text(filter), value: filter);
            },
          ).toList(),
        ),
        SizedBox(height: USizes.spaceBtwSections,),
        /// Products
        GridViewLayout(itemCount: 8 , itemBuilder: (context , index)=> UProductCardVertical(),)
      ],
    );
  }
}
