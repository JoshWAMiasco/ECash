import 'package:ecash/router/app_router.gr.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

final appRouter = AppRouter();


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await Firebase.initializeApp();
  runApp(
    ProviderScope(
      child: ResponsiveSizer(
        builder: (context, orientation, screenType) => MaterialApp.router(  
          routeInformationParser: appRouter.defaultRouteParser(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: GoogleFonts.nunito().fontFamily,
            textTheme: GoogleFonts.nunitoTextTheme()
          ),
          routerDelegate: appRouter.delegate(),
          builder:(context,child) => child!,
        ),
      ),
    )
  );
}

