class RegisterModel {
  final String name;
  final String phone;
  final String password;
  final String? businessName;
  final String? commercialRegister;
  final String? taxCard;
  final String role; // customer | merchant

  RegisterModel({
    required this.name,
    required this.phone,
    required this.password,
    required this.role,
    this.businessName,
    this.commercialRegister,
    this.taxCard,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "phone": phone,
      "password": password,
      "role": role,
      "business_name": businessName,
      "commercial_register": commercialRegister,
      "tax_card": taxCard,
    };
  }
}