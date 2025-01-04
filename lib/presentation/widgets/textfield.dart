import 'package:flutter/material.dart';
import 'package:letsbrunch/core/utils/app_colors.dart';

class SmallTextCustomWidget extends StatelessWidget {
  SmallTextCustomWidget(
      {super.key,
      required this.namecontroller,
      // required this.labeltext,
      required this.hinttext,
      this.maxlines = 1,
      this.height = 44,
      this.mainheight = 69,
      this.keyboardType = TextInputType.text});

  final TextEditingController namecontroller;
  // final String labeltext;
  final String hinttext;
  final TextInputType keyboardType;
  final int maxlines;
  final double height;
  final double mainheight;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: 132,
              height: height,
              child: TextFormField(
                style: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'inter',
                    color: MyColor.colorBlack2,
                    fontWeight: FontWeight.w500),
                // readOnly: readonly,
                controller: namecontroller,
                onSaved: (value) {
                  namecontroller.text = value!;
                },
                decoration: InputDecoration(
                  //hintText: ' ',
                  //fillColor: Colors.black,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Color(0xffEDF1F3),
                        width: 1,
                      )),
                  //labelStyle: TextStyle(fontSize: 14, fontFamily: 'inter'),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Color(0xffEDF1F3),
                        width: 1,
                      )),

                  hintText: hinttext,
                  hintStyle: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'inter',
                      color: Color(0xff707281),
                      fontWeight: FontWeight.w400),
                ),
              ))
        ]);
  }
}

class TextCustomWidget extends StatelessWidget {
  TextCustomWidget(
      {super.key,
      required this.namecontroller,
      // required this.labeltext,
      required this.hinttext,
      this.maxlines = 1,
      this.height = 44,
      this.mainheight = 69,
      this.keyboardType = TextInputType.text});

  final TextEditingController namecontroller;
  // final String labeltext;
  final String hinttext;
  final TextInputType keyboardType;
  final int maxlines;
  final double height;
  final double mainheight;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: 279,
              height: height,
              child: TextFormField(
                style: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'inter',
                    color: MyColor.colorBlack2,
                    fontWeight: FontWeight.w500),
                // readOnly: readonly,
                controller: namecontroller,
                onSaved: (value) {
                  namecontroller.text = value!;
                },
                decoration: InputDecoration(
                  //hintText: ' ',
                  //fillColor: Colors.black,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(0)),
                      borderSide: BorderSide(
                        color: Color(0xffEDF1F3),
                        width: 1,
                      )),
                  //labelStyle: TextStyle(fontSize: 14, fontFamily: 'inter'),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Color(0xffEDF1F3),
                        width: 1,
                      )),

                  hintText: hinttext,
                  hintStyle: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'inter',
                      color: Color(0xff707281),
                      fontWeight: FontWeight.w400),
                ),
              ))
        ]);
  }
}

class EmailCustomWidget extends StatelessWidget {
  const EmailCustomWidget(
      {super.key,
      required this.namecontroller,
      required this.keys,
      this.readonly = false,
      required this.hinttext});

  final TextEditingController namecontroller;
  final String hinttext;
  final bool readonly;
  final Key keys;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
          width: 279,
          height: 44,
          child: TextFormField(
              key: keys,
              style: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'inter',
                  color: MyColor.colorBlack2,
                  fontWeight: FontWeight.w400),
              readOnly: readonly,
              controller: namecontroller,
              onSaved: (value) {
                namecontroller.text = value!;
              },
              decoration: InputDecoration(
                //hintText: ' ',
                //fillColor: Colors.black,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: Color(0xffEDF1F3),
                      width: 1,
                    )),
                //labelStyle: TextStyle(fontSize: 14, fontFamily: 'inter'),
                enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: Color(0xffEDF1F3),
                      width: 1,
                    )),

                hintText: hinttext,
                hintStyle: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'inter',
                    color: Color(0xff707281),
                    fontWeight: FontWeight.w400),
              ))),
    );
  }
}

class PasswordCustomWidget extends StatefulWidget {
  PasswordCustomWidget({
    super.key,
    required this.passcontroller,
    required this.hinttext,
    required this.confirm,
    this.height = 44,
    required this.keys,
    // this.mainheight = 69,
    this.onChanged,
    TextEditingController? confirmPasscontroller,
  }) : confirmPasscontroller = confirmPasscontroller ?? passcontroller;

  final TextEditingController passcontroller;
  final TextEditingController confirmPasscontroller;
  // dou mainheight;
  final double height;
  final String hinttext;
  final bool confirm;
  final Key keys;

  final Function(String)? onChanged; // Add this line
  @override
  State<PasswordCustomWidget> createState() => _PasswordCustomWidgetState();
}

