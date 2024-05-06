import 'package:get/get.dart';
import 'package:klambi_ta/Pages/Register/register.dart';
import 'package:klambi_ta/Pages/home/home.dart';
import 'package:klambi_ta/Pages/home/home_binding.dart';
import 'package:klambi_ta/Pages/login/login.dart';
import 'package:klambi_ta/Pages/login/login_binding.dart';
import 'package:klambi_ta/Pages/register/register_binding.dart';
import 'package:klambi_ta/common/routes_name.dart';

List<GetPage> pageRoutes = [
  GetPage(
      name: RouteName.login,
      page: () => Login(),
      binding: loginbinding()
  ),
  GetPage(
      name: RouteName.register,
      page: () => Register(),
      binding: registerbinding()
  ),
  GetPage(
      name: RouteName.home,
      page: () => HomePageView(),
      binding: HomeBinding()
  ),
];