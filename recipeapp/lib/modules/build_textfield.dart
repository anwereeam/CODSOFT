import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipeapp/control/signup_control.dart';

class BuildFormField extends StatefulWidget {
  late TextEditingController control;
  late int valdidatecond;
  late String hint;
  late Icon prefix;
  BuildFormField(
      {super.key,
      required this.control,
      required this.hint,
      required this.prefix,
      required this.valdidatecond});

  @override
  State<BuildFormField> createState() => _BuildFormFieldState();
}

class _BuildFormFieldState extends State<BuildFormField> {
  @override
  Widget build(BuildContext context) {
    
      return TextFormField(
        controller: widget.control,
        obscureText: widget.valdidatecond == 2 ? AuthController.instance.visibility.value : false,
        validator: widget.valdidatecond == 0
            ? (value) {
                if (value!.isEmpty) {
                  return 'user name is required';
                }
                return null;
              }
            : widget.valdidatecond == 1
                ? (value) {
                    if (value!.isEmpty) {
                      return 'email is required';
                    } else if (!value.isEmail) {
                      return 'wrong email';
                    }
                    return null;
                  }
                : (value) {
                    if (value!.isEmpty) {
                      return 'password is required';
                    } else if (value.length < 8) {
                      return 'Minimum length is 8';
                    }
                    return null;
                  },
        decoration: widget.valdidatecond == 2
            ? InputDecoration(
                suffixIcon: IconButton(
                    onPressed: AuthController.instance.visibility == false.obs
                        ? () {
                            AuthController.instance.visibility= true.obs;
                            setState(() {});
                          }
                        : () {
                            AuthController.instance.visibility = false.obs;
                            setState(() {});
                          },
                    icon: AuthController.instance.visibility == true.obs?Icon(Icons.visibility_rounded):Icon(Icons.visibility_off_rounded)),
                prefixIcon: widget.prefix,
                hintText: widget.hint,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              )
            : InputDecoration(
                prefixIcon: widget.prefix,
                hintText: widget.hint,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
      );
  }
}
