import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navigationProvider = Provider((ref) => NavigationController());

class NavigationController {
  final ScrollController scrollController = ScrollController();
  
  final Map<String, GlobalKey> sectionKeys = {
    'Home': GlobalKey(),
    'About': GlobalKey(),
    'Experience': GlobalKey(),
    'Services': GlobalKey(),
    'Contact': GlobalKey(),
  };

  void scrollToSection(String section) {
    final key = sectionKeys[section];
    if (key?.currentContext != null) {
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      );
    }
  }
}
