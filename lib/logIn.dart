import 'package:flutter/material.dart';

import 'core/assets_Manager.dart';
import 'core/strings_manager.dart';

class Login extends StatelessWidget {
  static const String routeName = "login_screen";
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AssetsManager.logo, width: 100, height: 100),
              SizedBox(height: 20,),
              Text(StringsManager.welcome,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,),),
              Row(
                children: [
                  Text(StringsManager.to,
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,),
                  ),
                  Text(StringsManager.staffApp,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Text(StringsManager.loginContinue,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
