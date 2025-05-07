import 'package:flutter/material.dart';

class CustomTextFieldStyle extends StatelessWidget {
  const CustomTextFieldStyle(
      {super.key,
      required this.fieldController,
      this.validator,
      this.onChanged,
      this.textInputAction,
      this.prefixIcon,
      this.suffixIcon,
      this.labelText,
      this.hintText,
      required this.fieldName,
      this.focusNode,
      required this.autoFocus,
      required this.obscureText,
      this.keyboardType,
      this.onTap});

  final TextEditingController fieldController;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? labelText;
  final String? hintText;
  final String fieldName;
  final FocusNode? focusNode;
  final bool autoFocus;
  final bool obscureText;
  final TextInputType? keyboardType;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        validator: validator,
        controller: fieldController,
        onChanged: onChanged,
        onTap: onTap,
        keyboardType: keyboardType,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        autofocus: autoFocus,
        obscureText: obscureText,
        textInputAction: textInputAction,
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        cursorColor: Colors.black,
//        inputFormatters: [],
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w300),
            labelText: fieldName,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            errorMaxLines: 1,
            errorStyle: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.red)),
      ),
    );
  }
}
