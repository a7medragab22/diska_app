import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'offer_state.dart';

class OfferCubit extends Cubit<OfferState> {
  OfferCubit() : super(OfferState(currentIndex: 0));

  Timer? _timer;

  void startAutoSlide(int length) {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      final next = (state.currentIndex + 1) % length;

      if (next != state.currentIndex) {
        emit(state.copyWith(currentIndex: next));
      }
    });
  }

  void changeIndex(int index) {
    if (index == state.currentIndex) return;
    emit(state.copyWith(currentIndex: index));
  }

  void stop() {
    _timer?.cancel();
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}