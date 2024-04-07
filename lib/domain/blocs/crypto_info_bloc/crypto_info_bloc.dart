import 'package:bloc/bloc.dart';
import 'package:cryptocurrency_chart_app/data/exceptions.dart';
import 'package:cryptocurrency_chart_app/domain/models/crypto_model.dart';
import 'package:cryptocurrency_chart_app/domain/repositories/crypto_repository.dart';

part 'crypto_info_event.dart';
part 'crypto_info_state.dart';

class CryptoInfoBloc extends Bloc<CryptoInfoEvent, CryptoInfoState> {
  late final CryptoRepository _cryptoRepository;

  static const List<String> cryptoSymbols = [
    "BTC",
    "ETH",
    "SOL",
    "XRP",
    "LTC",
    "DOT",
    "DOGE",
    "AVAX",
    "ADA"
  ];

  CryptoInfoBloc({required CryptoRepository cryptoRepository})
      : _cryptoRepository = cryptoRepository,
        super(CryptoInfoState()) {
    on<CryptoAInfoLoadCryptoChartEvent>(_onLoadCryptoChart);
  }

  Future<void> _onLoadCryptoChart(
    CryptoAInfoLoadCryptoChartEvent event,
    Emitter<CryptoInfoState> emit,
  ) async {
    emit(CryptoInfoLoadingState());

    CryptocurrencyRepoPattern cryptoRepoPattern =
        await _cryptoRepository.getCryptoModels(
      cryptoSymbols: cryptoSymbols,
    );

    switch (cryptoRepoPattern) {
      case (ApiException failure, null):
        return emit(CryptoInfoFailureState(failure: failure));
      case (null, final List<CryptoModel> resCryptoModels):
        return emit(
          CryptoInfoLoadedState(
            cryptoModels: resCryptoModels,
            cryptoSymbol: event.cryptoSymbol,
          ),
        );
    }
  }
}
