
import 'package:auto_route/annotations.dart';
import 'package:ecash/pages/cash_in_page.dart';
import 'package:ecash/pages/cash_in_via_card.dart';
import 'package:ecash/pages/cash_in_via_seveneleven_page.dart';
import 'package:ecash/pages/grab_bill_page.dart';
import 'package:ecash/pages/home_credit_billpage.dart';
import 'package:ecash/pages/home_page.dart';
import 'package:ecash/pages/login_page.dart';
import 'package:ecash/pages/main_page.dart';
import 'package:ecash/pages/meralco_bill_page.dart';
import 'package:ecash/pages/otp_page.dart';
import 'package:ecash/pages/pay_bills_page.dart';
import 'package:ecash/pages/pay_qr_scanner.dart';
import 'package:ecash/pages/profile_page.dart';
import 'package:ecash/pages/qr_payment_result_page.dart';
import 'package:ecash/pages/root_page.dart';
import 'package:ecash/pages/seven_eleven_recipt.dart';
import 'package:ecash/pages/success_transaction_page.dart';
import 'package:ecash/pages/transaction_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',              
  routes: <AutoRoute>[              
    AutoRoute(
      path: '/',
      page: RootPage,
      initial: true,
    ),
    AutoRoute(path: '/cash-in', page: CashInPage),
    AutoRoute(path: '/cash-in-via-card', page: CashInViaCardPage),
    AutoRoute(path: '/cash-in-via-seven-eleven', page: CashInViaSevenElevenPage),
    AutoRoute(path: '/grab-bill', page: GrabBillPage),
    AutoRoute(path: '/home-credit-bill', page: HomeCreditBillPage),
    AutoRoute(path: '/home', page: HomePage),
    AutoRoute(path: '/login', page: LoginPage),
    AutoRoute(path: '/main', page: MainPage),
    AutoRoute(path: '/meralco_bill', page: MeralcoBillPage),
    AutoRoute(path: '/otp', page: OtpPage),
    AutoRoute(path: '/pay-bills', page: PayBillsPage),
    AutoRoute(path: '/pay-qr-scanner', page: PayQRScanner),
    AutoRoute(path: '/profile', page: ProfilePage),
    AutoRoute(path: '/qr-payment-result', page: QrPaymentResult),
    AutoRoute(path: '/seven-eleven-recipt', page: SevenElevenReciptPage),
    AutoRoute(path: '/success-transaction', page: SuccessTransactionPage),
    AutoRoute(path: '/transactions', page: TransactionPage)
  ], 
)

class $AppRouter {}