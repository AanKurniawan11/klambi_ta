import 'package:flutter/material.dart';
import 'package:klambi_ta/color.dart';

class CategoryTabs extends StatefulWidget {
  const CategoryTabs({super.key});

  @override
  State<CategoryTabs> createState() => _CategoryTabsState();
}

class _CategoryTabsState extends State<CategoryTabs> {
  List catList = ["Semua", "Lengan Pendek", "Lengan Panjang", "Oversize"];
  List<bool> isSelectedList = [true, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
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
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 18),
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
    );
  }
}
