import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oasisstaff/core/strings_manager.dart';

class PersonalTab extends StatelessWidget {
  const PersonalTab({super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.all(16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringsManager.name.tr(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "Michael Mitch",
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 12.h),
          Divider(color: Theme.of(context).colorScheme.outline),
          SizedBox(height: 12.h),

          Text(
            StringsManager.mail.tr(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "john.c.calhoun@examplepetstore.com",
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 12.h),
          Divider(color: Theme.of(context).colorScheme.outline),
          SizedBox(height: 12.h),

          Text(
            StringsManager.phone.tr(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "123-456-7890",
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 12.h),
          Divider(color: Theme.of(context).colorScheme.outline),
          SizedBox(height: 12.h),

          Text(
            StringsManager.address.tr(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "123 Main St",
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 12.h),
          Divider(color: Theme.of(context).colorScheme.outline),
        ],
      ),
    );
  }
}