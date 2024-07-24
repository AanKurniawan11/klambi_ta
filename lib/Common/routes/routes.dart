import 'package:get/get.dart';
import 'package:klambi_ta/Common/routes/navbar.dart';
import 'package:klambi_ta/Common/routes/routes_name.dart';
import 'package:klambi_ta/Pages/address/components/address_binding.dart';
import 'package:klambi_ta/Pages/address/page/address.dart';
import 'package:klambi_ta/Pages/cart/components/cart_binding.dart';
import 'package:klambi_ta/Pages/cart/page/cart.dart';
import 'package:klambi_ta/Pages/chat/components/chat_binding.dart';
import 'package:klambi_ta/Pages/chat/page/chat.dart';
import 'package:klambi_ta/Pages/cs/components/cs_binding.dart';
import 'package:klambi_ta/Pages/cs/page/cs.dart';
import 'package:klambi_ta/Pages/design/components/design_binding.dart';
import 'package:klambi_ta/Pages/design/page/design.dart';
import 'package:klambi_ta/Pages/edit/components/edit_binding.dart';
import 'package:klambi_ta/Pages/edit/page/editprofile.dart';
import 'package:klambi_ta/Pages/history/components/history_binding.dart';
import 'package:klambi_ta/Pages/history/page/history.dart';
import 'package:klambi_ta/Pages/home/components/home_binding.dart';
import 'package:klambi_ta/Pages/home/page/home.dart';
import 'package:klambi_ta/Pages/insert/components/insert_binding.dart';
import 'package:klambi_ta/Pages/insert/page/insert.dart';
import 'package:klambi_ta/Pages/login/components/login_binding.dart';
import 'package:klambi_ta/Pages/login/page/login.dart';
import 'package:klambi_ta/Pages/payment/components/payment_binding.dart';
import 'package:klambi_ta/Pages/payment/page/payment.dart';
import 'package:klambi_ta/Pages/register/components/register_binding.dart';
import 'package:klambi_ta/Pages/register/page/register.dart';


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
