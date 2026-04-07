import 'package:diska_app/features/checkout/data/model/checkout_model.dart';
import 'package:diska_app/features/checkout/logic/cubits/checkout_cubit/checkout_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit()
    : super(
        CheckoutUpdated(
          CheckoutModel(
            name: '',
            phone: '',
            addressDetails: '',
            subtotal: 2500,
            tax: 350,
          ),
        ),
      );
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final notesController = TextEditingController();

  CheckoutModel get model => (state as CheckoutUpdated).model;

  void updateName(String value) {
    model.name = value;
    emit(CheckoutUpdated(model));
  }

  void updatePhone(String value) {
    model.phone = value;
    emit(CheckoutUpdated(model));
  }

  void selectGovernorate(String value) {
    model.governorate = value;
    emit(CheckoutUpdated(model));
  }

  void selectCity(String value) {
    model.city = value;
    emit(CheckoutUpdated(model));
  }

  void updateAddress(String value) {
    model.addressDetails = value;
    emit(CheckoutUpdated(model));
  }

  void updateNotes(String value) {
    model.notes = value;
    emit(CheckoutUpdated(model));
  }

  void changePayment(PaymentMethod method) {
    model.paymentMethod = method;
    emit(CheckoutUpdated(model));
  }

  void changeDeliveryTime(String value) {
    model.deliveryTime = value;
    emit(CheckoutUpdated(model));
  }
}
