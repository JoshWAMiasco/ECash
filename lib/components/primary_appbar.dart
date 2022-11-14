import 'package:ecash/constants/app_color.dart';
import 'package:flutter/material.dart';

class PrimaryAppBar extends StatelessWidget {
  const PrimaryAppBar({Key? key, this.title, this.onBack}) : super(key: key);
  final String? title;
  final VoidCallback? onBack;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(color: AppColor.primary, borderRadius: BorderRadius.circular(10)),
      height: 45,
      width: double.infinity,
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: onBack,
            child: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            title ?? '',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
