import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oasisstaff/core/app_style.dart';
import 'package:oasisstaff/core/providers/thememode_provider.dart';
import 'package:oasisstaff/logIn.dart';
import 'package:provider/provider.dart';

import 'core/reusable_components/prefsHelper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await EasyLocalization.ensureInitialized();
  await PrefsHelper.init();
  runApp(EasyLocalization(supportedLocales: [Locale('en'), Locale('ar'), Locale('fr')],
  path: 'assets/translations',
      fallbackLocale: Locale('en'),
  child: ChangeNotifierProvider(
      create: (context) => ThemeModeProvider()..initTheme(),
  child: const MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    ThemeModeProvider themeProvider = Provider.of<ThemeModeProvider>(context);
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          title: 'Oasis Staff Application',
          theme: AppStyle.lightTheme,
          darkTheme: AppStyle.darkTheme ,
          themeMode: themeProvider.currentTheme,
          routes:{
            Login.routeName: (context) => Login(),
          },
          initialRoute: Login.routeName ,
          home: Login(),
        );
      },
    );
  }
}