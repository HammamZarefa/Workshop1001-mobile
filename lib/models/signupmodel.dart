class SignUpModel {
  final String email;
  final String password;
  final String? firstName;
  final String? lastName;
  final String? phone;
  final String? address;

  SignUpModel({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.address,
  });
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
      'address': address,
    };
  }
}