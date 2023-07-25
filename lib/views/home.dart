import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_convert/components/MoneyConverted.dart';
import 'package:money_convert/models/currency_model.dart';
import 'package:money_convert/services/api_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController fromCurrencyController = TextEditingController();
  TextEditingController toCurrencyController = TextEditingController();
  TextEditingController valueCurrencyController = TextEditingController();

  Currency? currency;
  ApiService apiService = ApiService();
  String feedBackCalc = 'Calcular';
  String? convertedCurrency;
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
        title: const Text('Conversor de moeda'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: fromCurrencyController,
              decoration: InputDecoration(
                labelText: 'De qual moeda voce quer converter?',
                errorText: errorText,
              ),
            ),
            TextField(
              controller: toCurrencyController,
              decoration: InputDecoration(
                labelText: 'Para qual moeda voce quer converter?',
                errorText: errorText,
              ),
            ),
            TextField(
              controller: valueCurrencyController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Qual valor voce quer converter?',
                errorText: errorText,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                calcCurrency();
              },
              child: Text(feedBackCalc),
            ),
            MoneyConverted(
              convertedCurrency: convertedCurrency,
              currency: currency,
            ),
          ],
        ),
      ),
    );
  }

  String calc(double bidPrice) {
    return (bidPrice * double.parse(valueCurrencyController.text)).toString();
  }

  void calcCurrency() {
    if (fromCurrencyController.text.isEmpty ||
        toCurrencyController.text.isEmpty ||
        valueCurrencyController.text.isEmpty) {
      setState(() {
        errorText = 'Campo obrigatorio!';
      });

      return;
    }
    setState(() {
      feedBackCalc = 'Calculando';
      errorText = null;
    });
    apiService
        .getCurrency(
            '${fromCurrencyController.text}-${toCurrencyController.text}')
        .then((value) => {
              setState(() {
                currency = value.first;
                convertedCurrency = calc(double.parse(currency!.bidPrice));
                feedBackCalc = 'Calcular';
              })
            });
  }
}
