import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScanPage extends StatefulWidget {
  const QrScanPage({super.key});

  @override
  State<QrScanPage> createState() => _QrScanPageState();
}

class _QrScanPageState extends State<QrScanPage> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? barcode;
  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          buildQrview(context),
          Positioned(
            bottom: 30,
            child: Text(
              barcode != null ? '${barcode!.code}' : 'Scan Code',
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void qrViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((barcode) {
      this.barcode = barcode;
    });
  }

  Widget buildQrview(BuildContext context) => QRView(
        key: qrKey,
        overlay: QrScannerOverlayShape(
          borderWidth: 10,
          borderColor: Colors.green,
          borderLength: 10,
          borderRadius: 10,
          cutOutSize: MediaQuery.of(context).size.width * 0.8,
        ),
        onQRViewCreated: qrViewCreated,
      );
}
