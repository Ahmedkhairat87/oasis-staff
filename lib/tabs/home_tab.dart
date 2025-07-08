import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/reusable_components/calendar.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HorizontalCalendar(
          onDateSelected: (selectedDate) {
            print('You selected: $selectedDate');
          },
        ),
        SizedBox(height: 12.h),
        Divider(color: Theme.of(context).colorScheme.outline),
      ],
    );
  }
}
