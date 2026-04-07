import 'package:diska_app/features/checkout/data/model/checkout_model.dart';

abstract class CheckoutState {}

class CheckoutInitial extends CheckoutState {}

class CheckoutUpdated extends CheckoutState {
  final CheckoutModel model;

  CheckoutUpdated(this.model);
}