class OfferState {
  final int currentIndex;

  OfferState({required this.currentIndex});

  OfferState copyWith({int? currentIndex}) {
    return OfferState(currentIndex: currentIndex ?? this.currentIndex);
  }
}
