import 'dart:io';

import 'package:first_flutter_vscode/pages/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:first_flutter_vscode/pages/result_screen.dart';

const bgColor = Color(0xfffafafa);

class QRScanner extends StatefulWidget {
  const QRScanner({super.key});

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  bool isScanCompleted = false;

  void closeScreen() {
    isScanCompleted = false;
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  void onQRViewCamera(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "QR Scanner",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Arahkan kamera ke QR Code',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Scanning akan terotomatisasi',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        )),
                  ]),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 4,
              child: QRView(
                key: qrKey,
                onQRViewCreated: onQRViewCamera,
              ),
            ),
            Expanded(
                flex: 4,
                child: Center(
                  child: (result != null)
                      ? Text('Data: ${result!.code}')
                      : const Text('Scan kode'),
                )),
            Expanded(
                child: Container(
              alignment: Alignment.center,
              child: const Text(
                'Lib - E',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
