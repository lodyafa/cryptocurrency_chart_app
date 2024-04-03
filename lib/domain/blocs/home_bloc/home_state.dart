part of 'home_bloc.dart';

class HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeLoadedState extends HomeState {
  final List<CryptoModel> cryptoModels;

  HomeLoadedState({required this.cryptoModels});
}

final class HomeFailureState extends HomeState {
  final ApiException failure;

  HomeFailureState({required this.failure});

}
