import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stroll/core/utils/app_colors.dart';

class PollScreen extends StatefulWidget {
  @override
  _PollScreenState createState() => _PollScreenState();
}

class _PollScreenState extends State<PollScreen> {
  // Initially select the last option (D)
  String selectedOption = 'D';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildPollOption(
              'A',
              'The peace in the early mornings',
              isSelected: selectedOption == 'A',
              onTap: () => setState(() => selectedOption = 'A'),
            ),
            buildPollOption(
              'B',
              'The magical golden hours',
              isSelected: selectedOption == 'B',
              onTap: () => setState(() => selectedOption = 'B'),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildPollOption(
              'C',
              'Wind-down time after dinners',
              isSelected: selectedOption == 'C',
              onTap: () => setState(() => selectedOption = 'C'),
            ),
            buildPollOption(
              'D',
              'The serenity past midnight',
              isSelected: selectedOption == 'D',
              onTap: () => setState(() => selectedOption = 'D'),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildPollOption(String letter, String text,
      {bool isSelected = false, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 166.w,
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xff232A2E),
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
                color:
                    isSelected ? const Color(0xFF8B7EFF) : Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFF8B7EFF)
                      : Colors.white.withOpacity(0.5),
                ),
              ),
              child: Center(
                child: Text(
                  letter,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'ProximaNova',
                    color: MyColor.colorWhite2,
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
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
                  fontFamily: 'ProximaNova',
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
