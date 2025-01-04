import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stroll/core/utils/app_colors.dart';

Widget buildPollOption(String letter, String text, {bool isSelected = false}) {
  return Container(
    width: 166.w,
    height: 70,
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
    decoration: BoxDecoration(
      color: Color(0xff232A2E),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: Colors.white.withOpacity(0.2),
      ),
    ),
    child: Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF8B7EFF) : Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(
                color: isSelected
                    ? const Color(0xFF8B7EFF)
                    : Colors.white.withOpacity(0.5)),
          ),
          child: Center(
            child: Text(
              letter,
              style: TextStyle(
                fontSize: 12,
                fontFamily:
                    'ProximaNova', // Ensure this font is added to your assets

                color: MyColor.colorWhite2,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: MyColor.colorWhite2,
              fontSize: 14,
              fontFamily:
                  'ProximaNova', // Ensure this font is added to your assets

              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ],
    ),
  );
}
