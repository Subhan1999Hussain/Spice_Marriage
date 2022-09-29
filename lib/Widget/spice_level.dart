import 'package:flutter/material.dart';

class SpiceLevel extends StatefulWidget {
  final String start_image, text, last_image;
  final double width;

  const SpiceLevel({
    Key? key,
    required this.start_image,
    required this.text,
    required this.last_image,
    required this.width,
  }) : super(key: key);

  @override
  State<SpiceLevel> createState() => _SpiceLevelState();
}

class _SpiceLevelState extends State<SpiceLevel> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.topRight,
          width: MediaQuery.of(context).size.width * 0.15,
          child: Image.asset(
            widget.start_image,
            width: widget.width,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.01,
          ),
          child: Text(
            widget.text,
            style: const TextStyle(
              fontSize: 30.0,
            ),
          ),
        ),
        const Spacer(),
        Image.asset(
          widget.last_image,
          scale: 3,
        ),
      ],
    );
  }
}
