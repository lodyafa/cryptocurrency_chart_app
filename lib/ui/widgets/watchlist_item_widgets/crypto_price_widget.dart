import 'package:cryptocurrency_chart_app/ui/style/app_colors.dart';
import 'package:flutter/material.dart';

class CryptoPriceWidget extends StatelessWidget {
  const CryptoPriceWidget({super.key, this.cryptoSymbol});

  final String? cryptoSymbol;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.centerRight,
          width: 70,
          child: Text(
            cryptoSymbol!,
            style: const TextStyle(
              color: AppColors.white,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        const SizedBox(height: 5),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.arrow_drop_up_rounded,
              color: AppColors.green,
            ),
            Text(
              "+1.6%",
              style: TextStyle(
                color: AppColors.green,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
