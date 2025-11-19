import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg_01/pages/bookmark_page.dart';
import 'package:pas_mobile_11pplg_01/pages/profile.dart';
import 'package:pas_mobile_11pplg_01/pages/table_page.dart';

class DashboardController extends GetxController {
  var selectedIndex = 0.obs;

  final List<Widget> pages = [
    TablePage(),        
    BookmarkPage(),
    Profile(),
    ];

  void changePage(int index) {
    selectedIndex.value = index;
  }
}
