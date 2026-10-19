import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/button/Elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/sizes.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      ///ApppBar
      appBar: UAppBar( showBackArrow: true, title: Text("Add New Address" ,style: Theme.of(context).textTheme.headlineMedium,),),
      /// Body
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenpadding,
child: Column(
  children: [
    ///Name
    TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.user), labelText: "Name"),),
/// Phone Number
    SizedBox(height: USizes.spaceBtwInputFields,),
    TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.mobile), labelText: "phone no"),),
    SizedBox(height: USizes.spaceBtwInputFields,),
Row(
  children: [
    Expanded(child: TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.building1), labelText: "Street"),)),
    SizedBox(width: USizes.spaceBtwItems,),

    Expanded(child: TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.code), labelText: "Postal Code"),)),

  ],
),
    SizedBox(height: USizes.spaceBtwInputFields,),
    Row(
      children: [
        Expanded(child: TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.building), labelText: "city"),)),
        SizedBox(width: USizes.spaceBtwItems,),

        Expanded(child: TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.activity), labelText: "State"),)),

      ],
    ),
    SizedBox(height: USizes.spaceBtwInputFields,),
    TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.global), labelText: "Country"),),
    SizedBox(height: USizes.spaceBtwSections,),

    UElevetedButton(onPressed: (){} , child: Text("Save"))

  ]
),
      ),
      )
    );
  }
}
