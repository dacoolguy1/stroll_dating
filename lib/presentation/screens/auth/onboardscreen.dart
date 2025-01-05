import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stroll/core/utils/app_colors.dart';
import 'package:stroll/presentation/screens/auth/component/bottomnav.dart';
import 'package:stroll/presentation/screens/auth/component/polloptions.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            padding: EdgeInsets.zero, // Explicitly remove padding
            margin: EdgeInsets.zero, // Explicitly remove margin

            child: Column(
              children: [
                Expanded(
                  flex: 55,
                  child: SizedBox.expand(
                    child: Image.asset(
                      'assets/images/sunset_lake.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  flex: 45, // 45% of the height
                  child: Container(
                    width: double.infinity,
                    color: const Color(0xFF010101),
                  ),
                ),
              ],
            ),
          ),
          // Content
          SafeArea(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Stroll Bonfire',
                      style: TextStyle(
                        fontSize: 34,
                        fontFamily:
                            'ProximaNova', // Ensure this font is added to your assets
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFCCC8FF), // Matches background color
                        height: 41.41 / 34, // Line-height divided by font size
                        decoration: TextDecoration.underline,
                        decorationColor:
                            Color(0xFFB3ADF6), // Matches border color
                        decorationThickness: 0.32, // Matches border thickness
                        shadows: [
                          Shadow(
                            blurRadius: 7.9,
                            color:
                                Color(0x33000000), // #00000033 in ARGB format
                            offset: Offset(0, 0),
                          ),
                          Shadow(
                            blurRadius: 2,
                            color: Color(0xFFBEBEBE), // Light gray shadow
                            offset: Offset(0, 0),
                          ),
                          Shadow(
                            blurRadius: 2,
                            color:
                                Color(0x8024232F), // #24232F80 in ARGB format
                            offset: Offset(
                                0, 1), // Mimics "box-shadow: 0px 1px 2px"
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white, // #CBC9FF in ARGB
                      // width: 1.5,
                      // weight: 1.5, // #CBC9FF in ARGB
                      shadows: [
                        BoxShadow(
                          color: Color(0x80000000), // #00000080 in ARGB format
                          blurRadius: 0.3,
                          offset: Offset(
                              0, 0.3), // Mimics "box-shadow: 0px 0.3px 0.3px"
                        ),
                      ],
                    ),
                  ],
                ),
                // const Spacer(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.access_time,
                        color: Colors.white, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      '22h 00m',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily:
                            'ProximaNova', // Ensure this font is added to your assets
                        fontWeight: FontWeight.w600,
                        shadows: [
                          Shadow(
                            blurRadius: 10.0,
                            color: Colors.black.withOpacity(0.3),
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.people_outline,
                        color: Colors.white, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      '103',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily:
                            'ProximaNova', // Ensure this font is added to your assets
                        fontWeight: FontWeight.w600,

                        shadows: [
                          Shadow(
                            blurRadius: 10.0,
                            color: Colors.black.withOpacity(0.3),
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const Spacer(),

                // Poll Container
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Profile and Question
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundImage:
                                AssetImage('assets/images/profile.png'),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Angelina, 28',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily:
                                      'ProximaNova', // Ensure this font is added to your assets

                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 10.0,
                                      color: Colors.black.withOpacity(0.3),
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                'What is your favorite time \nof the day?',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily:
                                      'ProximaNova', // Ensure this font is added to your assets

                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 10.0,
                                      color: Colors.black.withOpacity(0.3),
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Center(
                        child: Text(
                          '"Mine is definitely the peace in the morning."',
                          style: TextStyle(
                            color: Color(0xffCBC9FF).withOpacity(0.7),
                            fontSize: 16.sp,
                            fontFamily:
                                'ProximaNova', // Ensure this font is added to your assets
                            fontStyle: FontStyle.italic,
                            shadows: [
                              Shadow(
                                blurRadius: 10.0,
                                color: Colors.black.withOpacity(0.3),
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Poll Options
                      PollScreen(),
                      const SizedBox(height: 24),
                      // Bottom text and buttons
                      Row(
                        children: [
                          Text(
                            'Pick your option.\nSee who has a similar mind.',
                            style: TextStyle(
                              color: MyColor.colorWhite3,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              fontFamily:
                                  'ProximaNova', // Ensure this font is added to your assets

                              shadows: [
                                Shadow(
                                  blurRadius: 10.0,
                                  color: Colors.black.withOpacity(0.3),
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(Icons.mic, color: Colors.white),
                          ),
                          const SizedBox(width: 12),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color(0xFF8B7EFF),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(Icons.arrow_forward,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                CustomBottomBar(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
