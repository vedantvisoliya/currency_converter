import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() => _CurrencyConverterMaterialPageState();
}

class _CurrencyConverterMaterialPageState extends State<CurrencyConverterMaterialPage> {

  // variables
  double convertedInrValue = 0;
  double exchangeRateUsdToInr = 87.05;
  double usdInputValue = 0;

  final border = OutlineInputBorder(
    borderSide: BorderSide(
      style: BorderStyle.solid,
      strokeAlign: BorderSide.strokeAlignInside,
      width: 2,
    ),
    borderRadius: BorderRadius.circular(15),
  );

  // controller
  TextEditingController textEditingController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 52, 92, 140),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 52, 92, 140),
        title: const Text(
          '''Currency Converter''',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "₹ ${convertedInrValue != 0 ? convertedInrValue.toStringAsFixed(2) : convertedInrValue.toStringAsFixed(0)}",
              style: TextStyle(
                color: Colors.black,  
                fontSize: 45,
                fontWeight: FontWeight.bold,
              ), 
            ),
            const Text(
              "Exchange rate USD to INR is ₹87.05",
              style: TextStyle(
                color: Colors.black54,
                fontFamily: 'Poppins',
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10 ,bottom: 5),
              padding: EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.monetization_on),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white30,
                  enabledBorder: border,
                  focusedBorder: border,
                  hintText: "Enter Amount in USD",
                  hintStyle: TextStyle(
                    fontSize: 17,
                    fontFamily: 'Poppins',
                    color: Colors.black,
                  ),
                ),
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                ),
                controller: textEditingController,
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              child: ElevatedButton(
                onPressed: (){
                  setState(() {
                    usdInputValue = double.parse(textEditingController.text);
                    convertedInrValue = usdInputValue * exchangeRateUsdToInr;
                  });
                },
                style: ButtonStyle(
                  backgroundColor: const WidgetStatePropertyAll(Colors.black),
                  foregroundColor: const WidgetStatePropertyAll(Colors.white),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                ),
                child: const Text(
                  "convert",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                    color: Color.fromARGB(240, 255, 255, 255),
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