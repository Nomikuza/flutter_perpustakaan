import 'package:first_flutter_vscode/pages/qr_scanner.dart';
import 'package:flutter/material.dart';
import 'package:qr_scanner/qr_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ResultScreen extends StatelessWidget {
  final String code;
  final Function() closeScreen;

  const ResultScreen(
      {super.key, required this.closeScreen, required this.code});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(children: [
          //  show QR Code here
          QrImageView(data: code, size: 150, version: QrVersions.auto),
          const Text(
            'Hasil Scan',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
              fontWeight: FontWeight.w900,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "$code",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.w900,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 100,
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () {},
              child: const Text(
                'SALIN',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
