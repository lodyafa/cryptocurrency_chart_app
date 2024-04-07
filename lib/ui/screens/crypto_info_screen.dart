import 'package:cryptocurrency_chart_app/domain/blocs/crypto_info_bloc/crypto_info_bloc.dart';
import 'package:cryptocurrency_chart_app/domain/models/crypto_model.dart';
import 'package:cryptocurrency_chart_app/domain/repositories/crypto_repository.dart';
import 'package:cryptocurrency_chart_app/ui/style/app_colors.dart';
import 'package:cryptocurrency_chart_app/ui/widgets/crypto_info_widgets/crypto_info_body.dart';
import 'package:cryptocurrency_chart_app/ui/widgets/crypto_info_widgets/crypto_info_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoInfoScreen extends StatelessWidget {
  const CryptoInfoScreen({
    super.key,
    required this.cryptoModel,
  });

  final CryptoModel cryptoModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CryptoInfoBloc(
        cryptoRepository: RepositoryProvider.of<CryptoRepository>(context),
      )..add(
          CryptoAInfoLoadCryptoChartEvent(
            cryptoSymbol: cryptoModel.symbol ?? "BTC",
          ),
        ),
      child: Scaffold(
        appBar: CryptoInfoAppBar(cryptoModel: cryptoModel),
        backgroundColor: AppColors.background,
        body: const CryptoInfoBody(),
      ),
    );
  }
}
