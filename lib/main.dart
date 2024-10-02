import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double result = 0; // Holds the converted value
  TextEditingController textEditingController = TextEditingController();

  borders() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color: Colors.brown, width: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 30,
          shadowColor: Colors.black,
          backgroundColor: Colors.deepOrange,
          title: Text(
            "Amogh App",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "\₹ $result", // Display the result with currency symbol
                style: TextStyle(
                  color: Colors.brown,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                    hintText: "Enter Your Currency In USD",
                    prefixIcon: Icon(Icons.monetization_on_outlined),
                    prefixIconColor: Colors.brown,
                    focusedBorder: borders(),
                    enabledBorder: borders(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 300, right: 300),
                child: TextButton(
                  style: TextButton.styleFrom(
                    elevation: 11,
                    shape: BeveledRectangleBorder(
                      side: BorderSide(width: 1, color: Colors.black),
                    ),
                    backgroundColor: Colors.deepOrange,
                    maximumSize: Size(double.infinity, 50),
                    foregroundColor: Colors.white,
                    shadowColor: Colors.black54,
                  ),
                  onPressed: () {
                    // Parse and calculate the result when button is pressed
                    setState(() {
                      double? fromText =
                          double.tryParse(textEditingController.text);
                      if (fromText != null) {
                        result = fromText * 83.78; // Conversion logic
                      } else {
                        result = 0; // Reset if input is invalid
                      }
                    });
                  },
                  child: Text("Convert"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
