import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: const Color(0xff0f1116),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Replace Icon with SVG
          SvgPicture.asset(
            'assets/icons/gift.svg',
            color: Colors.white,
            width: 24,
            height: 24,
          ),
          SvgPicture.asset(
            'assets/icons/bonfire.svg',
            color: Colors.white,
            width: 24,
            height: 24,
          ),
          Stack(
            children: [
              SvgPicture.asset(
                'assets/icons/chat.svg',
                color: Colors.white,
                width: 24,
                height: 24,
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Color(0xFF8B7EFF),
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    '10',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 5,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Icon(Icons.person_outline, color: Colors.white),
        ],
      ),
    );
  }
}
