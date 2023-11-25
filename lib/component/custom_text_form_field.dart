import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  String label;
  TextInputType keyboardType;
  bool obscuretxt;
  TextEditingController controller;
  String? Function(String?)? validator;
  CustomTextFormField(
      {super.key,
      required this.label,
      this.keyboardType = TextInputType.text,
      this.obscuretxt = false,
      required this.controller,
      required this.validator,
      });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        decoration: InputDecoration(
            label: Text(
              label,
              style: theme.textTheme.bodyMedium!.copyWith(color: Colors.grey),
            ),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: theme.primaryColor, width: 3)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: theme.primaryColor, width: 2))),
        keyboardType: keyboardType,
        obscureText: obscuretxt,
        controller: controller,
        validator: validator,
      ),
    );
  }
}
