import 'dart:developer';
import 'dart:io';
import 'package:ecash/constants/app_color.dart';
import 'package:ecash/constants/app_font.dart';
import 'package:ecash/pages/qr_payment_result_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class PayQRScanner extends StatefulWidget {
  PayQRScanner({Key key}) : super(key: key);

  @override
  State<PayQRScanner> createState() => _PayQRScannerState();
}

class _PayQRScannerState extends State<PayQRScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  Barcode result;

  QRViewController controller;

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      log('qr Scanned: $scanData');
    });
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    } else if (Platform.isIOS) {
      controller.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            QRView(
              overlay: QrScannerOverlayShape(
                borderRadius: 10,
                borderColor: AppColor.green,
                borderLength: 25,
                borderWidth: 10,
              ),
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
            Positioned(
              top: 20,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 130,
                margin: const EdgeInsets.only(left: 40, right: 40),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Icon(
                            Icons.arrow_back_ios_rounded,
                            size: 30,
                            color: AppColor.primary,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () => Navigator.push(context, PageTransition(child: QrPaymentResult(), type: PageTransitionType.rightToLeft)),
                          child: Text(
                            'Scan Payment Bills',
                            style: AppFont.bold(
                              fontSize: 20,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Text(
                        'Lorem Ipsum has been the industry able content of a page when looking at its layout. The point of using Lorem',
                        style: AppFont.regular(
                          fontSize: 14,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
