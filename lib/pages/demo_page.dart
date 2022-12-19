import 'package:ecash/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DemoPage extends ConsumerStatefulWidget {
  const DemoPage({Key? key}) : super(key: key);

  @override
  ConsumerState<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends ConsumerState<DemoPage> {
  @override
  void initState() {
    super.initState();
    ref.read(demoProvider).getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo Page'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: ref.watch(demoProvider).data.when(loading: () {
          return const CircularProgressIndicator();
        }, data: (data) {
          return SingleChildScrollView(
            child: Column(
              children: List.generate(data.length, (index) {
                return ListTile(
                  title: Text(data[index]['title'] ?? ''),
                  subtitle: Text(data[index]['description'] ?? ''),
                );
              }),
            ),
          );
        }, error: (err, _) {
          return const Text(
            'Went something wrong',
          );
        }),
      ),
    );
  }
}
