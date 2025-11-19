class SignUpModel {
  final String email;
  final String password;
  final String confirmPassword;
  final String? firstName;
  final String? lastName;
  final String? phone;
  final String? address;

  SignUpModel({
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.address,
  });
  Map<String, dynamic> toJson(data) {
    return {
      'email': email,
      'password': password,
      'confirmpassword': confirmPassword,
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
      'address': address,
    };
  }

}