import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oasisstaff/core/api-control/apiServiceProvider.dart';
import 'package:oasisstaff/core/api-control/apiManager.dart';
import 'package:oasisstaff/core/app_style.dart';
import 'package:oasisstaff/core/constants.dart';
import 'package:oasisstaff/core/services/loginServices/AuthLoginService.dart';
import 'package:oasisstaff/model/sourcesResponse/LoginResponse.dart';
import 'package:provider/provider.dart';
import 'package:oasisstaff/core/reusable_components/custom_button.dart';
import 'package:oasisstaff/core/reusable_components/text_box.dart';
import 'package:oasisstaff/core/assets_Manager.dart';
import 'package:oasisstaff/core/strings_manager.dart';
import 'core/providers/thememode_provider.dart';
import 'home.dart';

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
  loginWithGoogle() {}
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
    String localeCode = context.locale.languageCode;

    // Determine the selected flag based on the current locale
    String flagEmoji = '🇬🇧';
    if (localeCode == 'fr') flagEmoji = '🇫🇷';
    if (localeCode == 'ar') flagEmoji = '🇪🇬';

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                      Row(
                        children: [
                          Image.asset(AssetsManager.logo, width: 100.w, height: 100.h),
                          Spacer(),
                        ],
                      ),
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
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      LoginResponse response = await AuthLoginService.login(
                          username: usernameController.text,
                          password: passwordController.text,
                          deviceId: "",
                          deviceType: "",
                          fcmToken: ""
                      );

                      if (response.token != null && response.token != "") {
                        final userData = response.data?.isNotEmpty == true ? response.data!.first : null;
                        print("✅ Welcome ${userData?.empName}");
                        print("🔑 Token: ${response.token}");
                        Navigator.pushNamed(context,HomeScreen.routeName);

                      } else {
                        print("❌ Error:");
                      }

                    }

                    //validation
                    else {
                      print("🛑 Validation Error");
                    }

                    }
                ),
                ////Login Button Ends
               

                  ),
                 
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10.w),
                          height: 1.h,
                          color: colorScheme.onSurface.withOpacity(0.5),
                        ),
                      ),
                      Text(
                        StringsManager.conWizGog.tr(),
                        style: textTheme.labelMedium?.copyWith(
                          color: colorScheme.onSurface,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10.w),
                          height: 1.h,
                          color: colorScheme.onSurface.withOpacity(0.5),
                        ),
                      ),
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
                        Text(
                          StringsManager.googleLogin.tr(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50.h),
                  ////Google Button Ends Here

                  ////Language & Mode Toggles Starts Here
                  /*Directionality(
                    textDirection: ui.TextDirection.ltr,
                    child: Row(
                      children: [
                        PopupMenuButton<Locale>(
                          icon: Text(flagEmoji, style: TextStyle(fontSize: 24)),
                          onSelected: (Locale locale) {
                            context.setLocale(locale);
                          },
                          itemBuilder: (context) => const [
                            PopupMenuItem(
                              value: Locale('en'),
                              child: Text('🇬🇧 English'),
                            ),
                            PopupMenuItem(
                              value: Locale('fr'),
                              child: Text('🇫🇷 Français'),
                            ),
                            PopupMenuItem(
                              value: Locale('ar'),
                              child: Text('🇸🇦 العربية'),
                            ),
                          ],
                        ),
                        Spacer(),
                        ToggleSwitch(
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
                            } else if (index == 1) {
                              themeProvider.changeTheme(ThemeMode.light);
                              AppStyle.isDark = false;
                            }
                          },
                        ),
                      ],
                    ),
                  ),*/
                  ////Language & Mode Toggles Ends Here
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

