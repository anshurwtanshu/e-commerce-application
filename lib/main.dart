
import 'package:e_commerce/data/repositeries/authentication_repository.dart';
import 'package:e_commerce/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'firebase_options.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Preserve native splash if needed
   FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

 // get Storage initialization
    await GetStorage.init();

  // Keep device in portrait mode
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform).then((value){ Get.put(AuthenticationRepository());},);


  runApp(const MyApp());
}
