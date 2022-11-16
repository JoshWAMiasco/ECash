import 'package:ecash/controllers/authentication_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = ChangeNotifierProvider((ref) => AuthenticationController());
