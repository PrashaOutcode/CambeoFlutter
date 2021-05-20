import 'package:get/get.dart';
import 'package:world_time/pages/LoginScreen.dart';

import 'AppRoutes.dart';


class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.DASHBOARD,
      page: () => LoginScreen(),
    //  binding: DashboardBinding(),
    ),
  ];
}
