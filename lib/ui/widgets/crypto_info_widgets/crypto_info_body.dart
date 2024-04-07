import 'package:cryptocurrency_chart_app/data/exceptions.dart';
import 'package:cryptocurrency_chart_app/domain/blocs/crypto_info_bloc/crypto_info_bloc.dart';
import 'package:cryptocurrency_chart_app/domain/models/crypto_model.dart';
import 'package:cryptocurrency_chart_app/ui/style/app_colors.dart';
import 'package:cryptocurrency_chart_app/ui/widgets/custom_buttons.dart';
import 'package:cryptocurrency_chart_app/ui/widgets/home_widgets/crypto_watchlist.dart';
import 'package:cryptocurrency_chart_app/ui/widgets/data_formatter.dart';
import 'package:cryptocurrency_chart_app/ui/widgets/failure_widget.dart';
import 'package:cryptocurrency_chart_app/ui/widgets/line_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoInfoBody extends StatelessWidget {
  const CryptoInfoBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CryptoInfoBloc, CryptoInfoState>(
      builder: (context, state) {
        if (state is CryptoInfoFailureState) {
          switch (state.failure) {
            case ApiException.network:
              return FailureWidget(
                failure: state.failure,
                icon: Icons.wifi_off,
              );
            default:
              return FailureWidget(
                failure: state.failure,
                icon: Icons.error,
              );
          }
        }

        if (state is CryptoInfoLoadingState) {
          return CryptoInfoContent.loading(context);
        }

        if (state is CryptoInfoLoadedState) {
          return Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: CryptoInfoContent(
              cryptoModels: state.cryptoModels,
              cryptoSymbol: state.cryptoSymbol,
            ),
          );
        }

        return CryptoInfoContent.loading(context);
      },
    );
  }
}

class CryptoInfoContent extends StatelessWidget {
  const CryptoInfoContent({
    super.key,
    required this.cryptoSymbol,
    required this.cryptoModels,
  });

  static Widget loading(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  final String cryptoSymbol;
  final List<CryptoModel> cryptoModels;

  @override
  Widget build(BuildContext context) {
    return Column(
      // padding: EdgeInsets.zero,
      children: [
        CryptoInfoPrice(
          cryptoModel: cryptoModels.firstWhere(
            (value) => value.symbol == cryptoSymbol,
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ChartPeriodButton(text: "24H", onPressed: () {}),
              ChartPeriodButton(text: "1W", onPressed: () {}),
              ChartPeriodButton(text: "1M", onPressed: () {}),
              ChartPeriodButton(text: "1Y", onPressed: () {}),
              ChartPeriodButton(text: "All", onPressed: () {}),
            ],
          ),
        ),
        const SizedBox(
          height: 264,
          child: LineChartWidget(
            borderData: true,
            gridData: true,
            titlesData: true,
          ),
        ),
        const SizedBox(height: 10),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomColoredButton(
              height: 45,
              width: 135,
              text: "Buy",
              color: AppColors.green,
            ),
            SizedBox(width: 15),
            CustomColoredButton(
              height: 45,
              width: 135,
              text: "Sell",
              color: AppColors.red,
            ),
          ],
        ),
        const SizedBox(height: 10),
        CryptoWatchlist(cryptoModels: cryptoModels),
      ],
    );
  }
}

class CryptoInfoPrice extends StatelessWidget {
  const CryptoInfoPrice({super.key, required this.cryptoModel});

  final CryptoModel cryptoModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 60,
          width: 6,
          decoration: BoxDecoration(
            color: AppColors.green,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DataFormatter.formatCryptoPrice(
                cryptoPrice: cryptoModel.usdPrice,
              ),
              style: const TextStyle(
                fontSize: 32,
                color: AppColors.white,
              ),
            ),
            const Row(
              children: [
                Icon(
                  Icons.arrow_drop_up_rounded,
                  color: AppColors.green,
                ),
                Text(
                  "105 (%0.8)",
                  style: TextStyle(
                    fontSize: 10,
                    color: AppColors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class ChartPeriodButton extends StatelessWidget {
  const ChartPeriodButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
      ),
    );
  }
}
