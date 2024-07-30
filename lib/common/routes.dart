import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Pages/address/Page/add_address.dart';
import 'package:klambi_ta/Pages/address/Page/address.dart';
import 'package:klambi_ta/Pages/address/components/address_binding.dart';
import 'package:klambi_ta/Pages/address/insert/insert.dart';
import 'package:klambi_ta/Pages/address/insert/insert_binding.dart';
import 'package:klambi_ta/Pages/chat/chat.dart';
import 'package:klambi_ta/Pages/chat/chat_binding.dart';
import 'package:klambi_ta/Pages/cs/components/cs_binding.dart';
import 'package:klambi_ta/Pages/cs/page/cs.dart';
import 'package:klambi_ta/Pages/design/design.dart';
import 'package:klambi_ta/Pages/design/design_binding.dart';
import 'package:klambi_ta/Pages/history/history.dart';
import 'package:klambi_ta/Pages/payment/payment.dart';
import 'package:klambi_ta/Pages/payment/payment_binding.dart';
import 'package:klambi_ta/Pages/profile/cart/page/cart.dart';
import 'package:klambi_ta/Pages/profile/cart/components/cart_binding.dart';
import 'package:klambi_ta/common/routes_name.dart';
import 'package:klambi_ta/common/navbar.dart';
import '../Pages/Register/register.dart';

import '../Pages/history/history_binding.dart';
import '../Pages/home/home.dart';
import '../Pages/home/home_binding.dart';
import '../Pages/login/page/login.dart';
import '../Pages/login/components/login_binding.dart';
import '../Pages/register/register_binding.dart';
import '../pages/profile/edit/edit_binding.dart';
import '../pages/profile/edit/editprofile.dart';

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

  GetPage(
      name: RouteName.chat,
      page: () => const ChatPage(),
      binding: ChatBinding()),
  GetPage(
      name: RouteName.design,
      page: () => DesignPageView(),
      binding: DesignBinding()),
  GetPage(
      name: RouteName.edit,
      page: () =>  EditProfile(),
      binding: EditBinding()),
  GetPage(
      name: RouteName.cart,
      page: () => Cart(),
      binding: CartBinding()),
  GetPage(
      name: RouteName.cs,
      page: () => CustomerService(),
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
  GetPage(
    name: RouteName.addAddress,
    page: () => AddAddress(),
    // binding: ProfileBinding()
  ),
];
