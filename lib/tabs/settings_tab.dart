import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../core/app_style.dart';
import '../core/providers/thememode_provider.dart';
import '../core/strings_manager.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  /////////// Language Toggle Switch Functions Starts Here
  int _getLanguageIndex(String languageCode) {
    switch (languageCode) {
      case 'en':
        return 0;
      case 'fr':
        return 1;
      case 'ar':
        return 2;
      default:
        return 0;
    }
  }

  void _changeLanguage(int? index) {
    if (index == null) return;
    if (index == 0) {
      context.setLocale(const Locale('en'));
    } else if (index == 1) {
      context.setLocale(const Locale('fr'));
    } else if (index == 2) {
      context.setLocale(const Locale('ar'));
    }
  }
  /////////// Language Toggle Switch Functions Ends Here

  @override
  Widget build(BuildContext context) {
    ThemeModeProvider themeProvider = Provider.of<ThemeModeProvider>(context);
    String localeCode = context.locale.languageCode;

    // Determine the selected flag based on the current locale
    String flagEmoji = '🇬🇧';
    if (localeCode == 'fr') flagEmoji = '🇫🇷';
    if (localeCode == 'ar') flagEmoji = '🇪🇬';

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: EdgeInsets.all(12.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// General Section
          Text(
            StringsManager.general.tr(),
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: colorScheme.primary,
            ),
          ),
          SizedBox(height: 10.h),

          // Language Setting
          ListTile(
            leading: Icon(Icons.language, color: colorScheme.onSurface),
            title: Text(StringsManager.language.tr()),
            trailing: PopupMenuButton<Locale>(
              icon: Text(flagEmoji, style: TextStyle(fontSize: 24)),
              onSelected: (Locale locale) => context.setLocale(locale),
              itemBuilder: (context) => const [
                PopupMenuItem(value: Locale('en'), child: Text('🇬🇧 English')),
                PopupMenuItem(value: Locale('fr'), child: Text('🇫🇷 Français')),
                PopupMenuItem(value: Locale('ar'), child: Text('🇪🇬 العربية')),
              ],
            ),
          ),

          // Theme Mode Setting
          ListTile(
            leading: Icon(Icons.brightness_6, color: colorScheme.onSurface),
            title: Text(StringsManager.themeMode.tr()),
            trailing: Directionality(
              textDirection: ui.TextDirection.ltr,
              child: ToggleSwitch(
                minWidth: 60.w,
                minHeight: 35.h,
                initialLabelIndex: themeProvider.currentTheme == ThemeMode.dark ? 0 : 1,
                cornerRadius: 20.0.r,
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.grey,
                inactiveFgColor: Colors.white,
                totalSwitches: 2,
                icons: [
                  Icons.dark_mode_outlined,
                  Icons.light_mode_outlined,
                ],
                iconSize: 20.0.r,
                activeBgColors: [
                  [Colors.black45, Colors.black26],
                  [Colors.yellow, Colors.orange],
                ],
                animate: true,
                curve: Curves.easeInOut,
                onToggle: (index) {
                  if (index == 0) {
                    themeProvider.changeTheme(ThemeMode.dark);
                    AppStyle.isDark = true;
                  } else {
                    themeProvider.changeTheme(ThemeMode.light);
                    AppStyle.isDark = false;
                  }
                },
              ),
            ),
          ),

          SizedBox(height: 10.h),
          Divider(thickness: 1),

          /// Personal Info Section
          Text(
            StringsManager.personalInfo.tr(),
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: colorScheme.primary,
            ),
          ),
          SizedBox(height: 10.h),

          ListTile(
            leading: Icon(Icons.lock_outline, color: colorScheme.onSurface),
            title: Text(StringsManager.changePass.tr()),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {
              // TODO: Navigate to change password screen
            },
          ),
          ListTile(
            leading: Icon(Icons.edit, color: colorScheme.onSurface),
            title: Text(StringsManager.editPro.tr()),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {
              // TODO: Navigate to edit profile screen
            },
          ),

          SizedBox(height: 10.h),
          Divider(thickness: 1),

          /// App Info Section
          Text(
            StringsManager.appInfo.tr(),
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: colorScheme.primary,
            ),
          ),
          SizedBox(height: 10.h),
          ListTile(
            leading: Icon(Icons.info_outline, color: colorScheme.onSurface),
            title: Text(StringsManager.appVer.tr()),
            trailing: Text('v1.0.0'), // You can dynamically load this using package_info_plus
          ),
        ],
      ),
    );
  }
}