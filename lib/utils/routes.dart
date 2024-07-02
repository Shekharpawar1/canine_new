import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:canine/screens/common/common.dart';
import 'package:canine/screens/intro2.dart';
import 'package:canine/screens/partner/Dashboard.dart';
import 'package:canine/screens/partner/login.dart';
import 'package:canine/screens/partner/notification.dart';
import 'package:canine/screens/partner/otp.dart';
import 'package:canine/screens/salesman/Dashboard.dart';
import 'package:canine/screens/salesman/home.dart';
import 'package:canine/screens/salesman/login.dart';
import 'package:canine/screens/salesman/notification.dart';
import 'package:canine/screens/salesman/otp.dart';
import 'package:canine/screens/splash.dart';
import 'package:canine/screens/user/userHome.dart';
import 'package:canine/screens/user/login.dart';
import 'package:canine/screens/user/notification.dart';
import 'package:canine/screens/user/otp.dart';
import 'package:canine/screens/user/productdetails.dart';
import 'package:canine/screens/wholesaler/Dashboard.dart';
import 'package:canine/screens/wholesaler/home.dart';
import 'package:canine/screens/wholesaler/login.dart';
import 'package:canine/screens/wholesaler/notification.dart';
import 'package:canine/screens/wholesaler/otp.dart';

class AppRouter {
  static const String initialRoute = '/';
  static List<GetPage> pages = [
    GetPage(name: '/', page: () => Splash()),
    GetPage(name: '/intro', page: () => MyIntroductionScreen()),
    GetPage(name: '/common', page: () => Common()),
    GetPage(name: '/login-user', page: () => LoginUser()),
    GetPage(name: '/login-wholesaler', page: () => LoginWhole()),
    GetPage(name: '/login-sales', page: () => LoginSales()),
    GetPage(name: '/login-partner', page: () => LoginPartner()),
    GetPage(name: '/otp-user', page: () => OtpUser()),
    GetPage(name: '/otp-wholesaler', page: () => OtpWhole()),
    GetPage(name: '/otp-sales', page: () => OtpSales()),
    GetPage(name: '/otp-partner', page: () => OtpPartner()),
    GetPage(name: '/home-user', page: () => HomeUser()),
    GetPage(name: '/home-wholesaler', page: () => HomeWhole()),
    GetPage(name: '/home-sales', page: () => HomeSales()),
    GetPage(name: '/dashboard-wholesaler', page: () => DashboardWhole()),
    GetPage(name: '/dashboard-sales', page: () => DashboardSales()),
    GetPage(name: '/dashboard-partner', page: () => DashboardPartner()),
    GetPage(name: '/notification-user', page: () => NotificationUser()),
    GetPage(name: '/notification-wholesaler', page: () => NotificationWhole()),
    GetPage(name: '/notification-sales', page: () => NotificationSales()),
    GetPage(name: '/notification-partner', page: () => NotificationPartner()),
    GetPage(name: '/notification-partner', page: () => NotificationPartner()),
  ];
}
