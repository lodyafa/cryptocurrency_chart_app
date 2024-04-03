import 'package:cryptocurrency_chart_app/domain/models/crypto_model.dart';
import 'package:cryptocurrency_chart_app/ui/style/app_colors.dart';
import 'package:cryptocurrency_chart_app/ui/widgets/line_chart_widget.dart';
import 'package:cryptocurrency_chart_app/ui/widgets/watchlist_item_widgets/crypto_logo_widget.dart';
import 'package:cryptocurrency_chart_app/ui/widgets/watchlist_item_widgets/crypto_name_widget.dart';
import 'package:cryptocurrency_chart_app/ui/widgets/watchlist_item_widgets/crypto_price_widget.dart';
import 'package:flutter/material.dart';

class WatchlistItem extends StatelessWidget {
  const WatchlistItem({super.key, required this.cryptoModel});

  final CryptoModel cryptoModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74,
      decoration: BoxDecoration(
        color: AppColors.watchlistItemColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CryptoLogoWidget(symbol: cryptoModel.symbol),
            const SizedBox(width: 8),
            CryptoNameWidget(cryptoSymbol: cryptoModel.symbol),
            const SizedBox(width: 15),
            const SizedBox(
              width: 85,
              height: 35,
              child: LineChartWidget(),
            ),
            const SizedBox(width: 20),
            CryptoPriceWidget(
              cryptoSymbol: cryptoModel.usdPrice.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
