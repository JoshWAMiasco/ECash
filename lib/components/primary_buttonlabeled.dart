import 'dart:ffi';

import 'package:ecash/components/primary_icon_button.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:flutter/material.dart';

class PriamryButtonLabeled extends StatelessWidget {
  const PriamryButtonLabeled({Key? key, this.onTap, this.label,required this.asset, this.large = false}) : super(key: key);
  final VoidCallback? onTap;
  final String? label;
  final String asset;
  final bool large;
  @override
  Widget build(BuildContext context) {
    return large
        ? GestureDetector(
            onTap: onTap,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 90,
                    height: 90,
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
                          child: Image(
                            image: AssetImage(asset),
                            height: 80,
                            width: 80,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    label ?? '',
                    style: TextStyle(
                      color: Colors.grey.shade900,
                      fontSize: 13,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          )
        : GestureDetector(
            onTap: onTap,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
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
                          child: ImageIcon(
                            AssetImage(asset),
                            size: 20,
                            color: AppColor.primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    label ?? '',
                    style: TextStyle(
                      color: Colors.grey.shade900,
                      fontSize: 13,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          );
  }
}
