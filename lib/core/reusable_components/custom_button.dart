import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String txt;
  final void Function() onPressed;
  const CustomButton({super.key , required this.txt, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        )
      ),
        onPressed: onPressed,
        child: Text(txt,
        style: Theme.of(context).textTheme.displaySmall ,
        )
    );
  }
}
