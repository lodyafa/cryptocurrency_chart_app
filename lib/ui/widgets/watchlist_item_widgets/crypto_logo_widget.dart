import 'package:cryptocurrency_chart_app/ui/widgets/data_formatter.dart';
import 'package:flutter/material.dart';

class CryptoLogoWidget extends StatelessWidget {
  const CryptoLogoWidget({
    super.key,
    this.symbol,
  });

  final String? symbol;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(
            DataFormatter.getCryptoLogoPath(
              cryptoSymbol: symbol,
            ),
          ),
        ),
      ),
    );
  }
}