import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class UBillingAddressSection extends StatelessWidget {
  const UBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
USectionHeading(title: "Billing Address", buttonTitle: "Change" , onPressed: (){},),
        Text("Unknown Pro" , style: Theme.of(context).textTheme.bodyLarge,),

        SizedBox(height: USizes.spaceBtwItems/2,),

        Row(
          children: [
            Icon(Icons.phone, size: USizes.iconSm, color: UColors.grey,),
            SizedBox(width: USizes.spaceBtwItems,),
            Text("+92 9625465408")
          ],
        ),
        Row(
          children: [
            Icon(Icons.location_history, size: USizes.iconSm, color: UColors.grey,),
            SizedBox(width: USizes.spaceBtwItems,),
            Expanded(child: Text("House No.295 , Hyderabad , Singh ,Pakistan", softWrap: true,))
          ],
        ),
      ],
    );
  }
}
