import 'package:ecash/repository/demo_api_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DemoApiController extends ChangeNotifier {
  AsyncValue<List<dynamic>> data = const AsyncValue.loading();
  final apiRepository = DemoApiRepository();
  void getUser() async {
    final res = await apiRepository.getUsers();
    if (res.failure == false) {
      data = AsyncValue.data(res.data!);
    } else {
      data = AsyncValue.error('error', StackTrace.current);
    }
    notifyListeners();
  }
}
