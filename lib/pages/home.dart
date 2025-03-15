import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrcode_app/components/header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  String qrcodeText = "";

  void _generateQrCode() {
    setState(() {
      qrcodeText = _controller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double width = screenSize.width;
    final double height = screenSize.height;

    return Scaffold(
      appBar: appBar(title: "QRcode Generator"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: width * 0.5,
                  height: height * 0.06,
                  child: TextField(
                    controller: _controller,
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: "Place your text here",
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.text,
                    maxLines: 1,
                    scrollPhysics: BouncingScrollPhysics(),
                    scrollController: ScrollController(),
                  ),
                ),
                SizedBox(height: height * 0.015),
                FilledButton(
                  onPressed: _generateQrCode,
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(Colors.teal),
                    fixedSize: WidgetStatePropertyAll<Size>(
                      Size(width * 0.4, height * 0.06),
                    ),
                  ),
                  child: Text(
                    "Generate",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),

            Container(
              width: width * 0.7,
              height: width * 0.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xFFD9D9D9),
                border: Border.all(width: 2.0, color: Colors.teal),
              ),
              child: Center(
                child: SizedBox(
                  width: width * 0.65,
                  height: width * 0.65,
                  child: Center(
                    child:
                        qrcodeText.isNotEmpty
                            ? QrImageView(data: qrcodeText)
                            : Text(
                              "Enter the text to generate QRCode",
                              style: TextStyle(color: Colors.teal),
                            ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
