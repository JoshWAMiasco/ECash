import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:ecash/models/journal_book_model.dart';
import 'package:ecash/pages/add_new_journal.dart';
import 'package:ecash/pages/journal_preview_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class JournalPage extends StatefulWidget {
  const JournalPage({super.key});

  @override
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  List<JournalBookModel> listOfBookJornal = <JournalBookModel>[];
  bool isLoading = true;
  final f = DateFormat('d MMM y');
  var fn = NumberFormat("0000");
  @override
  void initState() {
    getListOfJournals();
    super.initState();
  }

  getListOfJournals() async {
    setState(() {
      isLoading = true;
    });
    await FirebaseFirestore.instance.collection('Journals').get().then(
      (query) {
        if (query.docs.isNotEmpty) {
          for (var doc in query.docs) {
            JournalBookModel journal = JournalBookModel.fromJson(doc.data());
            listOfBookJornal.add(journal);
          }
          setState(() {
            listOfBookJornal = listOfBookJornal;
            isLoading = false;
          });
        } else {
          setState(() {
            isLoading = false;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        title: Text(
          'Journal List',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 17.sp,
            right: 17.sp,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 5.h,
              ),
              Builder(
                builder: (context) {
                  if (isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (isLoading == false && listOfBookJornal.isNotEmpty) {
                    return Column(
                      children: List.generate(listOfBookJornal.length, (index) {
                        return JournalListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => JournalPreviewPage(
                                        journal: listOfBookJornal[index])));
                          },
                          date: f.format(listOfBookJornal[index].date!),
                          journalId: listOfBookJornal[index].id,
                          notes: listOfBookJornal[index].notes,
                        );
                      }),
                    );
                  }
                  return const Center(
                    child: Text(
                      'No List available',
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddNewJournalPage()));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: AppColor.primary,
      ),
    );
  }
}

class JournalListTile extends StatelessWidget {
  const JournalListTile(
      {super.key, this.journalId, this.date, this.notes, this.onTap});
  final String? journalId;
  final String? date;
  final String? notes;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: AppColor.ligthBlue,
        child: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Chip(
                    visualDensity: VisualDensity.compact,
                    backgroundColor: AppColor.primary,
                    label: Text(
                      journalId!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(date!)
                ],
              ),
              SizedBox(height: 10.sp),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Notes:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  Text(
                    notes!,
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
