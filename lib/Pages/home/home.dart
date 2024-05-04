import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:klambi_ta/color.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final List<String> imgList = [
    'assets/images/banner/dsc_banner1.png',
    'assets/images/banner/dsc_banner2.png',
    'assets/images/banner/dsc_banner3.png',
    'assets/images/banner/dsc_banner4.png'
  ];

  List catList = ["Semua", "Lengan Pendek", "Lengan Panjang", "Oversize"];
  List<bool> isSelectedList = [true, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorValue.kBackground,
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 25, top: 25, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Selamat Pagi Filo,",
                        style: TextStyle(
                          fontFamily: "General Sans",
                          fontWeight: FontWeight.w600,
                          color: ColorValue.kBlack,
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "Cari Apa Hari ini?",
                        style: TextStyle(
                          fontFamily: "General Sans",
                          fontWeight: FontWeight.w500,
                          color: ColorValue.kPrimary,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Spacer(), // Adds flexible space
                  IconButton(
                    onPressed: () {
                      // Handle menu icon press
                    },
                    icon: Icon(
                      Icons.menu,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            Container(
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                ),
                items: imgList
                    .map(
                      (item) => Container(
                        child: Container(
                          margin: EdgeInsets.all(1.5),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            child: Stack(
                              children: <Widget>[
                                Image.asset(
                                  item,
                                  fit: BoxFit.cover,
                                  width: 1000.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: ColorValue.kLightGrey,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(2),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            fontFamily: "General Sans",
                            fontWeight: FontWeight.w500,
                            color: ColorValue.kDarkGrey,
                          ),
                          hintText: "Cari Style",
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            size: 30,
                            color: ColorValue.kDarkGrey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 25),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int i = 0; i < catList.length; i++)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            // Reset all selections
                            for (int j = 0; j < isSelectedList.length; j++) {
                              isSelectedList[j] = false;
                            }
                            // Set the selected category
                            isSelectedList[i] = true;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.all(5),
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                          decoration: BoxDecoration(
                            color: isSelectedList[i]
                                ? ColorValue.kPrimary.withOpacity(0.2)
                                : Color(0xFFF7F8FA),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: isSelectedList[i]
                                  ? ColorValue.kPrimary
                                  : ColorValue.kLightGrey,
                            ),
                          ),
                          child: Text(
                            catList[i],
                            style: TextStyle(
                              color: isSelectedList[i]
                                  ? ColorValue.kBlack
                                  : ColorValue.kDarkGrey,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 25),
            Text(
              "Rekomendasi Penjual",
              style: TextStyle(
                fontFamily: "General Sans",
                fontWeight: FontWeight.w600,
                color: ColorValue.kBlack,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
