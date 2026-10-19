import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/data/repositeries/authentication_repository.dart';
import 'package:e_commerce/data/services/cloudinary_services.dart';
import 'package:e_commerce/utils/constants/keys.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../features/authentication/models/user_model.dart';
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import 'package:dio/dio.dart' as dio;

class UserRepository  extends GetxController {
  static UserRepository get instance => Get.find();

  /// variables
  final _db = FirebaseFirestore.instance;
final _cloudinaryServices = Get.put(CloudinaryServices());
  /// function to store User  Data

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection(Ukeys.userCollection).doc(user.id).set(
          user.toJson());
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


///[Read]- Function to fetch user details based on current user
Future<UserModel> fetchUserDetails() async{
  try{
 final documentSnapshot = await _db.collection(Ukeys.userCollection).doc(AuthenticationRepository.instance.currentUser!.uid).get();
 if(documentSnapshot.exists){
   UserModel user= UserModel.fromSnapshot(documentSnapshot);
return user;
 }
return UserModel.empty();

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


  ///update]- Function to update  user single field
  Future<void> updateSingleField(Map<String, dynamic> map) async{
    try{

await _db.collection(Ukeys.userCollection).doc(AuthenticationRepository.instance.currentUser!.uid).update(map);
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

  ///Delete ]- Function to Delete  user single field
  Future<void> removeUserRecord(String UserId) async{
    try{
    await _db.collection(Ukeys.userCollection).doc(UserId).delete();
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

  /// [UploadImage] - Function to upload user profile picture
  Future<dio.Response> uploadImage(File image) async{
    try{
     dio.Response response= await _cloudinaryServices.uploadImage(image, Ukeys.profileFolder);
      return response;

    }catch(e){
     throw"Failed to upload profile picture . Please try again";
    }
  }

  /// [DeleteImage] - Function to delete profile picture
  Future<dio.Response>deleteProfilePicture(String publicId)async{
    try{
    dio.Response response= await _cloudinaryServices.deleteImage(publicId);
      return response;

    }catch(e){
      throw "Something went wrong. Please try again!";
    }
  }
  }
