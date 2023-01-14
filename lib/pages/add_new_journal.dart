import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ecash/components/loading_indicator.dart';
import 'package:ecash/components/message_dialog.dart';
import 'package:ecash/components/primary_button.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:ecash/models/journal_book_model.dart';
import 'package:ecash/models/journal_item_model.dart';
import 'package:ecash/pages/primary_textfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:uuid/uuid.dart';

class AddNewJournalPage extends StatefulWidget {
  const AddNewJournalPage({super.key});

  @override
  State<AddNewJournalPage> createState() => _AddNewJournalPageState();
}

class _AddNewJournalPageState extends State<AddNewJournalPage> {
  int currentJournalCount = 0;
  DateTime dateNow = DateTime.now();
  final f = DateFormat('MMM d y');
  String dateNowString = '';
  double totalCredit = 0.0;
  double totalDebit = 0.0;
  String journalId = 'Loading...';
  bool enableSave = false;
  TextEditingController notesController = TextEditingController();

  List<JournalItemModel> listOfJournalItem = [];

  var fn = NumberFormat("0000");

  @override
  void initState() {
    getCurrentJournalCount();
    dateNowString = f.format(dateNow);
    super.initState();
  }

  getCurrentJournalCount() async {
    await FirebaseFirestore.instance
        .collection('Counting')
        .doc('JournalCount')
        .get()
        .then((query) {
      if (query.data() != null) {
        currentJournalCount = (query.data()!['count'] as num).toInt();
      }
    });
    setState(() {
      journalId = 'J${dateNow.year}-${fn.format(currentJournalCount)}';
    });
  }

  void addItem(JournalItemModel newItem) {
    setState(() {
      listOfJournalItem.add(newItem);
    });
  }

  void removeItem(int index) {
    setState(() {
      listOfJournalItem.removeAt(index);
    });
  }

  void computeTotal() {
    double debTotal = 0.0;
    double credTotal = 0.0;
    if (listOfJournalItem.isNotEmpty) {
      for (JournalItemModel jornal in listOfJournalItem) {
        if (jornal.debitCreditAccount == 'debit') {
          debTotal += jornal.amount ?? 0.0;
        } else {
          credTotal += jornal.amount ?? 0.0;
        }
      }
      setState(() {
        totalCredit = credTotal;
        totalDebit = debTotal;
      });
    }
  }

  void updateAmount(int index, double newAmount) {
    listOfJournalItem[index].amount = newAmount;
    computeTotal();
  }

  void updateDebCredAccount(int index, String newType) {
    listOfJournalItem[index].debitCreditAccount = newType;
    computeTotal();
  }

  void updateChartAccount(int index, String newType) {
    listOfJournalItem[index].chartOfAccount = newType;
  }

  void saveJournal() async {
    loadingIndicator(context);
    JournalBookModel jornal = JournalBookModel(
      date: DateTime.now(),
      id: journalId,
      totalCredit: totalCredit,
      totalDebit: totalDebit,
      items: listOfJournalItem,
      notes: notesController.text,
    );

    await FirebaseFirestore.instance
        .collection('Journals')
        .doc(journalId)
        .set(jornal.toJson())
        .whenComplete(() async {
      // increment current Count

      await FirebaseFirestore.instance
          .collection('Counting')
          .doc('JournalCount')
          .update({
        "count": FieldValue.increment(1),
      }).whenComplete(() {
        Navigator.of(context, rootNavigator: true).pop();
        messageDialog(context, title: 'Success', content: 'Journal Saved!');
      });
    });
  }

