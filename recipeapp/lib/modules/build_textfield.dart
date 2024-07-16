import 'package:flutter/material.dart';
class FormField extends StatelessWidget {
  late TextEditingController control;
  late String? Function(String?) validate;
  late String hint;
  late Icon prefix;
  FormField({super.key, required this.control,required this.hint,required this.prefix,required this.validate});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: control,
      validator: validate,
      decoration: InputDecoration(
        prefixIcon: prefix,
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
