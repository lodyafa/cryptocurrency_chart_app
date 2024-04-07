import 'package:cryptocurrency_chart_app/domain/repositories/crypto_repository.dart';
import 'package:cryptocurrency_chart_app/ui/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptourrencyChartApp extends StatelessWidget {
  const CryptourrencyChartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => CryptoRepository(),
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
      ),
    );
  }
}
