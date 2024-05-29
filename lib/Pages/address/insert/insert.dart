import 'package:flutter/material.dart';
import 'package:klambi_ta/Pages/address/insert/components/city_post_code.dart';
import 'package:klambi_ta/Pages/address/insert/components/name_address.dart';
import 'package:klambi_ta/Pages/address/insert/components/name_street.dart';
import 'package:klambi_ta/Pages/address/insert/components/optional_note.dart';
import 'package:klambi_ta/Pages/address/insert/components/regional_province.dart';
import 'package:klambi_ta/color.dart';
import 'package:get/get.dart';

import '../../../component/my_elevatedbutton.dart';

class InsertAddressPageView extends StatelessWidget {
  const InsertAddressPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorValue.kBackground,
      appBar: AppBar(
        title: Text(
          'Masukkan Alamat',
          style: TextStyle(
            fontFamily: 'General Sans',
            fontWeight: FontWeight.w500,
            fontSize: 24,
            color: ColorValue.kBlack,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.offAndToNamed("/navbar", arguments: 3);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 20,
        ),
        child: Column(
          children: [
            AddressName(),
            StreetName(),
            OptionalNote(),
            RegionalProvince(),
            CityPostCode(),
            My_Button(
              onclick: () {},
              title: 'Lanjutkan',
            ),
          ],
        ),
      ),
    );
  }
}