  void checkEnableSave() {
    if (listOfJournalItem.isEmpty) {
      setState(() {
        enableSave = false;
      });
    } else {
      setState(() {
        enableSave = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        title: const Text(
          'Journal Entry',
        ),
      ),
      bottomNavigationBar: Container(
        color: AppColor.primary,
        height: 16.h,
        padding: EdgeInsets.all(15.sp),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Debit: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '₱ $totalDebit',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Credit: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '₱ $totalCredit',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 40.w,
                  child: PrimaryButton(
                    backgroundColor: enableSave
                        ? Colors.white
                        : Colors.white.withOpacity(0.5),
                    titleColor: AppColor.primary,
                    title: 'Save',
                    onPressed: () {
                      if (enableSave) {
                        if (totalCredit != totalDebit) {
                          messageDialog(context,
                              title: 'Alert',
                              content: 'Total debit and credit does not match');
                          return;
                        }
                        saveJournal();
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: 40.w,
                  child: PrimaryButton(
                    backgroundColor: Colors.white,
                    titleColor: Colors.red,
                    title: 'Cancel',
                    onPressed: () {
                      listOfJournalItem.clear();
                      journalId = '';
                      totalCredit = 0.0;
                      totalDebit = 0.0;
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 20.sp,
            right: 20.sp,
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(20.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      journalId,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                        color: AppColor.primary,
                      ),
                    ),
                    Text(
                      dateNowString,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                        color: AppColor.primary,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: AppColor.primary,
                thickness: 2.sp,
              ),
              Builder(
                builder: (context) {
                  if (listOfJournalItem.isNotEmpty) {
                    return Column(
                      children: List.generate(
                          listOfJournalItem.length,
                          (index) => JournalItemCard(
                                onChangeChartAccount: (value) {
                                  updateChartAccount(index, value!);
                                },
                                onChangeDebCredAccount: (value) {
                                  updateDebCredAccount(index, value!);
                                },
                                amountOnChange: (value) {
                                  if (value.isNotEmpty) {
                                    double amount = double.parse(value);
                                    updateAmount(index, amount);
                                  }
                                },
                                onClose: () {
                                  removeItem(index);
                                  checkEnableSave();
                                },
                              )),
                    );
                  } else {
                    return const Text(
                      'No Item',
                    );
                  }
                },
              ),
              SizedBox(
                height: 5.h,
              ),
              PrimaryButton(
                title: 'Add New',
                onPressed: () {
                  addItem(
                    JournalItemModel(
                      amount: 0.0,
                      chartOfAccount: '',
                      debitCreditAccount: 'debit',
                    ),
                  );

                  checkEnableSave();
                },
              ),
              SizedBox(
                height: 1.h,
              ),
              PrimaryTextField(
                controller: notesController,
                hint: 'Notes',
                height: 35.h,
                textInputType: TextInputType.multiline,
                maxLines: 5,
              ),
              SizedBox(
                height: 5.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class JournalItemCard extends StatefulWidget {
  const JournalItemCard({
    super.key,
    this.onClose,
    this.onChangeDebCredAccount,
    this.amountOnChange,
    this.onChangeChartAccount,
  });
  final VoidCallback? onClose;
  final Function(String?)? onChangeDebCredAccount;
  final Function(String)? amountOnChange;
  final Function(String?)? onChangeChartAccount;
  @override
  State<JournalItemCard> createState() => _JournalItemCardState();
}

class _JournalItemCardState extends State<JournalItemCard> {
  final List<String> items = [
    'Cash Sales',
    'Sales Return',
    'Purchases',
    'Purchase Return',
    'Cost of Sales',
    'Office Supplies',
    'Advertising',
    'Miscellaneous Expense',
    'Cash on Hand',
    'Josh Capital',
    'Other Contribution',
    'Inventories',
    'Equipments',
    'Miscellaneous Income',
    'Dynamic'
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(
        top: 20.sp,
      ),
      color: AppColor.ligthBlue,
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Debit/Credit Account: ',
                  style: TextStyle(
                    color: AppColor.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 17.sp,
                  ),
                ),
                IconButton(
                  onPressed: widget.onClose,
                  icon: Icon(
                    Icons.close,
                    color: AppColor.primary,
                  ),
                )
              ],
            ),
            DefaultTabController(
              length: 2,
              child: TabBar(
                onTap: (index) {
                  if (index == 0) {
                    widget.onChangeDebCredAccount!('debit');
                  } else {
                    widget.onChangeDebCredAccount!('creit');
                  }
                },
                indicatorColor: AppColor.primary,
                labelColor: AppColor.primary,
                unselectedLabelColor: Colors.grey,
                labelStyle: TextStyle(
                  color: AppColor.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 17.sp,
                ),
                tabs: [
                  const Tab(
                    text: 'Debit',
                  ),
                  const Tab(
                    text: 'Credit',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton2(
                isExpanded: true,
                hint: Row(
                  children: const [
                    Icon(
                      Icons.list,
                      size: 16,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Text(
                        'Chart of Accounts',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                items: items
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                    .toList(),
                value: selectedValue,
                onChanged: (value) {
                  widget.onChangeChartAccount!(value as String);
                  setState(() {
                    selectedValue = value;
                  });
                },
                icon: const Icon(
                  Icons.arrow_forward_ios_outlined,
                ),
                iconSize: 14,
                iconEnabledColor: Colors.white,
                iconDisabledColor: Colors.grey,
                buttonHeight: 50,
                buttonWidth: 100.w,
                buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                buttonDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: Colors.black26,
                  ),
                  color: AppColor.primary,
                ),
                buttonElevation: 2,
                itemHeight: 40,
                itemPadding: const EdgeInsets.only(left: 14, right: 14),
                dropdownMaxHeight: 200,
                dropdownWidth: 200,
                dropdownPadding: null,
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: AppColor.primary,
                ),
                dropdownElevation: 8,
                scrollbarRadius: const Radius.circular(40),
                scrollbarThickness: 6,
                scrollbarAlwaysShow: true,
                offset: const Offset(-20, 0),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            PrimaryTextField(
              onChange: widget.amountOnChange,
              hint: 'Amount',
              textInputType: TextInputType.number,
            ),
          ],
        ),
      ),
    );
  }
}
