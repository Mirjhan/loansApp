class SignUpRequest {
  String email = "";
  String password = "";
  String firstName = "";
  String lastName = "";
  String phoneNumber = "";

  SignUpRequest({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
  });

  factory SignUpRequest.fromJson(Map<String, dynamic> json) => SignUpRequest(
      email: json['email'],
      password: json['password'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      phoneNumber: json['phoneNumber']);

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
        'firstName': firstName,
        'lastName': lastName,
        'phoneNumber': phoneNumber,
      };
}
