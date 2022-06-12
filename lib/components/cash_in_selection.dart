import 'package:ecash/constants/app_color.dart';
import 'package:ecash/constants/app_font.dart';
import 'package:ecash/providers/selector_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CashInSelection extends StatelessWidget {
  const CashInSelection({this.onChange, Key key}) : super(key: key);
  final Function(double) onChange;
  @override
  Widget build(BuildContext context) {
    final selectorProvider = ChangeNotifierProvider((ref) => SelectorProvider(""));
    return Align(
      alignment: Alignment.centerLeft,
      child: Wrap(
        runSpacing: 10,
        spacing: 10,
        children: List.generate(6, (index) {
          return GestureDetector(
            onTap: () {
              context.read(selectorProvider).select(index.toString());
              onChange(double.parse((index + 1).toString() + "000.00"));
            },
            child: Consumer(
              builder: (context, watch, child) {
                final selector = watch(selectorProvider);
                return Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: selector.currentSelected == index.toString() ? AppColor.primary : Colors.grey,
                  ),
                  child: Text(
                    (index + 1).toString() + ',000',
                    style: AppFont.bold(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
