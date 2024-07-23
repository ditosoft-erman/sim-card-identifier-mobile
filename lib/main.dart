import 'package:flutter/material.dart';

import 'prefix_utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: NumberIdentifier());
  }
}

class NumberIdentifier extends StatefulWidget {
  @override
  _NumberIdentifierState createState() => _NumberIdentifierState();
}

class _NumberIdentifierState extends State<NumberIdentifier> {
  final TextEditingController _controller = TextEditingController();

  String _imageAsset = '';

  void _identifyNumber() {
    final inputNumber = _controller.text;
    if (checkGlobePrefix(inputNumber)) {
      setState(() {
        _imageAsset = 'assets/image/globe.png';
      });
    } else if (checkTmPrefix(inputNumber)) {
      setState(() {
        _imageAsset = 'assets/image/tm.png';
      });
    } else if (checkDitoPrefix(inputNumber)) {
      setState(() {
        _imageAsset = 'assets/image/dito.png';
      });
    } else if (checkSmartPrefix(inputNumber)) {
      setState(() {
        _imageAsset = 'assets/image/smart.png';
      });
    } else if (checkTntPrefix(inputNumber)) {
      setState(() {
        _imageAsset = 'assets/image/tnt.png';
      });
    } else {
      setState(() {
        _imageAsset = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Number Identifier'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_imageAsset.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Image.asset(
                  _imageAsset,
                  width: 250, // Adjust the width as needed
                  height: 250, // Adjust the height as needed
                ),
              ),
            Container(
              width: 200, // Set a specific width for the TextField
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center, // Center text alignment
                decoration: InputDecoration(
                  hintText: 'Input number here',
                ),
                onChanged: (text) => _identifyNumber(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
