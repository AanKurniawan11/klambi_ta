import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/component/my_elevatedbutton.dart';
import 'package:klambi_ta/component/my_textfield.dart';
import 'package:klambi_ta/component/my_textfields.dart';
import 'package:klambi_ta/component/pass_textfield.dart';
import 'package:klambi_ta/component/pass_textfields.dart';
import 'package:klambi_ta/component/space_extension.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaquery = MediaQuery.of(context).size;
    final double height = mediaquery.height;
    final double width = mediaquery.width;


    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Get.offAllNamed("/navbar");
            },
            child: Icon(
              Icons.arrow_back,
            )),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            width:width * 0.98,
            child: Column(
                children: [
                  ClipOval(
                      child:Container(
                        height: height * 0.15,
                        width: width *0.32,
                        foregroundDecoration: BoxDecoration(
                            image:DecorationImage(image: AssetImage("assets/images/banner/profile.jpg"),fit: BoxFit.cover)
                        ),
                      )
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Ganti Username",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                      MyTextFields("Username")
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Ganti Email",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                      MyTextFields("Example@hfsa")
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Ganti Password",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                      PassTextFields(hint: "Password")
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Konfirmasi Password",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                      SizedBox(height: 20,),
                      PassTextFields(hint: "Konfirmasi")
                    ],
                  ),
                  My_Button(onclick: (){}, title: "Simpan")
                ].withSpaceBetween(height: 30)),
          ),
        ),
      ),
      // body: ,
    );
  }
}
