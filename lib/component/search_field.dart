import 'package:flutter/material.dart';
import 'package:klambi_ta/color.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Form(
        child: TextFormField(
          onChanged: (value) {
            print("Search query: $value");
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: ColorValue.kLightGrey,
            contentPadding: const EdgeInsets.all(14),
            border: searchOutlineInputBorder,
            focusedBorder: searchOutlineInputBorder,
            enabledBorder: searchOutlineInputBorder,
            hintText: "Cari Style...",
            hintStyle: TextStyle(
              fontFamily: 'General Sans',
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: ColorValue.kDarkGrey,
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 20, right: 15),
              child: SvgPicture.asset('assets/icons/search_icon.svg'),
            ),
          ),
        ),
      ),
    );
  }
}

const searchOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(10)),
  borderSide: BorderSide.none,
);

