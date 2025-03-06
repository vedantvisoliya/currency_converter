import 'package:flutter/material.dart';
import 'package:currency_converter/currency_converter_material_page.dart';

void main(){
  runApp(MyMaterialApp());
}

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Currency Converter",
      home: CurrencyConverterMaterialPage(),
    );
  }
}
