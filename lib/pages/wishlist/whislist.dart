import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Pages/detail/detail_controller.dart';
import 'package:klambi_ta/Pages/whislist/components/whislist_card.dart';

import '../home/allproductresponsemodel.dart';

class WhislistPage extends StatelessWidget {
   WhislistPage({super.key});
  // final Datum item;
  final detailcontroller = Get.put(DetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              child: Row(
                children: [
                  Text(
                    'My Whislist',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "(no Item)",
                    style: TextStyle(fontSize: 18),
                  ),

                ],

              ),

            ),
            // Container(
            //   child:WhislistCard(context,item) ,
            // )
          ],
        ),
      ),
    );
  }

}
