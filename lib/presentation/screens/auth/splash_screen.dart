import 'package:flutter/material.dart';
import 'package:letsbrunch/core/utils/app_colors.dart';
import 'package:letsbrunch/core/utils/dimensions.dart';
import 'package:flutter_svg/svg.dart';
import 'package:letsbrunch/core/utils/theme_utils.dart';
import 'package:letsbrunch/presentation/screens/Auth/onboardscreen.dart';
import 'package:get_storage/get_storage.dart';
import 'package:letsbrunch/presentation/screens/auth/onboardscreen2.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void dispose() {
    ThemeUtil.allScreenTheme();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(
        const Duration(seconds: 2),
        () {
          // GetStorage().remove('viewedOnboarding');

          bool viewedOnboarding = GetStorage().hasData('viewedOnboarding');
          print(viewedOnboarding);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => viewedOnboarding
                  ? OnboardingScreen2()
                  : const OnboardingScreen(),
            ),
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.primaryColor,
      // controller.noInternet ? MyColor.colorWhite : MyColor.colorWhite,
      body: Center(
        child: SvgPicture.asset("assets/svg/logo.svg",
            height: Dimensions.appLogoHeight, width: Dimensions.appLogoWidth),
      ),
    );
  }
}
