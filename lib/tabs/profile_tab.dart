import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:oasisstaff/tabs/documents_tab.dart';
import 'package:oasisstaff/tabs/personal.dart';
import 'package:oasisstaff/tabs/professional_tab.dart';
import '../core/colors_manager.dart';
import '../core/strings_manager.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  static List<Tab> tabs = [
    Tab(text: StringsManager.personal.tr()),
    Tab(text: StringsManager.professional.tr()),
    Tab(text: StringsManager.documents.tr()),
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return DefaultTabController(
      length: tabs.length,
      child: Column(
        children: [
          // Custom Styled TabBar Container
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: ColorsManager.lightBackGround,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: ColorsManager.borderColor),
            ),
            child: TabBar(
              indicator: BoxDecoration(
                color: ColorsManager.lightPrimaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.white,
              unselectedLabelColor: ColorsManager.lightOnPrimaryColor,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
              tabs: tabs,
            ),
          ),

          // Sample TabBarView for demonstration
          Expanded(
            child: TabBarView(
              children: [
                Center(child: PersonalTab()),
                Center(child: ProfessionalTab()),
                Center(child: DocumentsTab()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}