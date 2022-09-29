import 'package:flutter/material.dart';
import '../Utils/app_colors.dart';

class DetailScreenContainer extends StatefulWidget {
  final Widget child;
  const DetailScreenContainer({Key? key, required this.child})
      : super(key: key);

  @override
  State<DetailScreenContainer> createState() => _DetailScreenContainerState();
}

class _DetailScreenContainerState extends State<DetailScreenContainer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          FittedBox(
            fit: BoxFit.fitHeight,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
                color: AppColors.WHITE,
              ),
              child: widget.child,
            ),
          ),
        ],
      ),
    );
  }
}
