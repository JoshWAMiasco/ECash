import 'package:auto_route/auto_route.dart';
import 'package:ecash/components/loading_screen.dart';
import 'package:ecash/components/primary_button.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:ecash/constants/enums.dart';
import 'package:ecash/constants/functions.dart';
import 'package:ecash/main.dart';
import 'package:ecash/models/transaction_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:qr_flutter/qr_flutter.dart';

class SevenElevenReciptPage extends ConsumerStatefulWidget {
  const SevenElevenReciptPage({Key? key, this.amount}) : super(key: key);
  final double? amount;

  @override
  ConsumerState<SevenElevenReciptPage> createState() => _SevenElevenReciptPageState();
}

class _SevenElevenReciptPageState extends ConsumerState<SevenElevenReciptPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColor.primary,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30, top: 10),
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.info_rounded,
                              color: AppColor.primary,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'About Cash In',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta ',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        PrimaryButton(
                          onPressed: () {
                            // TransactionModel newTransaction = TransactionModel(
                            //   amount: widget.amount,
                            //   date: DateTime.now(),
                            //   description: 'cash in via 7-Eleven with amount of PHP ' + widget.amount.toString(),
                            //   title: 'Cash In',
                            //   type: TransactionType.income,
                            // );
                            context.router.replaceNamed('/main');
                          },
                          title: 'Done',
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 90, 20, 0),
                child: Container(
                  height: 400,
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              'Show the barcode below to the cashier for payment',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Amount to be paid',
                                  style: TextStyle(fontSize: 15, color: Colors.grey.shade600),
                                ),
                                Text(
                                  'PHP ${moneyFormatter(widget.amount ?? 0 + 15.0)}',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Money sent to your \n Ecash waller',
                                  style: TextStyle(fontSize: 15, color: Colors.grey.shade600),
                                ),
                                Text(
                                  'PHP ${moneyFormatter(widget.amount ?? 0)}',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Convenience Fee',
                                  style: TextStyle(fontSize: 15, color: Colors.grey.shade600),
                                ),
                                Text(
                                  'PHP ${moneyFormatter(15.0)}',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Divider(
                            color: Colors.grey.shade500,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Valid until',
                                  style: TextStyle(fontSize: 15),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      dateFormatter(DateTime.now()),
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      '12:00 PM',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: QrImage(
                              data: 'This is a simple QR code',
                              version: QrVersions.auto,
                              size: 120,
                              gapless: false,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Consumer(
            //   builder: (context, watch, child) {
            //     final isloading = watch(userTransactions).isLoading;
            //     if (isloading) {
            //       return LoadingScreen();
            //     }
            //     return const SizedBox();
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
