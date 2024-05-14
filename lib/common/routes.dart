import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Pages/chat/chat.dart';
import 'package:klambi_ta/Pages/chat/chat_binding.dart';
import 'package:klambi_ta/Pages/history/history.dart';
import 'package:klambi_ta/common/routes_name.dart';
import 'package:klambi_ta/component/navbar.dart';
import 'package:klambi_ta/profile/cart/cart.dart';
import 'package:klambi_ta/profile/cart/cart_binding.dart';
import 'package:klambi_ta/profile/edit/editprofile.dart';
import 'package:klambi_ta/profile/profile.dart';
import 'package:klambi_ta/profile/profile_binding.dart';
import '../Pages/Register/register.dart';
import '../Pages/history/history_binding.dart';
import '../Pages/home/home.dart';
import '../Pages/home/home_binding.dart';
import '../Pages/login/login.dart';
import '../Pages/login/login_binding.dart';
import '../Pages/register/register_binding.dart';
import '../Pages/whislist/whislist.dart';
import '../Pages/whislist/whislist_binding.dart';
import '../profile/edit/edit_binding.dart';

List<GetPage> pageRoutes = <GetPage>[
  GetPage(
      name: RouteName.login,
      page: () => const Login(),
      binding: loginbinding()
  ),
  GetPage(
      name: RouteName.register,
      page: () => const Register(),
      binding: Registerbinding()
  ),
  GetPage(
      name: RouteName.home,
      page: () => const HomePageView(),
      binding: HomeBinding()
  ),
  GetPage(
      name: RouteName.history,
      page: () => const HistoryPage(),
      binding: HistoryBinding()
  ),
  GetPage(
      name: RouteName.whislist,
      page: () =>  const WhislistPage(),
      binding: WhislistBinding()
  ),
  GetPage(
      name: RouteName.chat,
      page: () =>  const ChatPage(),
      binding: ChatBinding()
  ),
  GetPage(
      name: RouteName.profile,
      page: () =>  const Profile(),
      binding: ProfileBinding()
  ),
  GetPage(
      name: RouteName.edit,
      page: () =>  const EditProfile(),
      binding: EditBinding()
  ),
  GetPage(
      name: RouteName.cart,
      page: () =>  const Cart(),
      binding: CartBinding()
  ),

  GetPage(
      name: RouteName.navbar,
      page: () =>  LandingPage(),
      // binding: ProfileBinding()
  ),
];