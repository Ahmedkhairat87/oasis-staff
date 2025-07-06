import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oasisstaff/core/app_style.dart';
import 'package:oasisstaff/core/constants.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:oasisstaff/core/reusable_components/custom_button.dart';
import 'package:oasisstaff/core/reusable_components/text_box.dart';
import 'package:oasisstaff/core/assets_Manager.dart';
import 'package:oasisstaff/core/strings_manager.dart';
import 'dart:ui' as ui;

import 'core/providers/thememode_provider.dart';

class Login extends StatefulWidget {
  static const String routeName = "login_screen";

  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController usernameController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  ///////////Login With Google Starts Here
  loginWithGoogle(){}
  ///////////Login With Google Ends Here

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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.r),
          width: double.infinity,
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(AssetsManager.logo, width: 100.w, height: 100.h),
                    SizedBox(height: 20.h),
                    Text(
                      StringsManager.welcome.tr(),
                      style: textTheme.headlineLarge?.copyWith(
                        color: colorScheme.onPrimary,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          StringsManager.to.tr(),
                          style: textTheme.headlineLarge?.copyWith(
                            color: colorScheme.onPrimary,
                          ),
                        ),
                        Text(
                          StringsManager.staffApp.tr(),
                          style: textTheme.headlineLarge?.copyWith(
                            color: colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      StringsManager.loginContinue.tr(),
                      style: textTheme.labelMedium?.copyWith(
                        color: colorScheme.onSurface,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    CustomTextBox(
                      hint: StringsManager.userName.tr(),
                      icon: const Icon(Icons.account_box),
                      controller: usernameController,
                      keyboardType: TextInputType.emailAddress,
                      isObscured: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return StringsManager.enterUname.tr();
                        }
                        if (!RegExp(emailRegex).hasMatch(value)){
                          return StringsManager.mailNotValid.tr();
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.h),
                    CustomTextBox(
                      hint: StringsManager.Password.tr(),
                      icon: const Icon(Icons.password),
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      isObscured: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return StringsManager.enterPassword.tr();
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                ////Login Button Starts
                CustomButton(
                  txt: StringsManager.Login.tr(),
                  onPressed: () {
                    if (
                    formKey.currentState!.validate()
                    ) {
                      print("Login Successful");
                    }
                  },
                ),
                ////Login Button Ends
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.w),
                        height: 1.h,
                        color: colorScheme.onSurface.withOpacity(0.5),
                      ),),
                    Text(StringsManager.conWizGog.tr(),
                      style: textTheme.labelMedium?.copyWith(
                        color: colorScheme.onSurface,),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.w),
                        height: 1.h,
                        color: colorScheme.onSurface.withOpacity(0.5),
                      ),),
                  ],
                ),
                SizedBox(height: 20.h),
                ////Google Button Starts Here
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  onPressed: () {
                    loginWithGoogle();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AssetsManager.google,
                        width: 25,
                        height: 25,
                      ),
                      const SizedBox(width: 20),
                      Text(StringsManager.googleLogin.tr(),),
                    ],
                  ),
                ),
                ////Google Button Ends Here
                SizedBox(height: 20.h),
                Expanded(
                  child: Directionality(
                    textDirection: ui.TextDirection.ltr,
                    child: Column(
                      children: [
                        ////Language Toggle Switch Starts
                        Center(
                          child: ToggleSwitch(
                            minWidth: 95.0.w,
                            minHeight: 50.0.h,
                            fontSize: 16.0.sp,
                            initialLabelIndex:
                            _getLanguageIndex(context.locale.languageCode),
                            activeBgColor: [colorScheme.primary],
                            activeFgColor: Colors.white,
                            inactiveBgColor: Colors.grey[300],
                            inactiveFgColor: Colors.grey[900],
                            totalSwitches: 3,
                            labels: ['English', 'Française', 'العربية'],
                            onToggle: _changeLanguage,
                          ),
                        ),
                        ////Language Toggle Switch Ends
                        SizedBox(height: 20.h),
                        ////Theme Toggle Switch Starts
                        Center(
                          child: ToggleSwitch(
                            minWidth: 90.0.w,
                            minHeight: 70.0.h,
                            //initialLabelIndex: 0,
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
                            iconSize: 30.0.r,
                            activeBgColors: [[Colors.black45, Colors.black26], [Colors.yellow, Colors.orange]],
                            animate: true, // with just animate set to true, default curve = Curves.easeIn
                            curve: Curves.bounceInOut, // animate must be set to true when using custom curve
                            onToggle: (index) {
                              if (index == 0) {
                                themeProvider.changeTheme(ThemeMode.dark);
                                AppStyle.isDark = true;
                              } else if (index == 1) {
                                themeProvider.changeTheme(ThemeMode.light);
                                AppStyle.isDark = false;
                              }
                            },
                          ),
                        ),
                        ////Theme Toggle Switch Ends
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}