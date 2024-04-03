import 'package:cryptocurrency_chart_app/ui/routes/app_router.dart';
import 'package:flutter/material.dart';

class CryptourrencyChartApp extends StatelessWidget {
  const CryptourrencyChartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
    );
  }
}
