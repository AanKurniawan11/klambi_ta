import 'package:flutter/material.dart';
import 'package:klambi_ta/Pages/home/home.dart';
import 'package:klambi_ta/color.dart';
import 'package:get/get.dart';
import '../Pages/history/history.dart';

class MyTextField extends StatelessWidget {
  // final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final IconData? prefixIcon;
  String Password = "";
  bool isPasswordVisible = false;

  MyTextField({
    Key? key,
    // required this.controller,
    required this.hintText,
    required this.obscureText,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size mediaquery = MediaQuery.of(context).size;
    final double height = mediaquery.height;
    final double width = mediaquery.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: SizedBox(
        width: width * 0.89,
        child: TextField(
          // controller: controller,
          obscureText: obscureText,
          style: const TextStyle(color: Colors.black, fontSize: 16.0),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: ColorValue.kLightGrey),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: ColorValue.kPrimary),
              borderRadius: BorderRadius.circular(10.0),
            ),
            filled: true,
            fillColor: Colors.transparent,
            hintText: hintText,
            hintStyle: const TextStyle(color: ColorValue.kDarkGrey),
            prefixIcon: prefixIcon != null
                ? Icon(
                    prefixIcon,
                    color: ColorValue.kDarkGrey,
                  )
                : null,
          ),
        ),
      ),
    );
  }
}

extension ListSpaceBetweenExtension on List<Widget> {
  List<Widget> withSpaceBetween({double? width, double? height}) => [
        if (isNotEmpty) this[0],
        for (int i = 1; i < length; i++) ...[
          SizedBox(width: width, height: height),
          this[i]
        ]
      ];
}

class elevatedbutton extends StatelessWidget {
  final VoidCallback onclick;
  final String title;

  const elevatedbutton({super.key, required this.onclick, required this.title});

  @override
  Widget build(BuildContext context) {
    final Size mediaquery = MediaQuery.of(context).size;
    final double height = mediaquery.height;
    final double width = mediaquery.width;
    return ElevatedButton(
        onPressed: onclick,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(ColorValue.kPrimary),
            minimumSize:
                MaterialStateProperty.all(Size(width * 0.85, height * 0.065)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)))),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ));
  }
}

Widget texttest(
  String hint,
  String label,
  final IconData? prefixIcon,
) =>
    TextField(
      decoration: InputDecoration(
          hintStyle: const TextStyle(color: ColorValue.kDarkGrey),
          hintText: hint,
          labelText: label,
          labelStyle: const TextStyle(color: ColorValue.kDarkGrey),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: ColorValue.kPrimary),
              borderRadius: BorderRadius.circular(10.0)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: ColorValue.kLightGrey)),
          prefixIcon: prefixIcon != null
              ? Icon(
                  prefixIcon,
                  color: ColorValue.kDarkGrey,
                )
              : null,

          // suffixIcon: IconButton(
          //   icon: Icon(Icons.close),
          //   onPressed: (){},

          // ),
          border: const OutlineInputBorder()),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.done,
    );

class PasswordTest extends StatefulWidget {
  final String hint;
  final String label;
  final IconData? prefixIcon;
  String password = '';
  bool isPasswordVisible = false;

  PasswordTest({
    super.key,
    required this.hint,
    required this.label,
    this.prefixIcon,
  });
  @override
  _PasswordTestState createState() => _PasswordTestState();
}

class _PasswordTestState extends State<PasswordTest> {
  String password = '';
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: const TextStyle(color: ColorValue.kDarkGrey),
        labelText: widget.label,
        labelStyle: const TextStyle(color: ColorValue.kDarkGrey),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorValue.kPrimary),
            borderRadius: BorderRadius.circular(10.0)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: ColorValue.kLightGrey)),
        prefixIcon: widget.prefixIcon != null
            ? Icon(widget.prefixIcon, color: ColorValue.kDarkGrey)
            : null,
        suffixIcon: IconButton(
          icon: isPasswordVisible
              ? const Icon(
                  Icons.visibility_off,
                  color: Colors.black,
                )
              : const Icon(
                  Icons.visibility,
                  color: ColorValue.kDarkGrey,
                ),
          onPressed: () {
            setState(() {
              isPasswordVisible = !isPasswordVisible;
            });
          },
        ),
        border: const OutlineInputBorder(),
      ),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.done,
      obscureText: isPasswordVisible,
    );
  }
}

class BottomNavigation extends StatelessWidget {
  final int currentIndex;

  const BottomNavigation({super.key, required this.currentIndex});

  void _onTap(int index) {
    switch (index) {
      case 0:
        Get.off(const HomePageView()); // Navigate to home route
        break;
      case 1:
        Get.off(HistoryPage());
        break;
      case 2:
        Get.offNamed("/whislist");
        break;
      case 3:
        Get.offNamed("/chat");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: _onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.receipt_long_sharp),
          label: 'Riwayat',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark),
          label: 'Whislist',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'Chat',
        ),
      ],
      iconSize: 30,
      selectedItemColor: ColorValue.kPrimary,
      unselectedItemColor: ColorValue.kLightGrey,
    );
  }
}

class chatfield extends StatelessWidget {
  // final TextEditingController controller;
  final String hintText;
  final IconData? suffixIcon;
  String password = "";

  chatfield({
    Key? key,
    // required this.controller,
    required this.hintText,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size mediaquery = MediaQuery.of(context).size;
    final double height = mediaquery.height;
    final double width = mediaquery.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: SizedBox(
        width: width * 0.89,
        child: TextField(
          // controller: controller,
          style: const TextStyle(color: Colors.black, fontSize: 16.0),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: ColorValue.kLightGrey),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: ColorValue.kSecondary),
              borderRadius: BorderRadius.circular(10.0),
            ),
            filled: true,
            fillColor: Colors.transparent,
            hintText: hintText,
            hintStyle: const TextStyle(color: ColorValue.kDarkGrey),
            suffixIcon: suffixIcon != null
                ? GestureDetector(
                  child: Icon(
                      suffixIcon,
                      color: ColorValue.kDarkGrey,
                    ),
              onTap: (){},
                )
                : null,
          ),
        ),
      ),
    );
  }
}
