import 'package:flutter/material.dart';
import 'package:klambi_ta/Common/colors/color.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController _controller = TextEditingController();

  SearchField({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Form(
        child: TextFormField(
          controller: _controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            border: searchOutlineInputBorders,
            focusedBorder: searchOutlineInputBorder,
            enabledBorder: searchOutlineInputBorders,
            hintText: "Cari Style...",
            hintStyle: TextStyle(
              fontFamily: 'General Sans',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: ColorValue.kLightGrey.withOpacity(0.7),
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 20, right: 15),
              child: SvgPicture.asset(
                'assets/icons/search_icon.svg',
                color: ColorValue.kPrimary.withOpacity(0.8),
              ),
            ),
            suffixIcon: _controller.text.isNotEmpty
                ? IconButton(
              icon: Icon(Icons.clear, color: ColorValue.kDanger),
              onPressed: () {
                _controller.clear();
                onChanged('');
              },
            )
                : null,
          ),
          style: TextStyle(
            fontFamily: 'General Sans',
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}

const searchOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(15)),
  borderSide: BorderSide(color: ColorValue.kPrimary, width: 2),
);

const searchOutlineInputBorders = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(15)),
  borderSide: BorderSide(color: ColorValue.kLightGrey, width: 2),
);
