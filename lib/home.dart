import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oasisstaff/core/strings_manager.dart';
import 'package:oasisstaff/tabs/home_tab.dart';
import 'package:oasisstaff/tabs/logout_tab.dart';
import 'package:oasisstaff/tabs/profile_tab.dart';
import 'package:oasisstaff/tabs/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedItem = 0;

  List<Widget> tabs = [
    HomeTab(),
    SettingsTab(),
    ProfileTab(),
    LogoutTab(),
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.primary,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        title: Row(
          children: [
            const CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('assets/images/profile_placeholder.png'), // Optional
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringsManager.welcome.tr(),
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: colorScheme.onPrimary,
                  ),
                ),
                Text(
                  "Michael Mitch",
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: colorScheme.onPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Lead UI/UX Designer",
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: colorScheme.onPrimary.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          height: 70,
          backgroundColor: colorScheme.primary,
          indicatorColor: colorScheme.onSurface,
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
            final isSelected = states.contains(WidgetState.selected);
            return TextStyle(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? colorScheme.surface : colorScheme.onPrimary,
            );
          }),
          iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((states) {
            final isSelected = states.contains(WidgetState.selected);
            return IconThemeData(
              color: isSelected ? colorScheme.surface : colorScheme.onPrimary,
            );
          }),
        ),
        child: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              selectedItem = index;
            });
          },
          selectedIndex: selectedItem,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          animationDuration: const Duration(milliseconds: 500),
          destinations: [
            NavigationDestination(
              icon: const Icon(Icons.home),
              label: StringsManager.home.tr(),
            ),
            NavigationDestination(
              icon: const Icon(Icons.settings),
              label: StringsManager.settings.tr(),
            ),
            NavigationDestination(
              icon: const Icon(Icons.person),
              label: StringsManager.profile.tr(),
            ),
            NavigationDestination(
              icon: const Icon(Icons.logout),
              label: StringsManager.logout.tr(),
            ),
          ],
        ),
      ),

      // FAB
      floatingActionButton: SizedBox(
        height: 70.r,
        width: 70.r,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: colorScheme.primary,
          foregroundColor: Colors.white,
          shape: StadiumBorder(
            side: BorderSide(
              color: colorScheme.onPrimary,
              width: 2,
            ),
          ),
          child: Icon(Icons.supervisor_account_rounded,
            size: 50.r,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // Body
      body: tabs[selectedItem],
    );
  }
}