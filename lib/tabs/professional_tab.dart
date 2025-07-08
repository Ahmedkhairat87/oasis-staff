import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/strings_manager.dart';

class ProfessionalTab extends StatelessWidget {
  const ProfessionalTab({super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.all(16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
          StringsManager.empID.tr(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "8888",
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
            StringsManager.job.tr(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "IT Department",
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
            StringsManager.schMail.tr(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "peterpan@neverland.com",
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
            StringsManager.empType.tr(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "Permenant",
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 12.h),
          Divider(color: Theme.of(context).colorScheme.outline),

          Text(
            StringsManager.manager.tr(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "IT Department",
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
            StringsManager.xper.tr(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "2 Years 5 Months",
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 12.h),
          Divider(color: Theme.of(context).colorScheme.outline),
          SizedBox(height: 12.h),
        ],
      ),
    );
  }
}