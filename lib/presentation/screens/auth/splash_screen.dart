import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stroll/core/utils/app_colors.dart';
import 'package:stroll/core/utils/dimensions.dart';
import 'package:stroll/core/utils/theme_utils.dart';
import 'package:stroll/presentation/screens/auth/onboardscreen.dart';

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

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const OnboardingScreen(),
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
          child: Container(),
        ));
  }
}
