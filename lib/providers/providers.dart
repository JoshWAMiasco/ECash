import 'package:ecash/controllers/authentication_controller.dart';
import 'package:ecash/controllers/demo_api_controller.dart';
import 'package:ecash/controllers/product_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = ChangeNotifierProvider((ref) => AuthenticationController());
final productProvider = ChangeNotifierProvider((ref) => ProductController());
final demoProvider = ChangeNotifierProvider((ref) => DemoApiController());
