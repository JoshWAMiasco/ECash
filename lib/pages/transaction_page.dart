import 'package:ecash/components/primary_appbar.dart';
import 'package:ecash/components/transaction_card.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:ecash/models/transaction_model.dart';
import 'package:ecash/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TransactionPage extends ConsumerStatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  ConsumerState<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends ConsumerState<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: AppColor.background,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 70,
                      ),
                      ref.watch(transactionProvider).transactions.when(
                          loading: () {
                            return Center(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20, bottom: 20),
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.transparent,
                                  valueColor: AlwaysStoppedAnimation<Color>(AppColor.primary),
                                ),
                              ),
                            ); 
                          }, 
                          error: (_, stackTrace) {
                            return const Center(
                              child: Text(
                                'Went somethinf wrong',
                              ),
                            );
                          },
                          data: (transaction) {
                            if (transaction.isNotEmpty) {
                              return Column(
                                children: List.generate(transaction.length, (index) {
                                  return TransactionCard(
                                    amount: transaction[index].amount,
                                    date: transaction[index].date!,
                                    description: transaction[index].description,
                                    title: transaction[index].title,
                                    type: transaction[index].type,
                                  );
                                }),
                              );
                            } else {
                              return const Center(
                                child: Text(
                                  'No transaction yet.'
                                ),
                              );
                            }
                          }
                        ),
                    ],
                  ),
                ),
              ),
              PrimaryAppBar(
                onBack: () => Navigator.pop(context),
                title: 'Transaction',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
