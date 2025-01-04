import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stroll/core/utils/app_colors.dart';

class DefaultBtn extends StatelessWidget {
  final Color color; // Background color (can override gradient)
  final Color textColor; // Text color
  final String text; // Button label
  final double radius; // Border radius
  final Function() press; // On-tap function
  final double width; // Button width
  final double fontsize; // Font size for the text
  final double height; // Button height
  final bool isGradient;

  const DefaultBtn({
    super.key,
    this.color = Colors.transparent, // Default transparent to use gradient
    this.textColor = Colors.white,
    this.text = 'text',
    this.radius = 12,
    this.width = 279,
    this.fontsize = 14,
    this.height = 48,
    this.isGradient = true,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          // Use the passed color if it's not transparent, otherwise apply the gradient
          color: color != Colors.transparent ? color : null,
          gradient: color == Colors.transparent
              ? const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFCB9A7E),
                    Color(0xFFCB9A7E),
                  ],
                )
              : null,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(
            color: const Color(0x1FFFFFFF), // Border with transparency
          ),
          boxShadow: [
            const BoxShadow(
              color: Color(0xFF375DFB),
              spreadRadius: 1,
              blurRadius: 0,
              offset: Offset(0, 0), // First shadow
            ),
            const BoxShadow(
              color: Color(0x25253EA7), // Second shadow with transparency
              spreadRadius: 0,
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w600,
              fontSize: fontsize,
            ),
          ),
        ),
      ),
    );
  }
}

class DefaultBtn3 extends StatelessWidget {
  final Color textColor; // Text color
  final String text; // Button label
  final double radius; // Border radius
  final Function() press; // On-tap function
  final double width; // Button width
  final double fontsize; // Font size for the text
  final double height, widths; // Button height

  const DefaultBtn3({
    super.key,
    this.textColor = Colors.white,
    this.text = 'text',
    this.radius = 12,
    this.width = 279,
    this.widths = 3,
    this.fontsize = 14,
    this.height = 48,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          // Apply the gradients for the background
          // gradient: const LinearGradient(
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          //   colors: [
          //     Color(0x00DE620F), // Transparent gradient start
          //     Color(0x1FFFFFFF), // Slightly transparent gradient end
          //   ],
          // ),
          borderRadius: BorderRadius.circular(radius),
          // Apply the border
          border: Border.all(
            color: const Color(0xFFCB9A7E), // Solid border color
            width: widths, // Border width
          ),
          // Apply the box shadows
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w600,
              fontSize: fontsize,
            ),
          ),
        ),
      ),
    );
  }
}

class DefaultBtn1 extends StatelessWidget {
  final Color color, textColor, borderColor;
  final String text;
  final double radius;
  final Function() press;
  const DefaultBtn1(
      {super.key,
      this.color = MyColor.primaryColor,
      this.textColor = Colors.white,
      this.text = 'text',
      this.radius = 12,
      this.borderColor = Colors.white,
      required this.press});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        width: 335.w,
        height: 50.h,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(width: 2, color: borderColor)),
        child: Center(
          child: Text(text,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: textColor,
                  fontSize: 14.sp)),
        ),
      ),
    );
  }
}

class DefaultBtn2 extends StatelessWidget {
  final Color color, textColor;
  final String text;
  final double radius;
  final Function() press;
  final double width;
  final double fontsize;
  final double height;

  const DefaultBtn2(
      {super.key,
      this.color = MyColor.primaryColor,
      this.textColor = Colors.white,
      this.text = 'text',
      this.radius = 12,
      this.width = 335,
      this.fontsize = 14,
      this.height = 50,
      required this.press});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Center(
          child: Text(text,
              style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: fontsize)),
        ),
      ),
    );
  }
}

class DefaultLoadingBtn extends StatelessWidget {
  final Color color, textColor;
  final double radius;
  final double width;
  final double height;
  final Function() press;

  const DefaultLoadingBtn({
    Key? key,
    this.color = MyColor.primaryColor,
    this.textColor = Colors.white,
    this.radius = 12,
    this.width = 335,
    this.height = 50,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: isLoading ? null : press,
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Center(
            child: SizedBox(
          height: 25,
          width: 25.w,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(textColor),
          ),
        )),
      ),
    );
  }
}

class DefaultGoogleBtn extends StatelessWidget {
  final Color color, textColor;
  final String text;
  final double radius;
  final String asset;
  final Function() press;
  const DefaultGoogleBtn(
      {Key? key,
      this.color = Colors.transparent,
      this.textColor = Colors.white,
      this.text = 'text',
      this.radius = 10,
      required this.asset,
      required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        width: 279,
        height: 48,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(width: 1, color: Color(0xffEDF1F3))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              asset,
              height: 24.h,
              width: 24.w,
            ),
            SizedBox(
              width: 20.w,
            ),
            Text(text,
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'inter',
                    fontSize: 14.sp)),
          ],
        ),
      ),
    );
  }
}

class DefaultBtn4 extends StatelessWidget {
  final Color color; // Background color (can override gradient)
  final Color textColor; // Text color
  final String text; // Button label
  final double radius; // Border radius
  final Function() press; // On-tap function
  final double width; // Button width
  final double fontsize; // Font size for the text
  final double height; // Button height
  final bool isGradient;

  const DefaultBtn4({
    super.key,
    this.color = Colors.transparent, // Default transparent to use gradient
    this.textColor = Colors.white,
    this.text = 'text',
    this.radius = 12,
    this.width = 279,
    this.fontsize = 14,
    this.height = 48,
    this.isGradient = true,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          // Use the passed color if it's not transparent, otherwise apply the gradient
          color: color,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(
            color: const Color(0x1FFFFFFF), // Border with transparency
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w600,
              fontSize: fontsize,
            ),
          ),
        ),
      ),
    );
  }
}
