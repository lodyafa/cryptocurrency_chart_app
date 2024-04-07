import 'package:cryptocurrency_chart_app/data/exceptions.dart';
import 'package:cryptocurrency_chart_app/domain/blocs/home_bloc/home_bloc.dart';
import 'package:cryptocurrency_chart_app/domain/models/crypto_model.dart';
import 'package:cryptocurrency_chart_app/ui/style/app_colors.dart';
import 'package:cryptocurrency_chart_app/ui/widgets/home_widgets/crypto_watchlist.dart';
import 'package:cryptocurrency_chart_app/ui/widgets/user_portfolio_card.dart';
import 'package:cryptocurrency_chart_app/ui/widgets/failure_widget.dart';
import 'package:cryptocurrency_chart_app/ui/widgets/home_widgets/home_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          const HomeAppBar(
            userName: "Madina",
          ),
        ];
      },
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeFailureState) {
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

          if (state is HomeLoadingState) {
            return HomeContent.loading(context);
          }

          if (state is HomeLoadedState) {
            return Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
              ),
              child: HomeContent(cryptoModels: state.cryptoModels),
            );
          }

          return HomeContent.loading(context);
        },
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({
    super.key,
    required this.cryptoModels,
  });

  static Widget loading(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  final List<CryptoModel> cryptoModels;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const UserPortfolioCard(),
        const SizedBox(height: 10),
        const Text(
          "Watchlist",
          style: TextStyle(
            color: AppColors.white,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 12),
        CryptoWatchlist(cryptoModels: cryptoModels),
      ],
    );
  }
}
