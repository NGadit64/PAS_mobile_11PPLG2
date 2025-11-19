import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:pas_mobile_11pplg_01/binding/dashboard_binding.dart';
import 'package:pas_mobile_11pplg_01/binding/login_binding.dart';
import 'package:pas_mobile_11pplg_01/binding/responsive_binding.dart';
import 'package:pas_mobile_11pplg_01/binding/splashscreen_binding.dart';
import 'package:pas_mobile_11pplg_01/binding/register_binding.dart';
import 'package:pas_mobile_11pplg_01/pages/dashboard/dashboard.dart';
import 'package:pas_mobile_11pplg_01/pages/dashboard/dashboard_responsive.dart';
import 'package:pas_mobile_11pplg_01/pages/login/login_page.dart';
import 'package:pas_mobile_11pplg_01/pages/registers/register_page.dart';
import 'package:pas_mobile_11pplg_01/pages/splashscreen_page.dart';
import 'package:pas_mobile_11pplg_01/routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.dashboardPage, page: () => DashboardPage(), binding: DashboardBinding()),
    GetPage(name: AppRoutes.registerPage, page: () => RegisterPage(), binding: RegisterBinding()),
    GetPage(name: AppRoutes.loginPage, page: () => LoginPage(), binding: LoginBinding()),
    GetPage(name: AppRoutes.dashboardResponsive, page: () => DashboardResponsive(), binding: ResponsiveBinding()),
    GetPage(name: AppRoutes.splashscreenPage, page: () => SplashscreenPage(), binding: SplashscreenBinding()),
  ];
}
