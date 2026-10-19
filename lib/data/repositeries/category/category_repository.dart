import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/features/shop/models/category_model.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart' as dio hide Response;
import '../../../utils/constants/keys.dart';
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../services/cloudinary_services.dart';
import 'package:dio/dio.dart' as dio;

class CategoryRepository extends GetxController{
  static CategoryRepository get instance => Get.find();

  /// variables
final _db = FirebaseFirestore.instance;
final _cloudinaryServices = Get.put(CloudinaryServices());


///[Upload category] - Function to upload  List of category

Future<void>uploadCategories(List<CategoryModel>categories)async{
  try{

    for(final category in categories){

      File image = await UHelperFunctions.assetToFile(category.image);
 dio.Response response= await _cloudinaryServices.uploadImage(image, Ukeys.categoryFolder);
 if(response.statusCode==200){
   category.image= response.data["url"];
 }
     await _db.collection(Ukeys.categoryCollection).doc(category.id).set(category.toJson());
    }



  } on FirebaseAuthException catch (e) {
    throw UFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e) {
    throw UFirebaseAuthException(e.code).message;
  } on FormatException catch (e) {
    throw UFormatException();
  } on PlatformException catch (e) {
    throw UPlatformException(e.code).message;
  } catch (e) {
    throw "Something went wrong. Please try again";
  }
}
}
