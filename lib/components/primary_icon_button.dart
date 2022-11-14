import 'package:ecash/constants/app_color.dart';
import 'package:flutter/material.dart';

class PrimaryIconButton extends StatelessWidget {
  const PrimaryIconButton({Key? key, this.onTap, this.icon}) : super(key: key);
  final VoidCallback? onTap;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                icon,
                color: AppColor.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
