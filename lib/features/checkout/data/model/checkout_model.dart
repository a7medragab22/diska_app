class CheckoutModel {
  String name;
  String phone;
  String? governorate;
  String? city;
  String addressDetails;
  String? notes;

  String deliveryTime;
  PaymentMethod paymentMethod;

  double subtotal;
  double shipping;
  double tax;

  CheckoutModel({
    required this.name,
    required this.phone,
    this.governorate,
    this.city,
    required this.addressDetails,
    this.notes,
    this.deliveryTime = "any",
    this.paymentMethod = PaymentMethod.cashOnDelivery,
    required this.subtotal,
    this.shipping = 0,
    required this.tax,
  });

  double get total => subtotal + shipping + tax;
}

enum PaymentMethod { cashOnDelivery, bankTransfer }
