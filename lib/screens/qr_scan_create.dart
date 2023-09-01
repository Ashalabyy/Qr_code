import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeCreate extends StatefulWidget {
  const QrCodeCreate({super.key});

  @override
  State<QrCodeCreate> createState() => _QrCodeCreateState();
}

class _QrCodeCreateState extends State<QrCodeCreate> {
  TextEditingController data = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: <Widget>[
              QrImage(
                size: 200,
                data: data.text,
                foregroundColor: Colors.white,
              ),
              const SizedBox(
                height: 20,
              ),
              buildTextField(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField() {
    return TextField(
      controller: data,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        suffixIcon: IconButton(
            onPressed: () => setState(() {}),
            icon: Icon(
              Icons.done,
              color: Colors.white,
            )),
        filled: true,
        fillColor: Colors.black,
        contentPadding: const EdgeInsets.only(left: 10.0),
        label: const Text('Enter your URL *'),
        labelStyle: const TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
        helperStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          gapPadding: 4.0,
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          gapPadding: 4.0,
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          gapPadding: 4.0,
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
