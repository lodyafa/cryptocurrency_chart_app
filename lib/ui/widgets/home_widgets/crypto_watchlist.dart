import 'package:cryptocurrency_chart_app/domain/models/crypto_model.dart';
import 'package:cryptocurrency_chart_app/ui/routes/app_routes.dart';
import 'package:cryptocurrency_chart_app/ui/widgets/watchlist_item_widgets/watchlist_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CryptoWatchlist extends StatelessWidget {
  const CryptoWatchlist({
    super.key,
    required this.cryptoModels,
  });

  final List<CryptoModel> cryptoModels;
  @override
  Widget build(BuildContext context) {
    if (cryptoModels.isEmpty) {
      return const Center(
        child: Text("No data"),
      );
    }

    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.zero,
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: () => context.push(
              AppRoutes.cryptoInfo,
              extra: cryptoModels[i],
            ),
            child: SizedBox(
              height: 75,
              child: WatchlistItem(cryptoModel: cryptoModels[i]),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemCount: cryptoModels.length,
      ),
    );
  }
}
