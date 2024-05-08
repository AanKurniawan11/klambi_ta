import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../color.dart';
import '../../component/navbar.dart';

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
  final int _currentIndex = 0;

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
                  const Column(
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
                  const Spacer(), // Adds flexible space
                  IconButton(
                    onPressed: () {
                      // Handle menu icon press
                    },
                    icon: const Icon(
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
            const SizedBox(height: 20),
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
                      padding: const EdgeInsets.all(2),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(
                            fontFamily: "General Sans",
                            fontWeight: FontWeight.w500,
                            color: ColorValue.kDarkGrey,
                          ),
                          hintText: "Cari Style...",
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
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
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
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 18),
                          decoration: BoxDecoration(
                            color: isSelectedList[i]
                                ? ColorValue.kPrimary.withOpacity(0.2)
                                : const Color(0xFFF7F8FA),
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
                              fontFamily: "General Sans",
                              fontWeight: FontWeight.w500,
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
            const SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Rekomendasi Penjual",
                    style: TextStyle(
                      fontFamily: "General Sans",
                      fontWeight: FontWeight.w600,
                      color: ColorValue.kBlack,
                      fontSize: 16,
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 170,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                    color: Color(0xFFF5F5F5),
                                    border: Border(
                                      top: BorderSide(
                                          width: 1.0,
                                          color: ColorValue.kLightGrey),
                                      right: BorderSide(
                                          width: 1.0,
                                          color: ColorValue.kLightGrey),
                                      left: BorderSide(
                                          width: 1.0,
                                          color: ColorValue.kLightGrey),
                                    ),
                                  ),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(20),
                                        child: Image(
                                          width: 120,
                                          height: 100,
                                          image: AssetImage(
                                              'assets/images/demo_image.png'),
                                        ),
                                      ),
                                      Positioned(
                                        top: 10,
                                        right: 10,
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            color: ColorValue.kSecondary,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: const Text(
                                            'Lengan Pendek',
                                            style: TextStyle(
                                              fontFamily: 'General Sans',
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 170,
                                  height: 120,
                                  padding: const EdgeInsets.all(15),
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                    border: Border(
                                      right: BorderSide(
                                          width: 1.0,
                                          color: ColorValue.kLightGrey),
                                      left: BorderSide(
                                          width: 1.0,
                                          color: ColorValue.kLightGrey),
                                      bottom: BorderSide(
                                          width: 1.0,
                                          color: ColorValue.kLightGrey),
                                    ),
                                  ),
                                  child: const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Custom Baju Hitam Polos',
                                        style: TextStyle(
                                          fontFamily: 'General Sans',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        'Rp. 99.000',
                                        style: TextStyle(
                                          fontFamily: 'General Sans',
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            size: 14,
                                            color: ColorValue.kPrimary,
                                          ),
                                          Text(
                                            '4.5 | 20 Stok | 10 Terjual',
                                            style: TextStyle(
                                                fontFamily: 'General Sans',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 10,
                                                color: ColorValue.kDarkGrey),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(currentIndex: _currentIndex),
    );
  }
}
