import 'package:flutter/material.dart';
import 'package:klambi_ta/Common/colors/color.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchField extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const SearchField({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Form(
        child: TextFormField(
          onChanged: onChanged,
          decoration: InputDecoration(
            // filled: true,
            // fillColor: ColorValue.kSuperLightGrey,
            contentPadding: const EdgeInsets.all(14),
            border: searchOutlineInputBorder,
            focusedBorder: searchOutlineInputBorder,
            enabledBorder: searchOutlineInputBorders,
            hintText: "Cari Style...",
            hintStyle: TextStyle(
              fontFamily: 'General Sans',
              fontSize: 18,
              color: ColorValue.kLightGrey,
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
  borderSide: BorderSide(color: Colors.grey),
);
const searchOutlineInputBorders = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(10)),
  borderSide: BorderSide(color: Colors.transparent),
);
