import 'package:flutter/material.dart';
import 'package:klambi_ta/color.dart';
import 'package:klambi_ta/model/model.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorValue.kBackground,
      appBar: AppBar(
        title: Text(
          'Detail Produk',
          style: TextStyle(
            fontFamily: 'General Sans',
            fontWeight: FontWeight.w500,
            fontSize: 23,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0, // Remove appbar shadow
      ),
      body: SlidingUpPanel(
        panel: _buildPanel(),
        body: ListView(
          children: [
            Image.asset('assets/images/demo_image.png', scale: 0.5,),
            // Add other content of your detail view here
          ],
        ),
      ),
    );
  }

  Widget _buildPanel() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          SizedBox(height: 25),
          Text(
            'Lengan Pendek',
            style: TextStyle(
              fontFamily: 'General Sans',
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: ColorValue.kSecondary,
            ),
          ),
          Text(
            'Custom Baju Polos Warna Hitam',
            style: TextStyle(
              fontFamily: 'General Sans',
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  color: ColorValue.kWhite,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: ColorValue.kLightGrey,
                  ),
                ),
                child: Text(
                  '20 Pembeli',
                  style: TextStyle(
                    fontFamily: "General Sans",
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: ColorValue.kDarkGrey,
                  ),
                ),
              ),
              SizedBox(width: 5),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  color: ColorValue.kWhite,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: ColorValue.kLightGrey,
                  ),
                ),
                child: Text(
                  '20 Pembeli',
                  style: TextStyle(
                    fontFamily: "General Sans",
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: ColorValue.kDarkGrey,
                  ),
                ),
              ),
              SizedBox(width: 5),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  color: ColorValue.kWhite,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: ColorValue.kLightGrey,
                  ),
                ),
                child: Text(
                  '20 Pembeli',
                  style: TextStyle(
                    fontFamily: "General Sans",
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: ColorValue.kDarkGrey,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            'Rp. 99.000',
            style: TextStyle(
              fontFamily: 'General Sans',
              fontWeight: FontWeight.w600,
              fontSize: 32,
              color: ColorValue.kBlack,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Deskripsi Produk',
            style: TextStyle(
              fontFamily: 'General Sans',
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: ColorValue.kBlack,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ',
            style: TextStyle(
              fontFamily: 'General Sans',
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: ColorValue.kBlack,
            ),
          ),
        ],
      ),
    );
  }
}
