import 'package:flutter/cupertino.dart';
import 'package:money_convert/models/currency_model.dart';

class MoneyConverted extends StatelessWidget {
  const MoneyConverted({
    super.key,
    this.currency,
    this.convertedCurrency,
  });

  final Currency? currency;
  final String? convertedCurrency;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              currency?.name ?? '',
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Cotação feita em:',
            ),
            Text(
              currency?.updatedAtDate ?? '',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Proço de oferta:',
            ),
            Text(
              currency?.bidPrice ?? '',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Conversão:',
            ),
            Text(
              convertedCurrency ?? '',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
