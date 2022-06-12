import 'package:ecash/pages/root_page.dart';
import 'package:ecash/providers/transaction_provider.dart';
import 'package:ecash/providers/user_provider.dart';
import 'package:ecash/utils/navigaton_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = ChangeNotifierProvider((ref) => UserProvider());
final userTransactions = ChangeNotifierProvider((ref) => TransactionProvider());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(
      ProviderScope(
        child: MaterialApp(
          navigatorKey: NavigationService().navigationKey,
          debugShowCheckedModeBanner: false,
          home: RootPage(),
        ),
      ),
    );
  });
}
