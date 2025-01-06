import 'package:ecommerce/app/app_theme_data.dart';
import 'package:ecommerce/app/controller_binder.dart';
import 'package:ecommerce/features/auth/ui/screens/complete_profile_screen.dart';
import 'package:ecommerce/features/auth/ui/screens/email_verification_screen.dart';
import 'package:ecommerce/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:ecommerce/features/auth/ui/screens/splash_screen.dart';
import 'package:ecommerce/features/category/ui/screens/category_list_screen.dart';
import 'package:ecommerce/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:ecommerce/features/product/ui/screens/product_details_screen.dart';
import 'package:ecommerce/features/product/ui/screens/product_list_screen.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      theme: AppThemeData.LightThemeData,
      initialBinding: ControllerBinder(),
      onGenerateRoute: (RouteSettings setting) {
        late Widget widget;
        if (setting.name == SplashScreen.name) {
          widget = const SplashScreen();
        } else if (setting.name == EmailVerificationScreen.name) {
          widget = const EmailVerificationScreen();
        } else if (setting.name == OtpVerificationScreen.name) {
          widget = const OtpVerificationScreen();
        } else if (setting.name == CompleteProfileScreen.name) {
          widget = const CompleteProfileScreen();
        } else if (setting.name == MainBottomNavScreen.name) {
          widget = const MainBottomNavScreen();
        } else if (setting.name == CategoryListScreen.name) {
          widget = const CategoryListScreen();
        } else if (setting.name == ProductListScreen.name) {
          String name = setting.arguments as String;
          widget = ProductListScreen(categoryName: name);
        } else if (setting.name == ProductDetailsScreen.name) {
          int prductId = setting.arguments as int;
          widget = ProductDetailsScreen(prductId: prductId);
        } 

        return MaterialPageRoute(
          builder: (ctx) {
            return widget;
          },
        );
      },
    );
  }
}
