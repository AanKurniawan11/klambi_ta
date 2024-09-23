import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../Common/colors/color.dart';

Widget Loading(){
  return Center(
    child:  LoadingAnimationWidget.discreteCircle(
      color: ColorValue.kPrimary,
      size: 30,
      secondRingColor: ColorValue.kSecondary,
      thirdRingColor: ColorValue.kDanger,
    ),
  );
}