import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class UBillingAmountSection extends StatelessWidget {
  const UBillingAmountSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        ///subtotal
        Row(
          children: [
            Text("Subtotal" , style: Theme.of(context).textTheme.bodyMedium,),
            Spacer(),
            Text("\$343" , style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        SizedBox(height: USizes.spaceBtwItems/2,),
        /// Shipping Fee
        Row(
          children: [
            Text("Shipping Fee" , style: Theme.of(context).textTheme.bodyMedium,),
            Spacer(),
            Text("\$34" , style: Theme.of(context).textTheme.labelLarge,),
          ],
        ),
        SizedBox(height: USizes.spaceBtwItems/2,),
        /// Tax Fee
        Row(
          children: [
            Text("Tax Fee" , style: Theme.of(context).textTheme.bodyMedium,),
            Spacer(),
            Text("\$34" , style: Theme.of(context).textTheme.labelLarge,),
          ],
        ),
        SizedBox(height: USizes.spaceBtwItems/2,),
        Row(
          children: [
            Text("Order Total" , style: Theme.of(context).textTheme.bodyMedium,),
            Spacer(),
            Text("\$3768" , style: Theme.of(context).textTheme.titleMedium,),
          ],
        )

      ],
    );
  }
}
