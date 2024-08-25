import 'package:get/get.dart';
import 'package:klambi_ta/Common/routes/navbar.dart';
import 'package:klambi_ta/Pages/cart/page/cart.dart';
import 'package:klambi_ta/Pages/design/controller/design_binding.dart';
import 'package:klambi_ta/Pages/design/page/design.dart';
import 'package:klambi_ta/Pages/history/components/history_binding.dart';
import 'package:klambi_ta/Pages/history/page/history.dart';
import 'package:klambi_ta/Pages/home/components/home_binding.dart';
import 'package:klambi_ta/Pages/home/page/home.dart';
import 'package:klambi_ta/Pages/insert/controller/insert_binding.dart';
import 'package:klambi_ta/Pages/insert/page/insert.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/address/Page/ReqAddress.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/address/Page/add_address.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/address/controller/address_binding.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/chat/controller/chat_binding.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/chat/page/chat.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/cs/controller/cs_binding.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/cs/page/cs.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/edit/controller/edit_binding.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/edit/page/editprofile.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/menu_profile.dart';
import 'package:klambi_ta/Pages/payment/controller/payment_binding.dart';
import 'package:klambi_ta/Pages/payment/page/payment.dart';
import 'package:klambi_ta/Pages/payment/page/payment_cart.dart';
import 'package:klambi_ta/Pages/user/login/components/login_binding.dart';
import 'package:klambi_ta/Pages/user/login/page/login.dart';
import 'package:klambi_ta/Pages/user/register/components/register_binding.dart';
import 'package:klambi_ta/Pages/user/register/page/register.dart';
import 'package:klambi_ta/common/routes/routes_name.dart';
import 'package:klambi_ta/Pages/cart/controller/cart_binding.dart';


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
      page: () =>  ChatPage(),
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
      page: () => const ReqAddres(),
      binding: AddressBinding()),
  GetPage(
      name: RouteName.insert,
      page: () => const InsertAddressPageView(),
      binding: InserAddressBinding()),
  GetPage(
      name: RouteName.payment,
      page: () =>  Payment(),
      binding: PaymentBinding()),
  GetPage(
      name: RouteName.paymentcart,
      page: () =>  PaymentCart(),
      binding: CartBinding()),
  GetPage(
    name: RouteName.navbar,
    page: () => LandingPage(),
  ),
  GetPage(
    name: RouteName.addAddress,
    page: () => AddAddress(),
    // binding: ProfileBinding()
  ),
  GetPage(
    name: RouteName.profile,
    page: () => Profile(),
    // binding: ProfileBinding()
  ),
];