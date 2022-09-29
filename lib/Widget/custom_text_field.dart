import 'package:flutter/material.dart';
import '../Utils/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final String texthint;
  final TextEditingController? fieldcontroller;
  final String? Function(String?)? fieldvalidator;
  bool? password_hidden;

  CustomTextField({
    Key? key,
    required this.texthint,
    this.fieldcontroller,
    this.fieldvalidator,
    this.password_hidden = false,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.08,
        right: MediaQuery.of(context).size.width * 0.08,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: AppColors.WHITE.withOpacity(.5),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.09,
        child: TextFormField(
          obscureText: widget.password_hidden!,
          validator: widget.fieldvalidator,
          controller: widget.fieldcontroller,
          style: const TextStyle(
            fontSize: 30.0,
          ),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                top: MediaQuery.of(context).size.width * 0.01,
                bottom: MediaQuery.of(context).size.width * 0.01,
                left: MediaQuery.of(context).size.width * 0.07,
              ),
              errorStyle: const TextStyle(fontSize: 15),
              border: InputBorder.none,
              hintText: widget.texthint,
              hintStyle: const TextStyle(
                color: AppColors.BLACK,
              )),
        ),
      ),
    );
  }
}
