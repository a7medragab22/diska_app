class RegisterState {
  final bool isLoading;
  final String? error;
  final bool isSuccess;
  final bool isMerchant;

  RegisterState({
    this.isLoading = false,
    this.error,
    this.isSuccess = false,
    this.isMerchant = false,
  });

  RegisterState copyWith({
    bool? isLoading,
    String? error,
    bool? isSuccess,
    bool? isMerchant,
  }) {
    return RegisterState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      isSuccess: isSuccess ?? this.isSuccess,
      isMerchant: isMerchant ?? this.isMerchant,
    );
  }
}