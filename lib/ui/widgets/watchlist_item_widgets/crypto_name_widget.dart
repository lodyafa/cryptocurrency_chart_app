import 'package:cryptocurrency_chart_app/ui/style/app_colors.dart';
import 'package:cryptocurrency_chart_app/ui/widgets/data_formatter.dart';
import 'package:flutter/material.dart';

class CryptoNameWidget extends StatelessWidget {
  const CryptoNameWidget({super.key, this.cryptoSymbol});

  final String? cryptoSymbol;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 80,
          child: Text(
            DataFormatter.cryptoSymbolToFullName(
              cryptoSymbol: cryptoSymbol,
            ),
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
                overflow: TextOverflow.ellipsis),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          cryptoSymbol ?? "none",
          style: const TextStyle(
            color: AppColors.grey,
          ),
        ),
      ],
    );
  }
}