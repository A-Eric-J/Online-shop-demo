import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:pixelfield_test_app/repository/repository.dart';
import 'wine_state.dart';

class WineCubit extends Cubit<WineState> {
  final Repository wineRepository;

  WineCubit(this.wineRepository) : super(WineInitial());

  Future<void> fetchWines() async {
    emit(WineLoading());
    try {
      var result =  await Connectivity().checkConnectivity();
      print('result: $result');
      if (result.first != ConnectivityResult.none) {
        final wines = await wineRepository.fetchWines();
        await wineRepository.saveWines(wines);
        emit(WineLoaded(wines));
      } else {
        final wines = await wineRepository.getLocalWines();
        emit(WineLoaded(wines));
      }
    } catch (e) {
      emit(WineError(e.toString()));
    }
  }
}
