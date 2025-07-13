import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class HorizontalCalendar extends StatefulWidget {
  final Function(DateTime) onDateSelected;

  const HorizontalCalendar({super.key, required this.onDateSelected});

  @override
  State<HorizontalCalendar> createState() => _HorizontalCalendarState();
}

class _HorizontalCalendarState extends State<HorizontalCalendar> {
  DateTime selectedDate = DateTime.now();
  List<DateTime> dates = [];

  @override
  void initState() {
    super.initState();
    _generateWeek();
  }

  void _generateWeek() {
    final today = DateTime.now();
    final start = today.subtract(Duration(days: today.weekday - 1)); // Monday
    for (int i = 0; i < 30; i++) {
      dates.add(start.add(Duration(days: i)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: 110.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dates.length,
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        itemBuilder: (context, index) {
          final date = dates[index];
          final isSelected = date.day == selectedDate.day &&
              date.month == selectedDate.month &&
              date.year == selectedDate.year;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedDate = date;
              });
              widget.onDateSelected(date);
            },
            child: Container(
              width: 65.w,
              margin: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: isSelected ? colorScheme.primary : Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  if (isSelected)
                    BoxShadow(
                      color: colorScheme.primary.withOpacity(0.3),
                      blurRadius: 6,
                    ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Day
                  Text(
                    DateFormat('dd').format(date),
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  // Weekday (e.g. Mon)
                  Text(
                    DateFormat('E').format(date),
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: isSelected ? Colors.white : Colors.black87,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  // Month (e.g. Jul)
                  Text(
                    DateFormat('MMM').format(date),
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: isSelected ? Colors.white70 : Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}