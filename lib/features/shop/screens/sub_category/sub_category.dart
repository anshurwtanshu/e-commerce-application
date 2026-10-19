import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/products/product_card/product_%20card_horizontal.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';


class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(showBackArrow: true, title: Text("Sports" , style: Theme.of(context).textTheme.headlineSmall,),),
      body: SingleChildScrollView(
        child: Padding(
            padding: UPadding.screenpadding,
          child: Column(
            children: [
              /// Sub Category.....
               USectionHeading(title:  "Sports Shoes", onPressed: (){},),
              SizedBox(height: USizes.spaceBtwSections/2),
              /// horizontal Product card.....
              SizedBox(
                height: 120,
                  child: ListView.separated(
                    separatorBuilder: (context , index)=>SizedBox(width: USizes.spaceBtwItems/2,),
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context , index){
                    return UProductCardHorizontal();
                  })),
              /// Sub Category.....
              USectionHeading(title:  "Sports Shoes", onPressed: (){},),
              SizedBox(height: USizes.spaceBtwSections/2),
              /// horizontal Product card.....
              SizedBox(
                  height: 120,
                  child: ListView.separated(
                      separatorBuilder: (context , index)=>SizedBox(width: USizes.spaceBtwItems/2,),
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context , index){
                        return UProductCardHorizontal();
                      })),
            ],
          ),
        ),
      ),
    );
  }
}

