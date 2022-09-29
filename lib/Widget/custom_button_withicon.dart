import 'package:flutter/material.dart';

class CustomButtonWithIcon extends StatefulWidget {
  final String text;
  final String btnimg;
  final Color color;
  final Color textcolor;
  final Function()? onclick;

  const CustomButtonWithIcon({
    Key? key,
    required this.text,
    required this.btnimg,
    required this.color,
    required this.textcolor,
    this.onclick,
  }) : super(key: key);

  @override
  State<CustomButtonWithIcon> createState() => _CustomButtonWithIconState();
}

class _CustomButtonWithIconState extends State<CustomButtonWithIcon> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.08,
        right: MediaQuery.of(context).size.width * 0.08,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.08,
        child: ElevatedButton(
          onPressed: widget.onclick,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(widget.color),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                widget.btnimg,
                scale: 3.5,
                color: widget.textcolor,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.025,
              ),
              Text(
                widget.text,
                style: TextStyle(
                  color: widget.textcolor,
                  fontSize: 25.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
