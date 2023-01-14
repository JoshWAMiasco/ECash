import 'package:ecash/components/primary_buttonlabeled.dart';
import 'package:ecash/components/primary_icon_button.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:ecash/pages/journal_page.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BookKeepingPage extends StatefulWidget {
  const BookKeepingPage({super.key});

  @override
  State<BookKeepingPage> createState() => _BookKeepingPageState();
}

class _BookKeepingPageState extends State<BookKeepingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        title: Text(
          'BookKeeping App',
        ),
      ),
      body: SafeArea(
        child: Container(
          color: AppColor.background,
          padding: EdgeInsets.all(20.sp),
          child: Column(
            children: [
              Row(
                children: [
                  PriamryButtonLabeled(
                    icon: Icon(
                      Icons.book,
                      color: AppColor.primary,
                    ),
                    label: 'Journal',
                    large: true,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => JournalPage()));
                    },
                  ),
                  PriamryButtonLabeled(
                    icon: Icon(
                      Icons.currency_bitcoin_rounded,
                      color: AppColor.primary,
                    ),
                    label: 'Expense',
                    large: true,
                    onTap: () {},
                  ),
                  PriamryButtonLabeled(
                    icon: Icon(
                      Icons.save,
                      color: AppColor.primary,
                    ),
                    label: 'Save',
                    large: true,
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
