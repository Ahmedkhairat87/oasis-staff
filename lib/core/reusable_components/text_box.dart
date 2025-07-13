import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextBox extends StatefulWidget {
  String hint;
  Icon icon;
  TextEditingController controller;
  TextInputType keyboardType;
  bool isObscured ;
  String? Function(String?)? validator;
   CustomTextBox({
     super.key,
     required this.hint,
     required this.icon ,
     required this.controller ,
     required this.keyboardType,
     required this.isObscured,
     required this.validator,
   });

  @override
  State<CustomTextBox> createState() => _CustomTextBoxState();
}

class _CustomTextBoxState extends State<CustomTextBox> {
  late bool obscureText;
  @override
  void initState() {
    super.initState();
    obscureText = widget.isObscured;
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller ,
      keyboardType: widget.keyboardType,
      obscureText: obscureText,
      validator: widget.validator,
      //obscuringCharacter: ,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        hintStyle: Theme.of(context).textTheme.displayMedium,
        prefixIcon: IconTheme(
          data: IconThemeData(
            color: Theme.of(context).colorScheme.onSurface,
            size: 24.r,
          ),
          child: widget.icon,
        ),
        suffixIcon: widget.isObscured
            ? IconButton(
          icon: Icon(
            obscureText
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            size: 24.r,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
        )
            : null,
        hintText: widget.hint,
      ),
    );
  }
}