class _PasswordCustomWidgetState extends State<PasswordCustomWidget> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    widget.passcontroller.addListener(_updateState); // Add a listener
  }

  @override
  void dispose() {
    widget.passcontroller.removeListener(_updateState); // Remove the listener
    super.dispose();
  }

  void _updateState() {
    // This triggers a rebuild whenever the text changes
    setState(() {});
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: 279,
      child: TextFormField(
        onChanged: (String value) {
          widget.onChanged?.call(value);
        },
        style: const TextStyle(
          fontSize: 14,
          fontFamily: 'inter',
          fontWeight: FontWeight.w400,
        ),
        onSaved: (value) {
          widget.passcontroller.text = value!;
        },
        controller: widget.passcontroller,
        obscureText: _obscureText,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: const BorderSide(
              color: Color(0xffEDF1F3),
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: const BorderSide(
              color: Color(0xffEDF1F3),
              width: 1,
            ),
          ),
          hintText: widget.hinttext,
          hintStyle: const TextStyle(
            fontSize: 14,
            fontFamily: 'inter',
            color: Color(0xff707281),
            fontWeight: FontWeight.w400,
          ),
          suffixIcon: widget.passcontroller.text.isNotEmpty
              ? GestureDetector(
                  onTap: _togglePasswordVisibility,
                  child: Icon(
                    _obscureText
                        ? Icons.visibility_rounded
                        : Icons.visibility_off,
                    color: const Color(0xffACB5BB),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}

class TextCustomDateIconWidget extends StatelessWidget {
  TextCustomDateIconWidget({
    super.key,
    required this.namecontroller,
    required this.hinttext,
    //required this.icon,
    required this.readonly,
    this.width = 279,
    this.maxlines = 1,
    this.height = 44,
  });

  final TextEditingController namecontroller;
  final String hinttext;
  //final Icon icon;
  final bool readonly;

  final double width;
  final int maxlines;
  final double height;

  @override
  Widget build(BuildContext context) {
    Future<void> selectDate(BuildContext context) async {
      DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1960, 8),
        lastDate: DateTime(2101),
      );
      if (picked != null) {
        // setState(() {
        namecontroller.text = picked.toString().split(" ")[0];
        // });
        print({picked.toString()});
      }
    }

    return SizedBox(
        height: height,
        width: width,
        child: Row(
          children: [
            Expanded(
              child: TextField(
                  onTap: () {
                    selectDate(context);
                  },
                  style: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'inter',
                      color: MyColor.colorBlack2,
                      fontWeight: FontWeight.w400),
                  readOnly: readonly,
                  controller: namecontroller,
                  // onSaved: (value) {
                  //   namecontroller.text = value!;
                  // },
                  decoration: InputDecoration(
                      //hintText: ' ',
                      //fillColor: Colors.black,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(
                            color: Color(0xffEDF1F3),
                            width: 1,
                          )),
                      //labelStyle: TextStyle(fontSize: 14, fontFamily: 'inter'),
                      enabledBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(
                            color: Color(0xffEDF1F3),
                            width: 1,
                          )),
                      hintText: hinttext,
                      hintStyle: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'inter',
                          color: Color(0xff707281),
                          fontWeight: FontWeight.w400),
                      suffixIcon: Icon(
                        Icons.calendar_month_rounded,
                        size: 16,
                        color: Color(0xffACB5BB),
                      )
                      // hintStyle: const TextStyle(color: kTextFieldColor),
                      // focusedBorder: const OutlineInputBorder(
                      //     borderRadius:
                      //         BorderRadius.all(Radius.circular(3)),
                      //     borderSide:
                      //         BorderSide(color: Color(0xff191919))),
                      )),
            ),
          ],
        ));
  }
}

class CocCustomWidget extends StatefulWidget {
  final TextEditingController nameController;
  final String hintText;
  final double width;
  final Widget prefixWidget;
  final Function(String)? onChanged;

  const CocCustomWidget({
    super.key,
    required this.nameController,
    required this.hintText,
    required this.prefixWidget,
    this.onChanged,
    this.width = 279,
  });

  @override
  _CocCustomWidgetState createState() => _CocCustomWidgetState();
}

class _CocCustomWidgetState extends State<CocCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1, color: const Color(0xffEDF1F3)),
      ),
      height: 44,
      width: widget.width,
      child: Row(
        children: [
          widget.prefixWidget,
          const VerticalDivider(
            width: 1,
            thickness: 1,
            color: Colors.grey,
          ),
          Expanded(
            child: TextField(
              onChanged: (String value) {
                widget.onChanged?.call(value);
              },
              maxLength: 15,
              controller: widget.nameController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                counterText: '', // Hide the maxLength counter
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 2.0,
                  horizontal: 20.0,
                ),
                border: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'inter',
                  color: Color(0xffACB5BB),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

TextFormField buildInputSuffixForm(
    String hint,
    bool pass,
    TextEditingController textController,
    TextInputType inputType,
    String name) {
  // final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool isObscure = true;

  return TextFormField(
      style: const TextStyle(fontSize: 17, fontFamily: 'plus'),
      keyboardType: inputType,
      validator: (value) {
        if (value!.isEmpty) {
          return "$name cannot be empty";
        }
        return null;
      },
      onSaved: (value) {
        textController.text = value!;
      },
      controller: textController,
      obscureText: pass ? isObscure : false,
      decoration: InputDecoration(
        //hintText: ' ',
        fillColor: Color(0xffF2F5C4),
        filled: true,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: MyColor.searchColor, width: 2)),

        //labelStyle: TextStyle(fontSize: 14, fontFamily: 'plus'),
        hintText: hint,
        hintStyle: const TextStyle(
          color: MyColor.searchColor,
          fontSize: 14,
          fontFamily: 'poppins',
          fontWeight: FontWeight.w400,
          height: 0.11,
        ),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Color(0x42DE620F), width: 2)),
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
                color: Color(0x42DE620F) // 0x42 represents 26% opacity
                ,
                width: 2)),
        prefixIcon: Icon(
          Icons.search, size: 22, color: MyColor.searchColor,
          // color: kTextFieldColor,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 16, top: 12, bottom: 12),
          child: Image.asset(
            'assets/images/filter.png',
            width: 24,
            height: 24,
            fit: BoxFit.contain,
          ),
        ),
      ));
}
