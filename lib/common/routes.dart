import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Pages/address/address.dart';
import 'package:klambi_ta/Pages/address/address_binding.dart';
import 'package:klambi_ta/Pages/address/insert/insert.dart';
import 'package:klambi_ta/Pages/address/insert/insert_binding.dart';
import 'package:klambi_ta/Pages/chat/chat.dart';
import 'package:klambi_ta/Pages/chat/chat_binding.dart';
import 'package:klambi_ta/Pages/detail/detail.dart';
import 'package:klambi_ta/Pages/detail/detail_binding.dart';
import 'package:klambi_ta/Pages/history/history.dart';
import 'package:klambi_ta/Pages/payment/payment.dart';
import 'package:klambi_ta/Pages/payment/payment_binding.dart';
import 'package:klambi_ta/common/routes_name.dart';
import 'package:klambi_ta/component/navbar.dart';
import '../Pages/Register/register.dart';
import '../Pages/cs/cs.dart';
import '../Pages/cs/cs_binding.dart';
import '../Pages/history/history_binding.dart';
import '../Pages/home/home.dart';
import '../Pages/home/home_binding.dart';
import '../Pages/login/login.dart';
import '../Pages/login/login_binding.dart';
import '../Pages/profile/cart/cart.dart';
import '../Pages/profile/cart/cart_binding.dart';
import '../Pages/profile/edit/edit_binding.dart';
import '../Pages/profile/edit/editprofile.dart';
import '../Pages/register/register_binding.dart';

List<GetPage> pageRoutes = <GetPage>[
  GetPage(
      name: RouteName.login,
      page: () =>  Login(),
      binding: loginbinding()),
  GetPage(
      name: RouteName.register,
      page: () =>  Register(),
      binding: Registerbinding()),
  GetPage(
      name: RouteName.home,
      page: () =>  HomePageView(),
      binding: HomeBinding()),
  GetPage(
      name: RouteName.history,
      page: () => const HistoryPage(),
      binding: HistoryBinding()),
  // GetPage(
  //     name: RouteName.whislist,
  //     page: () => const WhislistPage(),
  //     binding: WhislistBinding()),
  GetPage(
      name: RouteName.chat,
      page: () => const ChatPage(),
      binding: ChatBinding()),
  // GetPage(
  //     name: RouteName.detail,
  //     page: () => DetailView(items: item,),
  //     binding: DetailBinding()),
  GetPage(
      name: RouteName.edit,
      page: () =>  EditProfile(),
      binding: EditBinding()),
  GetPage(
      name: RouteName.cart, page: () => const Cart(), binding: CartBinding()),
  GetPage(
      name: RouteName.cs,
      page: () => const CustomerService(),
      binding: CustomerServiceBinding()),
  GetPage(
      name: RouteName.address,
      page: () => const AddressPageView(),
      binding: AddressBinding()),
  GetPage(
      name: RouteName.insert,
      page: () => const InsertAddressPageView(),
      binding: InserAddressBinding()),
  GetPage(
      name: RouteName.payment,
      page: () => const Payment(),
      binding: PaymentBinding()),
  GetPage(
    name: RouteName.navbar,
    page: () => LandingPage(),
    // binding: ProfileBinding()
  ),
];