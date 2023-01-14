import 'package:ecash/constants/app_color.dart';
import 'package:ecash/models/journal_book_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class JournalPreviewPage extends StatelessWidget {
  JournalPreviewPage({super.key, required this.journal});
  final JournalBookModel journal;
  final f = DateFormat('MMM d y');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        title: Text(
          journal.id!,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 20.sp,
          right: 20.sp,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20.sp,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(journal.items!.length, (index) {
                  return Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                journal.items![index].debitCreditAccount! ==
                                        'debit'
                                    ? 'Dr'
                                    : 'Cr',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp,
                                ),
                              ),
                              Text(
                                journal.items![index].chartOfAccount!,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.primary,
                                  fontSize: 20.sp,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '₱ ${journal.items![index].amount}',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18.sp,
                            ),
                          )
                        ],
                      ),
                      Divider(
                        color: AppColor.primary,
                        thickness: 3,
                      )
                    ],
                  );
                }),
              ),
              SizedBox(
                height: 10.sp,
              ),
              SizedBox(
                width: double.infinity,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Notes: ',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                        Text(
                          journal.notes!,
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.sp,
              )
            ],
          ),
        ),
      ),
    );
  }
}
