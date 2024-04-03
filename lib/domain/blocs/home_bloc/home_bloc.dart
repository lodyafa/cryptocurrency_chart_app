import 'package:bloc/bloc.dart';
import 'package:cryptocurrency_chart_app/data/exceptions.dart';
import 'package:cryptocurrency_chart_app/domain/models/crypto_model.dart';
import 'package:cryptocurrency_chart_app/domain/repositories/crypto_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  late final CryptoRepository _cryptoRepository;

  static const List<String> cryptoSymbols = [
    "BTC",
    "ETH",
    "SOL",
    "XRP",
    "LTC",
  ];

  HomeBloc({required CryptoRepository cryptoRepository})
      : _cryptoRepository = cryptoRepository,
        super(HomeState()) {
    on<HomeLoadCryptoChartEvent>(_onLoadCryptoChart);
  }

  Future<void> _onLoadCryptoChart(
      HomeLoadCryptoChartEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());

    CryptocurrencyRepoPattern cryptoRepoPattern =
        await _cryptoRepository.getCryptoModels(cryptoSymbols: cryptoSymbols);

    switch (cryptoRepoPattern) {
      case (ApiException failure, null):
        return emit(HomeFailureState(failure: failure));
      case (null, final List<CryptoModel> resCryptoModels):
        return emit(HomeLoadedState(cryptoModels: resCryptoModels));
    }
    // await Future.delayed(const Duration(milliseconds: 150));
    // return emit(HomeLoadedState(cryptoModels: []));
  }
}
